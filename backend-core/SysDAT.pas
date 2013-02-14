unit SysDAT;

{$mode objfpc}{$H+}

{
为什么这里会有一个如此奇葩的单元呢？
因为SysData里面已经有Time这个变量了，
不能用这个系统函数…………所以…………你懂的
}

interface

uses
  Classes, SysUtils;

Function AtDAT:string;
Function GetTimeSlice(s:string):integer;
Function GetMonthString:string;

implementation

var
  t:TDateTime;
  hh,mm,ss,ms,year,month,day:word;
  tmp:integer;
  stmp:string;

Function GetMonthString:string;
var
  iyear,imonth:integer;
begin
  t:=Date();
  DecodeDate(t,year,month,day);
  iyear:=year;
  imonth:=month;
  result:=IntToStr(iyear)+'-'+IntToStr(imonth);
end;

Function AtDAT:string;
begin
  result:='[' + DateToStr(Date()) + ' ';
  t:=Time();
  DecodeTime(t,hh,mm,ss,ms);
  stmp:=TimeToStr(t)+'.'+IntToStr(ms)+']';
  result:=result+stmp;
end;

Function GetTimeSlice(s:string):integer;
begin
  Delete(s,1,11);
  t:=StrToTime(s);
  DecodeTime(t,hh,mm,ss,ms);
  tmp:=hh*60+mm;
  result:=(tmp div 30)+1;
end;

end.
