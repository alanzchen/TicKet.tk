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
}
procedure TConsoleServer.DoRun;
var
  Days,tgr:string;
  id,day,i:integer;
  cmdline:string;
  EcptJump:boolean;
begin
  OpenLog;                       //打开日志文件
  Days:=ParamStr(1);             //载入多少天的数据
  day:=-1;
  if Days='1day' then day:=1;
  if Days='2day' then day:=2;
  ResetData;

  //取几天的数据库的文件路径
  Day1DB:=ParamStr(2);
  Day2DB:=ParamStr(3);

  cmdline:='';
  for i:=0 to 4 do cmdline:=cmdline+ParamStr(i)+' ';
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
          EcptJump:=true;
          tgr:=GetTWCodeByID(id);
          AddLog('Now calculating target to '+tgr);
          try
            DPSearch(tgr);
            AddLog('Calculation of target to '+tgr+' over. Now writing database.');
            EcptJump:=false;
          except
            on E:Exception do AddLog('Exception happened. Details : '+E.ClassName+':'+E.Message);
          end;
          if EcptJump then continue;
          try
            WriteDataToSQLite(tgr);
            AddLog('Write database over.');
          except
            on E:Exception do AddLog('Exception happened. Details : '+E.ClassName+':'+E.Message);
          end;
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
        OutputDB:=ParamStr(4);                 //只有两天时，第四个参数为输出的数据库名字
        TotalTime:=day*24*2;
        for id:=1 to RouterNumber do
        begin
          EcptJump:=false;
          tgr:=GetTWCodeByID(id);
          AddLog('Now calculating target to '+tgr);
          try
            DPSearch(tgr);
            AddLog('Calculation of target to '+tgr+' over. Now writing database.');
            EcptJump:=false;
          except
            on E:Exception do AddLog('Exception happened. Details : '+E.ClassName+':'+E.Message);
          end;
          if EcptJump then continue;
          try
            WriteDataToSQLite(tgr);
            AddLog('Write database over.');
          except
            on E:Exception do AddLog('Exception happened. Details : '+E.ClassName+':'+E.Message);
          end;
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

