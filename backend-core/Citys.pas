unit Citys;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

const
  CityNumber  = 180;
  CityData:array[1..CityNumber] of string =
  (
  ('ACX'),('CAN'),('HFE'),('PEK'),
  ('KWL'),('AKU'),('AOG'),('BSD'),
  ('AQG'),('BFU'),('CGQ'),('BPX'),
  ('CGD'),('CSX'),('CIH'),('CZX'),
  ('CHG'),('CTU'),('CIF'),('CKG'),
  ('DAX'),('DIG'),('DLC'),('DLU'),
  ('DDG'),('DAT'),('DYG'),('DNH'),
  ('ENH'),('FYN'),('JNZ'),('KOW'),
  ('GOQ'),('GHN'),('AAT'),('BAV'),
  ('KWE'),('HRB'),('HAK'),('HLD'),
  ('HMI'),('HGH'),('HZG'),('AKA'),
  ('HEK'),('HNY'),('HTN'),('HKG'),
  ('TXN'),('HYN'),('HET'),('JMU'),
  ('JGN'),('JIL'),('TNA'),('JNG'),
  ('JDZ'),('JHG'),('JJN'),('FOC'),
  ('CHW'),('JIU'),('KRY'),('KHG'),
  ('KRL'),('KMG'),('KCA'),('LHW'),
  ('LNJ'),('LXA'),('LYG'),('LJG'),
  ('LYI'),('LZH'),('LYA'),('LZO'),
  ('MFM'),('LUM'),('MXZ'),('MDG'),
  ('MIG'),('KHN'),('NAO'),('NKG'),
  ('NNG'),('NTG'),('NNY'),('NNN'),
  ('NGB'),('IQM'),('TAO'),('IQN'),
  ('SHP'),('NDG'),('JUZ'),('SYX'),
  ('SHA'),('PVG'),('SWA'),('SHS'),
  ('SZX'),('SHE'),('SJW'),('SYM'),
  ('SZV'),('TCG'),('TYN'),('TSN'),
  ('TNH'),('TGO'),('TEN'),('WXN'),
  ('WEF'),('WEH'),('WNZ'),('WUH'),
  ('WJD'),('HLH'),('URC'),('WUS'),
  ('WUZ'),('XMN'),('XIY'),('XFN'),
  ('XIC'),('XIL'),('XNN'),('XUZ'),
  ('ENY'),('YNJ'),('YNT'),('YBP'),
  ('YIH'),('INC'),('YIN'),('YIW'),
  ('UYN'),('BHY'),('ZHA'),('CGO'),
  ('HSN'),('ZUH'),('ZYI'),('TSA'),
  ('TPE'),('TNN'),('KHH'),('TTG'),
  ('HLN'),('CYI'),('TXG'),('JZH'),
  ('WUX'),('NAY'),('NLT'),('LZY'),
  ('WUA'),('PZI'),('NZH'),('KGT'),
  ('HJJ'),('HDG'),('YNZ'),('AVA'),
  ('AEB'),('WNH'),('YUS'),('LLB'),
  ('KJI'),('DSN'),('HZH'),('OHE'),
  ('NBS'),('TCZ'),('ZHY'),('YCU'),
  ('DOY'),('THQ'),('CNI'),('ZAT')
  );

Function GetTWCodeByID(Const ID:integer):string;        //获取编号对应的三字码
Function GetIDByTWCode(Const Code:string):integer;      //获得三字码的城市编号

implementation

Function GetTWCodeByID(Const ID:integer):string;
begin
  result:=CityData[ID];
end;

Function GetIDByTWCode(Const Code:string):integer;
var
  i:integer;
begin
  result:=0;                    //三字码不存在
  for i:=1 to CityNumber do
  begin
    if CityData[i]=Code then
    begin
      result:=i;
      break;
    end;
  end;
end;

end.
