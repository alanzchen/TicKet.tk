<?PHP
$citiescn = array(北海,广州,合肥,北京,桂林,阿克苏,鞍山,保山,安庆,蚌埠,长春,昌都,常德,长沙,长治,常州,朝阳,成都,赤峰,重庆,达州,迪庆,大连,大理,丹东,大同,张家界,敦煌,恩施,富蕴,锦州,赣州,格尔木,广汉,阿勒泰,包头,贵阳,哈尔滨,海口,海拉尔,哈密,杭州,汉中,安康,黑河,衡阳,和田,香港,黄山,台州,呼和浩特,佳木斯,嘉峪关,吉林,济南,济宁,景德镇,景洪,泉州,福州,酒泉,九江,克拉玛依,喀什,库尔勒,昆明,库车,兰州,临沧,拉萨,连云港,丽江,临沂,柳州,洛阳,泸州,澳门,芒市,梅县,牡丹江,绵阳,南昌,南充,南京,南宁,南通,南阳,黑河,宁波,且末,青岛,庆阳,秦皇岛,齐齐哈尔,衢州,三亚,上海,上海,汕头,沙市,深圳,沈阳,石家庄,普洱,苏州,塔城,太原,天津,通化,通辽,铜仁,重庆,潍坊,威海,温州,武汉,武汉,乌兰浩特,乌鲁木齐,武夷山,梧州,厦门,西安,襄樊,西昌,锡林浩特,西宁,徐州,延安,延吉,烟台,宜宾,宜昌,银川,伊宁,义乌,榆林,昭通,湛江,郑州,舟山,珠海,遵义,台北,台北,台南,高雄,台东,花莲,嘉义,台中,九寨沟,无锡,北京,那拉提,林芝,乌海,攀枝花,满洲里,康定,怀化,邯郸,盐城,安顺,百色,文山,玉树藏族自治州,荔波,布尔津,鄂尔多斯,黎平,漠河,长白山,腾冲,中卫,运城,东营,天水,大连,贵阳);
$citiesszm = array(BHY,CAN,HFE,PEK,KWL,AKU,AOG,BSD,AQG,BFU,CGQ,BPX,CGD,CSX,CIH,CZX,CHG,CTU,CIF,CKG,DAX,DIG,DLC,DLU,DDG,DAT,DYG,DNH,ENH,FYN,JNZ,KOW,GOQ,GHN,AAT,BAV,KWE,HRB,HAK,HLD,HMI,HGH,HZG,AKA,HEK,HNY,HTN,HKG,TXN,HYN,HET,JMU,JGN,JIL,TNA,JNG,JDZ,JHG,JJN,FOC,CHW,JIU,KRY,KHG,KRL,KMG,KCA,LHW,LNJ,LXA,LYG,LJG,LYI,LZH,LYA,LZO,MFM,LUM,MXZ,MDG,MIG,KHN,NAO,NKG,NNG,NTG,NNY,NNN,NGB,IQM,TAO,IQN,SHP,NDG,JUZ,SYX,SHA,PVG,SWA,SHS,SZX,SHE,SJW,SYM,SZV,TCG,TYN,TSN,TNH,TGO,TEN,WXN,WEF,WEH,WNZ,WUH,WJD,HLH,URC,WUS,WUZ,XMN,XIY,XFN,XIC,XIL,XNN,XUZ,ENY,YNJ,YNT,YBP,YIH,INC,YIN,YIW,UYN,ZAT,ZHA,CGO,HSN,ZUH,ZYI,TSA,TPE,TNN,KHH,TTG,HLN,CYI,TXG,JZH,WUX,NAY,NLT,LZY,WUA,PZI,NZH,KGT,HJJ,HDG,YNZ,AVA,AEB,WNH,YUS,LLB,KJI,DSN,HZH,OHE,NBS,TCZ,ZHY,YCU,DOY,THQ,CNI,ACX);
$citiesszmutf = array();
$time = 0;
$flightdate = date("Y-m-d",strtotime("+1months")); 
if(file_exists($flightdate.".txt")){
}
else{
$fp = fopen($flightdate.".txt", 'a');
foreach ($citiescn as & $value) {
	$citiesszmutf[$time]=escape($value);
	$time=$time + 1;
}
$time2 = sizeof($citiesszmutf);
for($a=0; $a<$time2; $a++){
	
	for($b=0; $b<$time2; $b++){
		$urlget = "http://flights.ctrip.com/booking/".$citiesszm[$a]."-".$citiesszm[$b]."/?DCityName1=".$citiesszmutf[$a]."&ACityName1=".$citiesszmutf[$b]."&DDatePeriod1=".$flightdate."&sourcepage=openbaidu";
		$text=file_get_contents($urlget);
		preg_match_all('#<input id=.FlightList[^>]*>#i', $text, $match); 
		foreach ($match[0] as & $valuestr) {
			preg_match('/value="(.*?)"/',$valuestr,$matched);
			echo $matched[1]."<br>";
			$strt = substr($matched[1],0,19);
			$strte = substr($matched[1],20,19);
			echo $valuestr[1]."<br>";
			fwrite($fp,$matched[1]."|".$strt."从".$citiescn[$a]."起飞,飞往".$citiescn[$b].",将于".$strte."到达"."\r\n");
		}
	}

}
}

function escape($str) {
	preg_match_all("/[\xc2-\xdf][\x80-\xbf]+|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}|[\x01-\x7f]+/e",$str,$r);
	$str = $r[0];
	$l = count($str);
	for($i=0; $i<$l; $i++){
		$value = ord($str[$i][0]);
		$str[$i] = "%u".strtoupper(bin2hex(iconv("UTF-8","UCS-2",$str[$i])));
	}
	return join("",$str);
}
?>
