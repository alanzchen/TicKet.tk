﻿unit Citys;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

const
  CityNumber  = 180;
  {
    CityData原来应该是('%中文名%','%三字码%')的，但是由于Lazarus
    在1.0.4的版本上提示有其他编码的字符集字符而无法通过，而且设置
    {$PageCode utf8}或者{$PageCode AnsiString}都无法解决。所以，
    我查了一下其他代码的依存关系，发现那群中文城市名居然是没有用
    的。我懒得改其他接口和代码，就直接把中文的城市名删掉了。同时
    下面所有带ChnName的函数都失效了。
  }
  CityData:array[1..CityNumber,1..2] of string =        
  (
  ('','ACX'),('','CAN'),('','HFE'),('','PEK'),
  ('','KWL'),('','AKU'),('','AOG'),('','BSD'),
  ('','AQG'),('','BFU'),('','CGQ'),('','BPX'),
  ('','CGD'),('','CSX'),('','CIH'),('','CZX'),
  ('','CHG'),('','CTU'),('','CIF'),('','CKG'),
  ('','DAX'),('','DIG'),('','DLC'),('','DLU'),
  ('','DDG'),('','DAT'),('','DYG'),('','DNH'),
  ('','ENH'),('','FYN'),('','JNZ'),('','KOW'),
  ('','GOQ'),('','GHN'),('','AAT'),('','BAV'),
  ('','KWE'),('','HRB'),('','HAK'),('','HLD'),
  ('','HMI'),('','HGH'),('','HZG'),('','AKA'),
  ('','HEK'),('','HNY'),('','HTN'),('','HKG'),
  ('','TXN'),('','HYN'),('','HET'),('','JMU'),
  ('','JGN'),('','JIL'),('','TNA'),('','JNG'),
  ('','JDZ'),('','JHG'),('','JJN'),('','FOC'),
  ('','CHW'),('','JIU'),('','KRY'),('','KHG'),
  ('','KRL'),('','KMG'),('','KCA'),('','LHW'),
  ('','LNJ'),('','LXA'),('','LYG'),('','LJG'),
  ('','LYI'),('','LZH'),('','LYA'),('','LZO'),
  ('','MFM'),('','LUM'),('','MXZ'),('','MDG'),
  ('','MIG'),('','KHN'),('','NAO'),('','NKG'),
  ('','NNG'),('','NTG'),('','NNY'),('','NNN'),
  ('','NGB'),('','IQM'),('','TAO'),('','IQN'),
  ('','SHP'),('','NDG'),('','JUZ'),('','SYX'),
  ('','SHA'),('','PVG'),('','SWA'),('','SHS'),
  ('','SZX'),('','SHE'),('','SJW'),('','SYM'),
  ('','SZV'),('','TCG'),('','TYN'),('','TSN'),
  ('','TNH'),('','TGO'),('','TEN'),('','WXN'),
  ('','WEF'),('','WEH'),('','WNZ'),('','WUH'),
  ('','WJD'),('','HLH'),('','URC'),('','WUS'),
  ('','WUZ'),('','XMN'),('','XIY'),('','XFN'),
  ('','XIC'),('','XIL'),('','XNN'),('','XUZ'),
  ('','ENY'),('','YNJ'),('','YNT'),('','YBP'),
  ('','YIH'),('','INC'),('','YIN'),('','YIW'),
  ('','UYN'),('','BHY'),('','ZHA'),('','CGO'),
  ('','HSN'),('','ZUH'),('','ZYI'),('','TSA'),
  ('','TPE'),('','TNN'),('','KHH'),('','TTG'),
  ('','HLN'),('','CYI'),('','TXG'),('','JZH'),
  ('','WUX'),('','NAY'),('','NLT'),('','LZY'),
  ('','WUA'),('','PZI'),('','NZH'),('','KGT'),
  ('','HJJ'),('','HDG'),('','YNZ'),('','AVA'),
  ('','AEB'),('','WNH'),('','YUS'),('','LLB'),
  ('','KJI'),('','DSN'),('','HZH'),('','OHE'),
  ('','NBS'),('','TCZ'),('','ZHY'),('','YCU'),
  ('','DOY'),('','THQ'),('','CNI'),('','ZAT')
  );

Function GetTWCodeByID(Const ID:integer):string;        //获取编号对应的三字码
Function GetIDByTWCode(Const Code:string):integer;      //获得三字码的城市编号
{
Function GetChnNameByTWCode(Const Code:string):string;  //获得三字码对应的城市名
Function GetTWCodeByChnName(Const Name:string):string;  //获得城市名对应的三字码
Function GetChnNameByID(Const ID:integer):string;       //获取编号对应的城市名
Function GetIDByChnName(Const Name:string):integer;     //获得中文城市名的编号
}

implementation

Function GetTWCodeByID(Const ID:integer):string;
begin
  result:=CityData[ID,2];
end;

Function GetIDByTWCode(Const Code:string):integer;
var
  i:integer;
begin
  result:=0;                    //三字码不存在
  for i:=1 to CityNumber do
  begin
    if CityData[i,2]=Code then
    begin
      result:=i;
      break;
    end;
  end;
end;

{

Function GetChnNameByTWCode(Const Code:string):string;
var
  i:integer;
begin
  result:='No such city';       //城市名不存在
  for i:=1 to CityNumber do
  begin
    if CityData[i,2]=Code then
    begin
      result:=CityData[i,1];
      break;
    end;
  end;
end;

Function GetTWCodeByChnName(Const Name:string):string;
var
  i:integer;
begin
  result:='No such code';       //三字码不存在
  for i:=1 to CityNumber do
  begin
    if CityData[i,1]=Name then
    begin
      result:=CityData[i,2];
      break;
    end;
  end;
end;

Function GetChnNameByID(Const ID:integer):string;
begin
  result:=CityData[ID,1];
end;

Function GetIDByChnName(Const Name:string):integer;
var
  i:integer;
begin
  result:=0;                   //城市名不存在
  for i:=1 to CityNumber do
  begin
    if CityData[i,1]=Name then
    begin
      result:=i;
      break;
    end;
  end;
end;

}

end.