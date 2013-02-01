$(function() {
    var cities = [
          {
        value: "BHY",
        label: "北海"
      },
          {
        value: "CAN",
        label: "广州"
      },
          {
        value: "HFE",
        label: "合肥"
      },
          {
        value: "PEK",
        label: "北京"
      },
          {
        value: "KWL",
        label: "桂林"
      },
          {
        value: "AKU",
        label: "阿克苏"
      },
          {
        value: "AOG",
        label: "鞍山"
      },
          {
        value: "BSD",
        label: "保山"
      },
          {
        value: "AQG",
        label: "安庆"
      },
          {
        value: "BFU",
        label: "蚌埠"
      },
          {
        value: "CGQ",
        label: "长春"
      },
          {
        value: "BPX",
        label: "昌都"
      },
          {
        value: "CGD",
        label: "常德"
      },
          {
        value: "CSX",
        label: "长沙"
      },
          {
        value: "CIH",
        label: "长治"
      },
          {
        value: "CZX",
        label: "常州"
      },
          {
        value: "CHG",
        label: "朝阳"
      },
          {
        value: "CTU",
        label: "成都"
      },
          {
        value: "CIF",
        label: "赤峰"
      },
          {
        value: "CKG",
        label: "重庆"
      },
          {
        value: "DAX",
        label: "达州"
      },
          {
        value: "DIG",
        label: "迪庆"
      },
          {
        value: "DLC",
        label: "大连"
      },
          {
        value: "DLU",
        label: "大理"
      },
          {
        value: "DDG",
        label: "丹东"
      },
          {
        value: "DAT",
        label: "大同"
      },
          {
        value: "DYG",
        label: "张家界"
      },
          {
        value: "DNH",
        label: "敦煌"
      },
          {
        value: "ENH",
        label: "恩施"
      },
          {
        value: "FYN",
        label: "富蕴"
      },
          {
        value: "JNZ",
        label: "锦州"
      },
          {
        value: "KOW",
        label: "赣州"
      },
          {
        value: "GOQ",
        label: "格尔木"
      },
          {
        value: "GHN",
        label: "广汉"
      },
          {
        value: "AAT",
        label: "阿勒泰"
      },
          {
        value: "BAV",
        label: "包头"
      },
          {
        value: "KWE",
        label: "贵阳"
      },
          {
        value: "HRB",
        label: "哈尔滨"
      },
          {
        value: "HAK",
        label: "海口"
      },
          {
        value: "HLD",
        label: "海拉尔"
      },
          {
        value: "HMI",
        label: "哈密"
      },
          {
        value: "HGH",
        label: "杭州"
      },
          {
        value: "HZG",
        label: "汉中"
      },
          {
        value: "AKA",
        label: "安康"
      },
          {
        value: "HEK",
        label: "黑河"
      },
          {
        value: "HNY",
        label: "衡阳"
      },
          {
        value: "HTN",
        label: "和田"
      },
          {
        value: "HKG",
        label: "香港"
      },
          {
        value: "TXN",
        label: "黄山"
      },
          {
        value: "HYN",
        label: "台州"
      },
          {
        value: "HET",
        label: "呼和浩特"
      },
          {
        value: "JMU",
        label: "佳木斯"
      },
          {
        value: "JGN",
        label: "嘉峪关"
      },
          {
        value: "JIL",
        label: "吉林"
      },
          {
        value: "TNA",
        label: "济南"
      },
          {
        value: "JNG",
        label: "济宁"
      },
          {
        value: "JDZ",
        label: "景德镇"
      },
          {
        value: "JHG",
        label: "景洪"
      },
          {
        value: "JJN",
        label: "泉州"
      },
          {
        value: "FOC",
        label: "福州"
      },
          {
        value: "CHW",
        label: "酒泉"
      },
          {
        value: "JIU",
        label: "九江"
      },
          {
        value: "KRY",
        label: "克拉玛依"
      },
          {
        value: "KHG",
        label: "喀什"
      },
          {
        value: "KRL",
        label: "库尔勒"
      },
          {
        value: "KMG",
        label: "昆明"
      },
          {
        value: "KCA",
        label: "库车"
      },
          {
        value: "LHW",
        label: "兰州"
      },
          {
        value: "LNJ",
        label: "临沧"
      },
          {
        value: "LXA",
        label: "拉萨"
      },
          {
        value: "LYG",
        label: "连云港"
      },
          {
        value: "LJG",
        label: "丽江"
      },
          {
        value: "LYI",
        label: "临沂"
      },
          {
        value: "LZH",
        label: "柳州"
      },
          {
        value: "LYA",
        label: "洛阳"
      },
          {
        value: "LZO",
        label: "泸州"
      },
          {
        value: "MFM",
        label: "澳门"
      },
          {
        value: "LUM",
        label: "芒市"
      },
          {
        value: "MXZ",
        label: "梅县"
      },
          {
        value: "MDG",
        label: "牡丹江"
      },
          {
        value: "MIG",
        label: "绵阳"
      },
          {
        value: "KHN",
        label: "南昌"
      },
          {
        value: "NAO",
        label: "南充"
      },
          {
        value: "NKG",
        label: "南京"
      },
          {
        value: "NNG",
        label: "南宁"
      },
          {
        value: "NTG",
        label: "南通"
      },
          {
        value: "NNY",
        label: "南阳"
      },
          {
        value: "NNN",
        label: "黑河"
      },
          {
        value: "NGB",
        label: "宁波"
      },
          {
        value: "IQM",
        label: "且末"
      },
          {
        value: "TAO",
        label: "青岛"
      },
          {
        value: "IQN",
        label: "庆阳"
      },
          {
        value: "SHP",
        label: "秦皇岛"
      },
          {
        value: "NDG",
        label: "齐齐哈尔"
      },
          {
        value: "JUZ",
        label: "衢州"
      },
          {
        value: "SYX",
        label: "三亚"
      },
          {
        value: "SHA",
        label: "上海"
      },
          {
        value: "PVG",
        label: "上海"
      },
          {
        value: "SWA",
        label: "汕头"
      },
          {
        value: "SHS",
        label: "沙市"
      },
          {
        value: "SZX",
        label: "深圳"
      },
          {
        value: "SHE",
        label: "沈阳"
      },
          {
        value: "SJW",
        label: "石家庄"
      },
          {
        value: "SYM",
        label: "普洱"
      },
          {
        value: "SZV",
        label: "苏州"
      },
          {
        value: "TCG",
        label: "塔城"
      },
          {
        value: "TYN",
        label: "太原"
      },
          {
        value: "TSN",
        label: "天津"
      },
          {
        value: "TNH",
        label: "通化"
      },
          {
        value: "TGO",
        label: "通辽"
      },
          {
        value: "TEN",
        label: "铜仁"
      },
          {
        value: "WXN",
        label: "重庆"
      },
          {
        value: "WEF",
        label: "潍坊"
      },
          {
        value: "WEH",
        label: "威海"
      },
          {
        value: "WNZ",
        label: "温州"
      },
          {
        value: "WUH",
        label: "武汉"
      },
          {
        value: "WJD",
        label: "武汉"
      },
          {
        value: "HLH",
        label: "乌兰浩特"
      },
          {
        value: "URC",
        label: "乌鲁木齐"
      },
          {
        value: "WUS",
        label: "武夷山"
      },
          {
        value: "WUZ",
        label: "梧州"
      },
          {
        value: "XMN",
        label: "厦门"
      },
          {
        value: "XIY",
        label: "西安"
      },
          {
        value: "XFN",
        label: "襄樊"
      },
          {
        value: "XIC",
        label: "西昌"
      },
          {
        value: "XIL",
        label: "锡林浩特"
      },
          {
        value: "XNN",
        label: "西宁"
      },
          {
        value: "XUZ",
        label: "徐州"
      },
          {
        value: "ENY",
        label: "延安"
      },
          {
        value: "YNJ",
        label: "延吉"
      },
          {
        value: "YNT",
        label: "烟台"
      },
          {
        value: "YBP",
        label: "宜宾"
      },
          {
        value: "YIH",
        label: "宜昌"
      },
          {
        value: "INC",
        label: "银川"
      },
          {
        value: "YIN",
        label: "伊宁"
      },
          {
        value: "YIW",
        label: "义乌"
      },
          {
        value: "UYN",
        label: "榆林"
      },
          {
        value: "ZAT",
        label: "昭通"
      },
          {
        value: "ZHA",
        label: "湛江"
      },
          {
        value: "CGO",
        label: "郑州"
      },
          {
        value: "HSN",
        label: "舟山"
      },
          {
        value: "ZUH",
        label: "珠海"
      },
          {
        value: "ZYI",
        label: "遵义"
      },
          {
        value: "TSA",
        label: "台北"
      },
          {
        value: "TPE",
        label: "台北"
      },
          {
        value: "TNN",
        label: "台南"
      },
          {
        value: "KHH",
        label: "高雄"
      },
          {
        value: "TTG",
        label: "台东"
      },
          {
        value: "HLN",
        label: "花莲"
      },
          {
        value: "CYI",
        label: "嘉义"
      },
          {
        value: "TXG",
        label: "台中"
      },
          {
        value: "JZH",
        label: "九寨沟"
      },
          {
        value: "WUX",
        label: "无锡"
      },
          {
        value: "NAY",
        label: "北京"
      },
          {
        value: "NLT",
        label: "那拉提"
      },
          {
        value: "LZY",
        label: "林芝"
      },
          {
        value: "WUA",
        label: "乌海"
      },
          {
        value: "PZI",
        label: "攀枝花"
      },
          {
        value: "NZH",
        label: "满洲里"
      },
          {
        value: "KGT",
        label: "康定"
      },
          {
        value: "HJJ",
        label: "怀化"
      },
          {
        value: "HDG",
        label: "邯郸"
      },
          {
        value: "YNZ",
        label: "盐城"
      },
          {
        value: "AVA",
        label: "安顺"
      },
          {
        value: "AEB",
        label: "百色"
      },
          {
        value: "WNH",
        label: "文山"
      },
          {
        value: "YUS",
        label: "玉树藏族自治州"
      },
          {
        value: "LLB",
        label: "荔波"
      },
          {
        value: "KJI",
        label: "布尔津"
      },
          {
        value: "DSN",
        label: "鄂尔多斯"
      },
          {
        value: "HZH",
        label: "黎平"
      },
          {
        value: "OHE",
        label: "漠河"
      },
          {
        value: "NBS",
        label: "长白山"
      },
          {
        value: "TCZ",
        label: "腾冲"
      },
          {
        value: "ZHY",
        label: "中卫"
      },
          {
        value: "YCU",
        label: "运城"
      },
          {
        value: "DOY",
        label: "东营"
      },
          {
        value: "THQ",
        label: "天水"
      },
          {
        value: "CNI",
        label: "大连"
      },
          {
        value: "ACX",
        label: "贵阳"
      }
];
    $( "#Source" ).autocomplete({
      minLength: 0,
      source: cities,
      focus: function( event, ui ) {
        $( "#Source" ).val( ui.item.label );
        return false;
      },
      select: function( event, ui ) {
        $( "#Source" ).val( ui.item.label );
        $( "#Source-id" ).val( ui.item.value );
        return false;
      }
    })
     $( "#Target" ).autocomplete({
      minLength: 0,
      source: cities,
      focus: function( event, ui ) {
        $( "#Target" ).val( ui.item.label );
        return false;
      },
      select: function( event, ui ) {
        $( "#Target" ).val( ui.item.label );
        $( "#Target-id" ).val( ui.item.value );
        return false;
      }
    })
    .data( "autocomplete" )._renderItem = function( ul, item ) {
      return $( "<li>" )
        .append( "<a>" + item.label + "<br>" + item.desc + "</a>" )
        .appendTo( ul );
    };
  });