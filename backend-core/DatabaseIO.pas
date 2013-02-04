unit DatabaseIO;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Citys, DB, SysData, sqlite3ds, SysDAT;

Procedure LoadDBFromText(const fname:string;const TimeOffset:integer);
Procedure ResetData;
Procedure WriteDataToSQLite(City:string);

implementation


{
  由于一开始没有找到合适的文档和教程，我用了一种很低级粗暴的做法
  结果时间复杂度太高了，解决不了。后来终于找到一份教程，然后对着
  教程弄了半天，才弄出了一个可行的版本。在这个我浪费了22个小时……
}
Procedure WriteDataToSQLite(City:string);  //City参数为目的地城市的三字码
var
  i,j:integer;
  s:array[1..10] of string;
  ssaved:integer;
begin
  SQLite3:=TSQLite3Dataset.Create(AOwner); //创建一个新的对象
  with SQLite3 do
  begin
    FileName := OutputDB;                  //设定文件名
    TableName := 'ticket_data';                   //全部写到一张表里
    if not TableExists then                //如果表不存在，创建表头
    begin
      FieldDefs.Clear;
      FieldDefs.Add('Id', ftAutoInc);      //貌似不写这句是不行的
      FieldDefs.Add('Source',ftString);
      FieldDefs.Add('Target',ftString);
      FieldDefs.Add('DirectFly',ftString);
      FieldDefs.Add('Cost',ftInteger);
      FieldDefs.Add('MoneySaved',ftInteger);
      FieldDefs.Add('PlaneNum',ftInteger);
      FieldDefs.Add('Plane1',ftString);
      FieldDefs.Add('Plane2',ftString);
      FieldDefs.Add('Plane3',ftString);
      FieldDefs.Add('Plane4',ftString);
      FieldDefs.Add('Plane5',ftString);
      FieldDefs.Add('Plane6',ftString);
      FieldDefs.Add('Plane7',ftString);
      FieldDefs.Add('Plane8',ftString);
      FieldDefs.Add('Plane9',ftString);
      FieldDefs.Add('Plane10',ftString);
      CreateTable;
    end;
    Open;
  end;

  for i:=1 to RouterNumber do        //对数据进行操作
  begin
    SQLite3.Append;                  //追加一行数据
    for j:=1 to MaxJump do s[j]:=Solve[i].PName[j];
    SQLite3.FieldByName('Source').AsString    := GetTWCodeByID(i);
    SQLite3.FieldByName('Target').AsString    := City;
    SQLite3.FieldByName('DirectFly').AsString := Direct[i];
    SQLite3.FieldByName('Cost').AsInteger     := Solve[i].TotalCost ;
    SQLite3.FieldByName('PlaneNum').AsInteger := Solve[i].JumpNum;
    if DCost[i]-Solve[i].TotalCost>10000
      then ssaved:=0
      else ssaved:=DCost[i]-Solve[i].TotalCost;
    SQLite3.FieldByName('MoneySaved').AsInteger := ssaved;
    for j:=1 to MaxJump do s[j]:=Solve[i].PName[j];
    SQLite3.FieldByName('Plane1').AsString:= s[1];
    SQLite3.FieldByName('Plane2').AsString:= s[2];
    SQLite3.FieldByName('Plane3').AsString:= s[3];
    SQLite3.FieldByName('Plane4').AsString:= s[4];
    SQLite3.FieldByName('Plane5').AsString:= s[5];
    SQLite3.FieldByName('Plane6').AsString:= s[6];
    SQLite3.FieldByName('Plane7').AsString:= s[7];
    SQLite3.FieldByName('Plane8').AsString:= s[8];
    SQLite3.FieldByName('Plane9').AsString:= s[9];
    SQLite3.FieldByName('Plane10').AsString:= s[10];
    SQLite3.Post;                    //提交此行数据
  end;

  SQLite3.ApplyUpdates;              //数据库改变，更新数据
  SQLite3.Free;
end;

{
参数： s     待解析的字符串
       Param 待返回的信息

抓网页的同志们给出了这样的数据：
2013-01-20 08:00:00|2013-01-20 09:15:00|BHY|CAN|CZ|M|690|航班信息
所以数据格式为
出发时间|到达时间|出发地|到达地|航班公司|航班大中小|价格|航班信息

日……当我上面的没说……抓网页的偷懒了木有剪切字符串，变成了
出发时间|到达时间|出发地|到达地|航班公司|航班大中小|价格|杂…信…息|航班信息
这是一个样例：
2013-01-20 16:20:00|2013-01-20 19:40:00|BHY|PEK|CA|M|4740|372716|5|7|1,2,32,30|10.0|N|F|2013-01-20 16:20:00从北海起飞飞往北京，2013-01-20 19:40:00到达

航班信息原来只包括起飞时间、到达时间和起飞地点到达地点，我后面会加上一个价格
}
Procedure GetParam(s:string;var Param:PlaneInfo);
var
  i,j,time1,time2,pos1,k:integer;
  tmp:array[1..8] of string;
begin
  i:=1;
  j:=0;
  s:=s+'|';
  repeat
    while s[i]<>'|' do inc(i);
    inc(j);
    tmp[j]:=copy(s,1,i-1);
    delete(s,1,i);
    i:=1;
    if j=7 then //把杂信息去除掉
    begin
      k:=0;
      for pos1:=1 to length(s) do
      begin
        if s[pos1]='|' then inc(k);
        if k=7 then break;
      end;
      delete(s,1,pos1);
    end;
  until length(s)=0;
  tmp[8]:=tmp[8]+' '+tmp[7];      //加上一个价格
  time1:=GetTimeSlice(tmp[1]);
  time2:=GetTimeSlice(tmp[2]);
  if time2<time1 then time2:=time2+2*24;  //第二天了，加上48个时间片
  with Param do
  begin
    SourceCode:=tmp[3];
    TargetCode:=tmp[4];
    SourceID:=GetIDByTWCode(SourceCode);
    TargetID:=GetIDByTWCode(TargetCode);
    LeaveTime:=Time1;
    ArriveTime:=Time2;
    PlaneName:=tmp[8];
    Price:=StrToInt(tmp[7]);
  end;
end;

Procedure ResetData;
var
  i,j:integer;
begin
  //初始化填充数据，设为最大值表示断路
  fillchar(Time,SizeOf(Time),1);
  fillchar(Cost,SizeOf(Cost),1);
  fillchar(DCost,SizeOf(DCost),1);
  fillchar(f,SizeOf(f),1);
end;

{
参数：fname      读入数据库文件地址
      TimeOffset 载入开始到第几个时间段
                 即如果是第二天第三天的数据，值分别为24*1+1和24*2+1

其实我应该老老实实地写一个读SQL数据库的函数的，但是我又懒得大改……
于是我就把调试用的函数改了个名字，然后再写一个读SQL的函数，让那个
函数把结果写到文本里面去再读一次，这样多省事儿啊………………
而且！读完以后是要排序的！因为我不确定数据库里读出来的是按我的要求，
即出发时间升序排列的。但是我的程序必须用这样的数据，要不然记录起来
相当麻烦。
}
Procedure LoadDBFromText(const fname:string;const TimeOffset:integer);
var
  i,j:integer;
  inf:text;
  s:UTF8string;
  InfoData:PlaneInfo;
  NowSource,NowTarget:integer;  //当前的出发路由和目的路由
  LeaveBefore:integer;          //上一个信道出发时间
begin
  NowSource:=-1;
  NowTarget:=-1;
  AssignFile(inf,fname);
  Reset(inf);

  readln(inf,s);
  repeat
    try
      GetParam(s,InfoData);
    except
      AddLog('Exception happened when reading data, invalid integer format occured. Data line : '+s);
    end;
    with InfoData do   //注意，时间记录到数组的时候有自动偏移，不需要手动设置
    begin
      //如果变更了边，则重新记录当前边和初始化上一个出发时间
      if (NowSource<>SourceID) or (NowTarget<>TargetID) then //新的边
      begin
        LeaveBefore:=1;
        NowSource:=SourceID;
        NowTarget:=TargetID;
      end;
      //写记录。注意有出发时间偏移
      for i:=LeaveTime-1 downto LeaveBefore do
      begin
        Time[SourceID,TargetID,i+TimeOffset-1]:=ArriveTime;      //记录出发时间到数组
        Cost[SourceID,TargetID,i+TimeOffset-1]:=Price;           //记录跳转费用到数组
        PathName[SourceID,TargetID,i+TimeOffset-1]:=PlaneName;   //记录信道名称到数组
      end;
      LeaveBefore:=LeaveTime;  //记录当前出发时间，供下次使用
    end;
    readln(inf,s);
  until (s='END') or (s='');

  for i:=1 to TotalTime do
    for j:=1 to RouterNumber do
    Cost[j,j,i]:=0;                //自己到自己，无花费

  Close(inf);

end;

end.

