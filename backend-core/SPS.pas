program SPS;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp,
  Citys, SysData, SearchKernel, DatabaseIO, SysDAT
  { you can add units after this };

type

  { TConsoleServer }

  TConsoleServer = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;

{ TConsoleServer }

{
关于输入的格式:
如果只有一天的数据，则为"ExeName 1day %第一天数据库路径% %写出数据库路径%"
如果只有两天的数据，则为"ExeName 2day %第一天数据库路径% %第二天数据库路径% %写出数据库路径%"
如果有三天的数据  ，则为"ExeName 3day %第一天数据库路径% %第二天数据库路径% %第三天数据库路径% %写出数据库路径%"
}
procedure TConsoleServer.DoRun;
var
  Days,tgr:string;
  id,day,i:integer;
  cmdline:string;
begin
  OpenLog;                       //打开日志文件
  Days:=ParamStr(1);             //载入多少天的数据
  day:=-1;
  if Days='1day' then day:=1;
  if Days='2day' then day:=2;
  if Days='3day' then day:=3;
  ResetData;

  //取几天的数据库的文件路径
  Day1DB:=ParamStr(2);
  Day2DB:=ParamStr(3);
  Day3DB:=ParamStr(4);

  cmdline:='';
  for i:=0 to 5 do cmdline:=cmdline+ParamStr(i)+' ';
  AddLog('Start up command line is : '+cmdline);

  Case day of
    1:begin
        Day1DBText:=Day1DB;
        OutputDB:=Day2DB;                       //只有一天时，第三个参数为输出的数据库名字
        TotalTime:=day*24*2;
        LoadDBFromText(Day1DBText,1);           //读入数据
        AddLog('Load database 1 over.');
        for id:=1 to RouterNumber do
        begin
          tgr:=GetTWCodeByID(id);
          AddLog('Now calculating target to '+tgr);
          DPSearch(tgr);
          AddLog('Calculation of target to '+tgr+' over. Now writing database.');
          WriteDataToSQLite(tgr);
          AddLog('Write database over.');
        end;
        AddLog('Calculation over. Now terminate.');
      end;
    2:begin
        Day1DBText:=Day1DB;
        LoadDBFromText(Day1DBText,1);          //读入数据
        AddLog('Load database 1 over.');
        Day2DBText:=Day2DB;
        LoadDBFromText(Day2DBText,1*2*24+1);   //读入数据
        AddLog('Load database 2 over.');
        OutputDB:=Day3DB;                      //只有两天时，第四个参数为输出的数据库名字
        TotalTime:=day*24*2;
        for id:=1 to RouterNumber do
        begin
          tgr:=GetTWCodeByID(id);
          AddLog('Now calculating target to '+tgr);
          DPSearch(tgr);
          AddLog('Calculation of target to '+tgr+' over. Now writing database.');
          WriteDataToSQLite(tgr);
          AddLog('Write database over.');
        end;
        AddLog('Calculation over. Now terminate.');
      end;
    3:begin                      //有三天时，第五个参数为输出的数据库名字
        Day1DBText:=Day1DB;
        LoadDBFromText(Day1DBText,1);            //读入数据
        AddLog('Load database 1 over.');
        Day2DBText:=Day2DB;
        LoadDBFromText(Day2DBText,2*24+1);       //读入数据
        AddLog('Load database 2 over.');
        Day3DBText:=Day3DB;
        LoadDBFromText(Day3DBText,2*2*24+1);     //读入数据
        AddLog('Load database 3 over.');
        OutputDB:=ParamStr(5);
        TotalTime:=day*24*3;
        for id:=1 to RouterNumber do
        begin
          tgr:=GetTWCodeByID(id);
          if id=RouterNumber then break;   //不知道为什么，一定要屏蔽掉最后一个点……
          AddLog('Now calculating target to '+tgr);
          DPSearch(tgr);
          AddLog('Calculation of target to '+tgr+' over. Now writing database.');
          WriteDataToSQLite(tgr);
          AddLog('Write database over.');
        end;
        AddLog('Calculation over. Now terminate.');
      end;
      -1:begin
        AddLog('Start up command line error. Now terminate.')
      end;
  end;
  CloseLog;
  Terminate;
end;

constructor TConsoleServer.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException:=True;
end;

destructor TConsoleServer.Destroy;
begin
  inherited Destroy;
end;

procedure TConsoleServer.WriteHelp;
begin
end;

var
  Application: TConsoleServer;

{$IFDEF WINDOWS}{$R SPS.rc}{$ENDIF}

begin
  Application:=TConsoleServer.Create(nil);
  Application.Title:='ShortestPathSearch';
  AOwner:=Application.Owner;
  Application.Run;
  Application.Free;
end.

