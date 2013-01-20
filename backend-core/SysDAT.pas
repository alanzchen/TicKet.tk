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

implementation

Function AtDAT:string;
begin
  result:='[' + DateToStr(Date()) + ' ' + TimeToStr(Time()) + ']';
end;

Function GetTimeSlice(s:string):integer;
var
  t:TDateTime;
  hh,mm,ss,ms:word;
  tmp:integer;
begin
  Delete(s,1,11);
  t:=StrToTime(s);
  DecodeTime(t,hh,mm,ss,ms);
  tmp:=hh*60+mm;
  result:=(tmp div 30)+1;
end;

end.

