unit SearchKernel;

{$mode objfpc}{$H+}

interface

uses
  SysData,Citys;

Procedure DPSearch(const TgrCode:string);

implementation

Procedure DPSearch(const TgrCode:string);
var
  UsedTime    : integer;
  NowRouter   : integer;
  NewRouter   : integer;
  ArriveTime  : integer;
  ArriveCost  : integer;
  i,TgrID,j   : integer;
  StartRouter : integer;
  NowTime     : integer;
begin
  TgrID:=GetIDByTWCode(TgrCode);     //取目标路由编号

  //一开始的时候，所有路由的前继路由为自身
  for i:=1 to RouterNumber do
    for j:=1 to MaxTimeSection do Path[i,j]:=i;

  for NowRouter:=1 to RouterNumber do   //直接能到达的，先记录
    for UsedTime:=1 to TotalTime do
      begin
        f[NowRouter,UsedTime]:=Cost[NowRouter,TgrID,UsedTime];
        if f[NowRouter,UsedTime]<>FillcharMax then path[NowRouter,UsedTime]:=TgrID;
      end;

  for i:=1 to RouterNumber do
  begin
    f[i,TotalTime]:=Cost[i,TgrID,TotalTime];   //初始化最终状态
    if f[i,TotalTime]<>FillcharMax             //可跳转的路由，记录之
      then Path[i,TotalTime]:=TgrID;
  end;
  { 实际上上面的处理有点偷懒，因为这意味着最后一个时间段有跳转路径都可以记录采用
    不过有什么关系呢，反正最后一个航班能到就可以了嘛 }

  {下面这一段是搜索的核心内容}
  for UsedTime:=TotalTime downto 1 do
  begin
    for NowRouter:=1 to RouterNumber do
    begin
      if f[NowRouter,UsedTime+1]<f[NowRouter,UsedTime] then
      begin
        f[NowRouter,UsedTime]:=f[NowRouter,UsedTime+1];      //当前时间段不行动，取下一个时间段的最优解
        Path[NowRouter,UsedTime]:=Path[NowRouter,UsedTime+1];
      end;
      for NewRouter:=1 to RouterNumber do                  //遍历路由表，寻找新中继路由
      begin
        ArriveTime:=Time[NowRouter,NewRouter,UsedTime];    //跳转到中继路由的时间
        ArriveCost:=Cost[NowRouter,NewRouter,UsedTime];     //跳转到中继路由的代价

        if (ArriveCost=FillcharMax)
        or (ArriveTime=FillcharMax) then continue;         //无效跳转，放弃

        if f[NowRouter,UsedTime]>f[NewRouter,ArriveTime+1]+ArriveCost then  //比较当前方案与跳转方案
        begin                                                               //若更优，则保存
          f[NowRouter,UsedTime]:=f[NewRouter,ArriveTime+1] + ArriveCost;
          Path[NowRouter,UsedTime]:=NewRouter;
        end;
      end;
    end;
  end;

  { 先清空结果池 }
  for i:=1 to RouterNumber do
  begin
    solve[i].JumpNum:=0;
    for j:=1 to MaxJump do solve[i].PName[j]:='';
  end;
 { 下面开始写结果 }
  for StartRouter:=1 to RouterNumber do
  begin
    Solve[StartRouter].JumpNum:=0;         //初始化跳转数为0
    Solve[StartRouter].TotalCost:=f[StartRouter,1];
    NowTime:=1;                            //初始化初始时间段为1
    NowRouter:=StartRouter;                //设置初始路由
    NewRouter:=Path[NowRouter,NowTime];    //设置首个中继路由
    while NowRouter<>TgrID do              //只要当前路由不是最终目的路由
    begin
      if NewRouter<>FillcharMax then
      begin
        with Solve[StartRouter] do           //追加跳转路径
        begin
          inc(JumpNum);
          PName[JumpNum]:=PathName[NowRouter,NewRouter,NowTime];
        end;

        NowTime:=Time[NowRouter,NewRouter,NowTime];  //取跳转时间
        NowRouter:=NewRouter;                        //跳转到中转路由

        if NowTime<>FillcharMax
        then NewRouter:=Path[NowRouter,NowTime]      //存在，取下一个中转路由
        else begin
          NowRouter:=TgrID;                       //不存在，结束
          dec(Solve[StartRouter].JumpNum);
        end;
      end
      else NowRouter:=TgrID;
    end;
  end;
end;

end.

