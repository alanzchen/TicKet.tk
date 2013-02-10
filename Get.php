<?PHP
//一些设置
$txtpath = "/home/wwwroot/ticket/db/";
//程序
$citiescn = array(北海,广州,合肥,北京,桂林,阿克苏,鞍山,保山,安庆,蚌埠,长春,昌都,常德,长沙,长治,常州,朝阳,成都,赤峰,重庆,达州,迪庆,大连,大理,丹东,大同,张家界,敦煌,恩施,富蕴,锦州,赣州,格尔木,广汉,阿勒泰,包头,贵阳,哈尔滨,海口,海拉尔,哈密,杭州,汉中,安康,黑河,衡阳,和田,香港,黄山,台州,呼和浩特,佳木斯,嘉峪关,吉林,济南,济宁,景德镇,景洪,泉州,福州,酒泉,九江,克拉玛依,喀什,库尔勒,昆明,库车,兰州,临沧,拉萨,连云港,丽江,临沂,柳州,洛阳,泸州,澳门,芒市,梅县,牡丹江,绵阳,南昌,南充,南京,南宁,南通,南阳,黑河,宁波,且末,青岛,庆阳,秦皇岛,齐齐哈尔,衢州,三亚,上海,上海,揭阳,沙市,深圳,沈阳,石家庄,普洱,苏州,塔城,太原,天津,通化,通辽,铜仁,重庆,潍坊,威海,温州,武汉,武汉,乌兰浩特,乌鲁木齐,武夷山,梧州,厦门,西安,襄樊,西昌,锡林浩特,西宁,徐州,延安,延吉,烟台,宜宾,宜昌,银川,伊宁,义乌,榆林,昭通,湛江,郑州,舟山,珠海,遵义,台北,台北,台南,高雄,台东,花莲,嘉义,台中,九寨沟,无锡,北京,那拉提,林芝,乌海,攀枝花,满洲里,康定,怀化,邯郸,盐城,安顺,百色,文山,玉树藏族自治州,荔波,布尔津,鄂尔多斯,黎平,漠河,长白山,腾冲,中卫,运城,东营,天水,大连,贵阳);
$jc = array(北海福城机场,广州白云机场,合肥骆岗机场,北京首都机场,桂林两江机场,阿克苏机场,鞍山机场,保山云瑞机场,安庆（天柱山）机场,蚌埠机场,长春龙嘉国际机场,西藏昌都邦达机场,常德桃花源（斗姆湖）机场,长沙黄花机场,长治王村机场,常州奔牛机场,辽宁朝阳机场,成都双流机场,赤峰玉龙机场,重庆江北机场,达州（河市）机场,迪庆香格里拉机场,大连国际机场,大理荒草坝机场,丹东浪头机场,大同云冈机场,张家界荷花机场,敦煌机场,恩施机场,富蕴机场,锦州小岭子机场,赣州黄金机场,格尔木机场,广汉机场,阿勒泰机场,包头二里半机场,贵阳龙洞堡机场,哈尔滨太平机场,海口美兰机场,内蒙古海拉尔东山机场,哈密机场,杭州萧山机场,汉中西关机场,安康机场,黑河机场,衡阳东江机场,和田机场,香港赤鱲角国际机场,黄山屯溪机场,台州路桥（原黄岩路桥）机场,呼和浩特白塔国际机场,佳木斯机场,嘉峪关机场,吉林二台子机场,济南遥墙机场,济宁机场,景德镇罗家机场,景洪（西双版纳）机场,泉州晋江机场,福州长乐机场,酒泉机场,九江庐山机场,克拉玛依机场,喀什机场,库尔勒机场,昆明长水机场,库车机场,兰州机场,临沧机场,拉萨贡嘎机场,连云港白塔埠机场,丽江三义机场,临沂沭埠岭机场,柳州白莲机场,洛阳机场,泸州蓝田机场,澳门机场,芒市机场,梅县机场,牡丹江海浪机场,绵阳南郊机场,南昌昌北机场,南充高坪机场,南京禄口机场,南宁吴圩机场,南通兴东机场,南阳姜营机场,嫩江机场,宁波栎社机场,且末机场,青岛流亭机场,庆阳机场,秦皇岛山海关机场,齐齐哈尔三家子机场,衢州机场,三亚凤凰机场,上海虹桥机场,上海浦东机场,揭阳潮汕机场,荆州沙市机场,深圳宝安机场,沈阳桃仙机场,石家庄正定机场,普洱（思茅）机场,苏州机场,塔城机场,太原武宿机场,天津滨海机场,通化机场,通辽机场,铜仁凤凰机场,重庆万州五桥机场,潍坊机场,威海文登大水泊机场,温州永强机场,武汉天河机场,武汉王家墩国际机场,乌兰浩特机场,乌鲁木齐地窝堡机场,武夷山机场,广西梧州长洲岛机场,厦门高崎机场,西安咸阳机场,襄樊机场,西昌青山机场,锡林浩特机场,西宁曹家堡机场,徐州观音机场,延安二十里铺机场,延吉朝阳川机场,烟台莱山机场,宜宾（菜坝）机场,宜昌三峡机场,银川河东机场,伊宁机场,义乌机场,榆林榆阳机场,昭通机场,湛江机场,郑州新郑机场,舟山普陀山朱家尖机场,珠海金湾机场,遵义新舟机场,台北松山机场,桃园（原中正）机场,台南机场,高雄机场,台东志航机场,花莲机场,嘉义机场,台中清泉岗机场,九寨沟黄龙（九黄）机场,无锡硕放机场,北京南苑机场,那拉提机场,林芝机场,乌海机场,攀枝花保安营机场,呼伦贝尔满洲里西郊机场,康定机场,怀化芷江机场,河北邯郸机场,江苏盐城南洋机场,贵州安顺黄果树机场,广西百色（田阳）机场,云南文山普者黑机场,青海玉树三江源（巴塘）机场,荔波机场,新疆喀纳斯机场,鄂尔多斯伊金霍洛机场,贵州黎平机场,漠河古莲机场,长白山机场,腾冲（驼峰）机场,中卫（香山、沙坡头）机场,运城张孝机场,东营永安机场,甘肃天水机场,长海（大长山岛）机场,贵阳龙洞堡机场);
$citiesszm = array(BHY,CAN,HFE,PEK,KWL,AKU,AOG,BSD,AQG,BFU,CGQ,BPX,CGD,CSX,CIH,CZX,CHG,CTU,CIF,CKG,DAX,DIG,DLC,DLU,DDG,DAT,DYG,DNH,ENH,FYN,JNZ,KOW,GOQ,GHN,AAT,BAV,KWE,HRB,HAK,HLD,HMI,HGH,HZG,AKA,HEK,HNY,HTN,HKG,TXN,HYN,HET,JMU,JGN,JIL,TNA,JNG,JDZ,JHG,JJN,FOC,CHW,JIU,KRY,KHG,KRL,KMG,KCA,LHW,LNJ,LXA,LYG,LJG,LYI,LZH,LYA,LZO,MFM,LUM,MXZ,MDG,MIG,KHN,NAO,NKG,NNG,NTG,NNY,NNN,NGB,IQM,TAO,IQN,SHP,NDG,JUZ,SYX,SHA,PVG,SWA,SHS,SZX,SHE,SJW,SYM,SZV,TCG,TYN,TSN,TNH,TGO,TEN,WXN,WEF,WEH,WNZ,WUH,WJD,HLH,URC,WUS,WUZ,XMN,XIY,XFN,XIC,XIL,XNN,XUZ,ENY,YNJ,YNT,YBP,YIH,INC,YIN,YIW,UYN,ZAT,ZHA,CGO,HSN,ZUH,ZYI,TSA,TPE,TNN,KHH,TTG,HLN,CYI,TXG,JZH,WUX,NAY,NLT,LZY,WUA,PZI,NZH,KGT,HJJ,HDG,YNZ,AVA,AEB,WNH,YUS,LLB,KJI,DSN,HZH,OHE,NBS,TCZ,ZHY,YCU,DOY,THQ,CNI,ACX);
$citiesszmutf = array();
$flightdate = date("Y-m-d",strtotime("+1months")); 
if(file_exists($txtpath.$flightdate.".txt")){
}
else{
	$time = 0;
	$fp = fopen($txtpath.$flightdate.".txt", 'a');
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
				fwrite($fp,$matched[1]."|"."于".$strt."从".$jc[$a]."起飞,飞往".$jc[$b].",将于".$strte."到达"."\r\n");
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
