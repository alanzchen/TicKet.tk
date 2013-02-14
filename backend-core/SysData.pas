unit SysData;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Citys, DB, sqlite3ds, SysDAT;

{$Define Release}

const

  MaxDay = 2;
  MaxJump = 10;
  FillCharMax = 16843009;

  {$IFDEF DebugMode}
  RouterNumber = 5;
  MaxTimeSection = 20+1;
  {$ENDIF}

  {$IFDEF Release}
  RouterNumber = CityNumber;
  MaxTimeSection = MaxDay*24*2+1;  //注意！为什么要加1呢？因为搜索的时候会
  {$ENDIF}                         //有越出边界1个数组的临界状态，需要处理

  _Day1 = 1;
  _Day2 = 2;

  ver        = 'LianYao.Q' ;   //任何版本长度请使用9字节定长
                               //上一版本为TEST TYPE
Type
  PlaneInfo = record
    SourceCode : string;    //出发地三字码
    SourceID   : integer;   //出发地ID
    TargetCode : string;    //目的地三字码
    TargetID   : integer;   //目的地ID
    PlaneName  : string;    //航班名称
    Price      : integer;   //航班价格
    LeaveTime  : integer;   //出发时间段
    ArriveTime : integer;   //到达时间段
    { 时间段的定义：每半个小时称为一个时间段，这样抽象处理数据
      如果一个航班3：20出发，那么它的LeaveTime就是(3-1)×2+1=5
      如果一个航班14：45出发，那么它的LeaveTime就是(14-1)×2+1+1=28
      如果一个航班8：00出发，那么处理LeaveTime为(8-1)×2=14
      类似地，对于到达时间ArriveTime，给出以下几个参考：
      4：25到达 ArriveTime=(4-1)×2+1=7
      6：55到达 ArriveTime=(6-1)×2+1+1=12
      8：00到达 ArriveTime=(8-1)×2=14                               }
  end;

  Paths=record
    PName     : array[1..MaxJump] of string;    //跳转信道的名称
    JumpNum   : integer;                        //总跳转数
    TotalCost : integer;
  end;

var   //算是公用的变量吧，就写到这个单元里了，但是貌似要吃掉几十个M的内存……
  Time,Cost : array[1..RouterNumber,1..RouterNumber,1..MaxTimeSection] of longint; //到达时间，跳转费用
  PathName  : array[1..RouterNumber,1..RouterNumber,1..MaxTimeSection] of string;  //信道名称
  f         : array[1..RouterNumber,1..MaxTimeSection] of longint;                 //计算数组
  Path      : array[1..RouterNumber,1..MaxTimeSection] of integer;                 //跳转引导数组
  Solve     : array[1..RouterNumber] of Paths;                                     //搜索出来的路径
  Direct    : array[1..RouterNumber] of string;                                    //直接跳转信道
  DCost     : array[1..RouterNumber] of integer;                                   //直接跳转费用
  TotalTime : integer;

  Day1DB,Day2DB         : string;
  Day1DBText,Day2DBText : string;
  OutputDB              : string;
  SysLogFile            : string;

  SQLite3 : TSQLite3Dataset;
  AOwner  : TComponent;
  DataSrc : TDatasource;public;

Procedure OpenLog;
Procedure AddLog(msg:string);
Procedure CloseLog;

implementation

var
  logf:text;

Procedure OpenLog;
begin
  SysLogFile:=GetMonthString+'.log';
  if FileExists(SysLogFile)=false then
  begin
    AssignFile(logf,SysLogFile);
    Rewrite(logf);
    CloseFile(logf);
  end;
  AssignFile(logf,SysLogFile);
  Append(logf);
  writeln(logf,'');
  writeln(logf,'Ticket Search Project-Searching Kernel');
  writeln(output,'Ticket Search Project-Searching Kernel');
  writeln(logf,' By Enigma Huang, Version : '+ver);
  writeln(output,' By Enigma Huang, Version : '+ver);
end;

Procedure AddLog(msg:string);
begin
  writeln(logf,AtDAT+msg);
  writeln(output,AtDAT+msg);
end;

Procedure CloseLog;
begin
  CloseFile(logf);
end;

end.
