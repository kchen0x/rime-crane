-- encoding: utf-8
--- charset filter
local charset = {
   ["[基本]"] = { first = 0x4e00, last = 0x9fff },
   ["[扩A]"] = { first = 0x3400, last = 0x4dbf },
   ["[扩B]"] = { first = 0x20000, last = 0x2a6df },
   ["[扩C]"] = { first = 0x2a700, last = 0x2b73f },
   ["[扩D]"] = { first = 0x2b740, last = 0x2b81f },
   ["[扩E]"] = { first = 0x2b820, last = 0x2ceaf },
   ["[扩F]"] = { first = 0x2ceb0, last = 0x2ebef },
   ["[扩G]"] = { first = 0x30000, last = 0x3134f },
   ["[扩H]"] = { first = 0x31350, last = 0x323af },
   ["[扩I]"] = { first = 0x2EBF0, last = 0x2EE5D },
   ["[笔画]"] = { first = 0x31c0, last = 0x31ef },
   ["[部首补充]"] = { first = 0x2e80, last = 0x2eff },
   ["[康熙部首]"] = { first = 0x2f00, last = 0x2fdf },
   ["[兼容]"] = { first = 0xf900, last = 0xfadf },
   ["[兼补]"] = { first = 0x2f800, last = 0x2fa1f },
   ["[汉字结构]"] = { first = 0x2ff0, last = 0x2fff },
   ["[注音]"] = { first = 0x3100, last = 0x312f },
   ["[注音扩展]"] = { first = 0x31a0, last = 0x31bf },
---汉字部分↑
   ["[拉丁文]"] = { first = 0x0000, last = 0x007f },
   ["[拉丁文补充]"] = { first = 0x0080, last = 0x00ff },
   ["[拉丁语扩展-A]"] = { first = 0x0100, last = 0x017f },
   ["[拉丁语扩展-B]"] = { first = 0x0180, last = 0x024f },
   ["[国际音标扩展]"] = { first = 0x0250, last = 0x02af },
   ["[间距修饰符]"] = { first = 0x02b0, last = 0x02ff },
   ["[组合变音标记]"] = { first = 0x0300, last = 0x036f },
   ["[希腊文]"] = { first = 0x0370, last = 0x03ff },
   ["[西里尔文]"] = { first = 0x0400, last = 0x04ff },
   ["[西里尔文增补]"] = { first = 0x0500, last = 0x052f },
   ["[亚美尼亚语]"] = { first = 0x0530, last = 0x058f },
   ["[希伯来文]"] = { first = 0x0590, last = 0x05ff },
   ["[阿拉伯语]"] = { first = 0x0600, last = 0x06ff },
   ["[叙利亚文]"] = { first = 0x0700, last = 0x074f },
   ["[阿拉伯语增补]"] = { first = 0x0750, last = 0x077f },
   ["[它拿字母]"] = { first = 0x0780, last = 0x07bf },
   ["[西非书面文字]"] = { first = 0x07c0, last = 0x07ff },
   ["[撒玛利亚字母]"] = { first = 0x0800, last = 0x083f },
   ["[曼达文]"] = { first = 0x0840, last = 0x085f },
   ["[叙利亚文增补]"] = { first = 0x0860, last = 0x086f },
   ["[阿拉伯语扩展‐B]"] = { first = 0x0870, last = 0x089f },
   ["[阿拉伯语扩展-A]"] = { first = 0x08a0, last = 0x08ff },
   ["[梵文]"] = { first = 0x0900, last = 0x097f },
   ["[孟加拉语]"] = { first = 0x0980, last = 0x09ff },
   ["[古木基文]"] = { first = 0x0a00, last = 0x0a7f },
   ["[古吉拉特文]"] = { first = 0x0a80, last = 0x0aff },
   ["[奥里亚语]"] = { first = 0x0b00, last = 0x0b7f },
   ["[泰米尔语]"] = { first = 0x0b80, last = 0x0bff },
   ["[泰卢固语]"] = { first = 0x0c00, last = 0x0c7f },
   ["[卡纳达语]"] = { first = 0x0c80, last = 0x0cff },
   ["[马拉雅拉姆语]"] = { first = 0x0d00, last = 0x0d7f },
   ["[僧伽罗语]"] = { first = 0x0d80, last = 0x0dff },
   ["[泰语]"] = { first = 0x0e00, last = 0x0e7f },
   ["[老挝语]"] = { first = 0x0e80, last = 0x0eff },
   ["[藏文]"] = { first = 0x0f00, last = 0x0fff },
   ["[缅甸语]"] = { first = 0x1000, last = 0x109f },
   ["[格鲁吉亚语]"] = { first = 0x10a0, last = 0x10ff },
   ["[韩文字母]"] = { first = 0x1100, last = 0x11ff },
   ["[阿姆哈拉语]"] = { first = 0x1200, last = 0x137f },
   ["[阿姆哈拉语增补]"] = { first = 0x1380, last = 0x139f },
   ["[切罗基语]"] = { first = 0x13a0, last = 0x13ff },
   ["[统一加拿大原住民音节]"] = { first = 0x1400, last = 0x167f },
   ["[欧甘字母]"] = { first = 0x1680, last = 0x169f },
   ["[卢恩字母]"] = { first = 0x16a0, last = 0x16ff },
   ["[他加禄语]"] = { first = 0x1700, last = 0x171f },
   ["[哈努诺文]"] = { first = 0x1720, last = 0x173f },
   ["[布希德文]"] = { first = 0x1740, last = 0x175f },
   ["[塔格巴努亚文]"] = { first = 0x1760, last = 0x177f },
   ["[高棉语]"] = { first = 0x1780, last = 0x17ff },
   ["[蒙古语]"] = { first = 0x1800, last = 0x18af },
   ["[统一加拿大原住民音节扩展]"] = { first = 0x18b0, last = 0x18ff },
   ["[林布语]"] = { first = 0x1900, last = 0x194f },
   ["[德宏傣文]"] = { first = 0x1950, last = 0x197f },
   ["[傣仂语]"] = { first = 0x1980, last = 0x19df },
   ["[高棉符号]"] = { first = 0x19e0, last = 0x19ff },
   ["[布吉语]"] = { first = 0x1a00, last = 0x1a1f },
   ["[老傣文]"] = { first = 0x1a20, last = 0x1aaf },
   ["[结合变音符号扩展]"] = { first = 0x1ab0, last = 0x1aff },
   ["[巴厘语]"] = { first = 0x1b00, last = 0x1b7f },
   ["[巽他语]"] = { first = 0x1b80, last = 0x1bbf },
   ["[巴塔克语]"] = { first = 0x1bc0, last = 0x1bff },
   ["[绒巴文]"] = { first = 0x1c00, last = 0x1c4f },
   ["[桑塔利语字母]"] = { first = 0x1c50, last = 0x1c7f },
   ["[西里尔文扩展-C]"] = { first = 0x1c80, last = 0x1c8f },
   ["[格鲁吉亚文扩展]"] = { first = 0x1c90, last = 0x1cbf },
   ["[巽他文增补]"] = { first = 0x1cc0, last = 0x1ccf },
   ["[吠陀扩展]"] = { first = 0x1cd0, last = 0x1cff },
   ["[国际音标扩展]"] = { first = 0x1d00, last = 0x1d7f },
   ["[国际音标增补]"] = { first = 0x1d80, last = 0x1dbf },
   ["[结合变音标记增补]"] = { first = 0x1dc0, last = 0x1dff },
   ["[拉丁语扩展附加]"] = { first = 0x1e00, last = 0x1eff },
   ["[希腊语扩展]"] = { first = 0x1f00, last = 0x1fff },
   ["[常用标点]"] = { first = 0x2000, last = 0x206f },
   ["[上标和下标]"] = { first = 0x2070, last = 0x209f },
   ["[货币符号]"] = { first = 0x20a0, last = 0x20cf },
   ["[组合符号变音符号]"] = { first = 0x20d0, last = 0x20ff },
   ["[类字母符号]"] = { first = 0x2100, last = 0x214f },
   ["[数字]"] = { first = 0x2150, last = 0x218f },
   ["[箭头]"] = { first = 0x2190, last = 0x21ff },
   ["[数运]"] = { first = 0x2200, last = 0x22ff },
   ["[杂项技术符号]"] = { first = 0x2300, last = 0x23ff },
   ["[控制图片]"] = { first = 0x2400, last = 0x243f },
   ["[光学字符识别]"] = { first = 0x2440, last = 0x245f },
   ["[带圈数字]"] = { first = 0x2460, last = 0x24ff },
   ["[制表符]"] = { first = 0x2500, last = 0x257f },
   ["[方块元素]"] = { first = 0x2580, last = 0x259f },
   ["[几何]"] = { first = 0x25a0, last = 0x25ff },
   ["[杂项]"] = { first = 0x2600, last = 0x26ff },
   ["[装饰]"] = { first = 0x2700, last = 0x27bf },
   ["[杂项数学符号-A]"] = { first = 0x27c0, last = 0x27ef },
   ["[补充箭头-A]"] = { first = 0x27f0, last = 0x27ff },
   ["[盲文]"] = { first = 0x2800, last = 0x28ff },
   ["[补充箭头-B]"] = { first = 0x2900, last = 0x297f },
   ["[杂项数学符号-B]"] = { first = 0x2980, last = 0x29ff },
   ["[数学运算补充]"] = { first = 0x2a00, last = 0x2aff },
   ["[其他符号和箭头]"] = { first = 0x2b00, last = 0x2bff },
   ["[格拉哥里字母]"] = { first = 0x2c00, last = 0x2c5f },
   ["[拉丁语扩展-C]"] = { first = 0x2c60, last = 0x2c7f },
   ["[科普特文]"] = { first = 0x2c80, last = 0x2cff },
   ["[格鲁吉亚文增补]"] = { first = 0x2d00, last = 0x2d2f },
   ["[提非纳字母]"] = { first = 0x2d30, last = 0x2d7f },
   ["[阿姆哈拉语扩展]"] = { first = 0x2d80, last = 0x2ddf },
   ["[西里尔文扩展-A]"] = { first = 0x2de0, last = 0x2dff },
   ["[补充标点符号]"] = { first = 0x2e00, last = 0x2e7f },
   ["[中日韩符号和标点]"] = { first = 0x3000, last = 0x303f },
   ["[平假名]"] = { first = 0x3040, last = 0x309f },
   ["[片假名]"] = { first = 0x30a0, last = 0x30ff },
   ["[韩文兼容字母]"] = { first = 0x3130, last = 0x318f },
   ["[汉文训读]"] = { first = 0x3190, last = 0x319f },
   ["[假名扩展]"] = { first = 0x31f0, last = 0x31ff },
   ["[中日韩弧圈字符]"] = { first = 0x3200, last = 0x32ff },
   ["[兼容单位]"] = { first = 0x3300, last = 0x33ff },
   ["[易经六十四卦符号]"] = { first = 0x4dc0, last = 0x4dff },
   ["[彝族音节]"] = { first = 0xa000, last = 0xa48f },
   ["[彝族部首]"] = { first = 0xa490, last = 0xa4cf },
   ["[傈僳语]"] = { first = 0xa4d0, last = 0xa4ff },
   ["[瓦伊语]"] = { first = 0xa500, last = 0xa63f },
   ["[西里尔文扩展-B]"] = { first = 0xa640, last = 0xa69f },
   ["[巴姆穆语]"] = { first = 0xa6a0, last = 0xa6ff },
   ["[声调修饰符]"] = { first = 0xa700, last = 0xa71f },
   ["[拉丁语扩展-D]"] = { first = 0xa720, last = 0xa7ff },
   ["[锡尔赫特文]"] = { first = 0xa800, last = 0xa82f },
   ["[常用印度数字形式]"] = { first = 0xa830, last = 0xa83f },
   ["[八思巴字]"] = { first = 0xa840, last = 0xa87f },
   ["[索拉什特拉语]"] = { first = 0xa880, last = 0xa8df },
   ["[天城文扩展]"] = { first = 0xa8e0, last = 0xa8ff },
   ["[克耶字母]"] = { first = 0xa900, last = 0xa92f },
   ["[拉让语]"] = { first = 0xa930, last = 0xa95f },
   ["[韩文字母扩展-A]"] = { first = 0xa960, last = 0xa97f },
   ["[爪哇语]"] = { first = 0xa980, last = 0xa9df },
   ["[缅甸语扩展-B]"] = { first = 0xa9e0, last = 0xa9ff },
   ["[占语]"] = { first = 0xaa00, last = 0xaa5f },
   ["[缅甸语扩展-A]"] = { first = 0xaa60, last = 0xaa7f },
   ["[傣文]"] = { first = 0xaa80, last = 0xaadf },
   ["[曼尼普尔语扩展]"] = { first = 0xaae0, last = 0xaaff },
   ["[阿姆哈拉语扩展-A]"] = { first = 0xab00, last = 0xab2f },
   ["[拉丁文扩展-E]"] = { first = 0xab30, last = 0xab6f },
   ["[切罗基语增补]"] = { first = 0xab70, last = 0xabbf },
   ["[曼尼普尔语]"] = { first = 0xabc0, last = 0xabff },
   ["[韩文音节]"] = { first = 0xac00, last = 0xd7af },   
   ["[韩文字母扩展-B]"] = { first = 0xd7b0, last = 0xd7ff },
   ["[高位替代区]"] = { first = 0xd800, last = 0xdb7f },
   ["[高位专用替代]"] = { first = 0xdb80, last = 0xdbff },
   ["[低位替代区]"] = { first = 0xdc00, last = 0xdfff }, 
   ["[私用区]"] = { first = 0xe000, last = 0xf8ff },
   ["[字母连写形式]"] = { first = 0xfb00, last = 0xfb4f },
   ["[阿拉伯语表现形式-A]"] = { first = 0xfb50, last = 0xfdff },
   ["[变体选择器]"] = { first = 0xfe00, last = 0xfe0f },
   ["[竖排形式]"] = { first = 0xfe10, last = 0xfe1f },
   ["[组合用半符号]"] = { first = 0xfe20, last = 0xfe2f },
   ["[中日韩兼容形式]"] = { first = 0xfe30, last = 0xfe4f },
   ["[小型变体形式]"] = { first = 0xfe50, last = 0xfe6f },
   ["[阿拉伯语表现形式-B]"] = { first = 0xfe70, last = 0xfeff },
   ["[字符]"] = { first = 0xff00, last = 0xffef },
   ["[特殊字符]"] = { first = 0xfff0, last = 0xffff },
   ["[线形文字B音节]"] = { first = 0x10000, last = 0x1007f },
   ["[线形文字B表意文字]"] = { first = 0x10080, last = 0x100ff },
   ["[爱琴海数字]"] = { first = 0x10100, last = 0x1013f },
   ["[古希腊数字]"] = { first = 0x10140, last = 0x1018f },
   ["[古罗马符号]"] = { first = 0x10190, last = 0x101cf },
   ["[斐斯托斯圆盘古文字]"] = { first = 0x101d0, last = 0x101ff },
   ["[吕基亚语]"] = { first = 0x10280, last = 0x1029f },
   ["[卡里亚字母]"] = { first = 0x102a0, last = 0x102df },
   ["[科普特闰余数字]"] = { first = 0x102e0, last = 0x102ff },
   ["[古意大利字母]"] = { first = 0x10300, last = 0x1032f },
   ["[哥特字母]"] = { first = 0x10330, last = 0x1034f },
   ["[古彼尔姆文]"] = { first = 0x10350, last = 0x1037f },
   ["[乌加里特语]"] = { first = 0x10380, last = 0x1039f },
   ["[古波斯语]"] = { first = 0x103a0, last = 0x103df },
   ["[德瑟雷特字母]"] = { first = 0x10400, last = 0x1044f },
   ["[萧伯纳字母]"] = { first = 0x10450, last = 0x1047f },
   ["[奥斯曼亚字母]"] = { first = 0x10480, last = 0x104af },
   ["[欧塞奇字母]"] = { first = 0x104b0, last = 0x104ff },
   ["[爱尔巴桑字母]"] = { first = 0x10500, last = 0x1052f },   
   ["[高加索阿尔巴尼亚语言]"] = { first = 0x10530, last = 0x1056f },
   ["[维斯库奇语]"] = { first = 0x10570, last = 0x105bf },
   ["[线性文字A]"] = { first = 0x10600, last = 0x1077f },
   ["[拉丁语扩展-F]"] = { first = 0x10780, last = 0x107bf },
   ["[塞浦路斯语音节]"] = { first = 0x10800, last = 0x1083f },
   ["[帝国阿拉姆語]"] = { first = 0x10840, last = 0x1085f },
   ["[巴尔米拉字母]"] = { first = 0x10860, last = 0x1087f },
   ["[纳巴泰字母]"] = { first = 0x10880, last = 0x108af },
   ["[哈特兰字母]"] = { first = 0x108e0, last = 0x108ff },
   ["[腓尼基字母]"] = { first = 0x10900, last = 0x1091f },   
   ["[吕底亚语]"] = { first = 0x10920, last = 0x1093f },
   ["[麦罗埃象形文字]"] = { first = 0x10980, last = 0x1099f },
   ["[麦罗埃文草体字]"] = { first = 0x109a0, last = 0x109ff },
   ["[佉卢文]"] = { first = 0x10a00, last = 0x10a5f },
   ["[古南部阿拉伯语]"] = { first = 0x10a60, last = 0x10a7f },
   ["[古北部阿拉伯语]"] = { first = 0x10a80, last = 0x10a9f },
   ["[摩尼字母]"] = { first = 0x10ac0, last = 0x10aff }, 
   ["[阿维斯陀字母]"] = { first = 0x10b00, last = 0x10b3f },
   ["[碑刻帕提亚文]"] = { first = 0x10b40, last = 0x10b5f },
   ["[碑刻巴列维文]"] = { first = 0x10b60, last = 0x10b7f },
   ["[诗篇巴列维文]"] = { first = 0x10b80, last = 0x10baf },
   ["[古代突厥語]"] = { first = 0x10c00, last = 0x10c4f },
   ["[古匈牙利字母]"] = { first = 0x10c80, last = 0x10cff },
   ["[哈乃斐罗兴亚文字]"] = { first = 0x10d00, last = 0x10d3f },
   ["[鲁米数字符号]"] = { first = 0x10e60, last = 0x10e7f },   
   ["[雅慈迪文字]"] = { first = 0x10e80, last = 0x10ebf },
   ["[古粟特字母]"] = { first = 0x10f00, last = 0x10f2f },
   ["[粟特字母]"] = { first = 0x10f30, last = 0x10f6f },
   ["[旧维吾尔语]"] = { first = 0x10f70, last = 0x10faf },
   ["[花剌子模文字]"] = { first = 0x10fb0, last = 0x10fdf },
   ["[以利买字母]"] = { first = 0x10fe0, last = 0x10fff },
   ["[婆罗米文]"] = { first = 0x11000, last = 0x1107f },
   ["[凯提文]"] = { first = 0x11080, last = 0x110cf },
   ["[索拉僧平文字]"] = { first = 0x110d0, last = 0x110ff },
   ["[查克马语]"] = { first = 0x11100, last = 0x1114f },
   ["[马哈雅尼文]"] = { first = 0x11150, last = 0x1117f },
   ["[夏拉达文]"] = { first = 0x11180, last = 0x111df },
   ["[古僧伽罗文数字]"] = { first = 0x111e0, last = 0x111ff },
   ["[和卓文]"] = { first = 0x11200, last = 0x1124f },
   ["[木尔坦文]"] = { first = 0x11280, last = 0x112af },
   ["[库达瓦迪文]"] = { first = 0x112b0, last = 0x112ff },
   ["[古兰塔文]"] = { first = 0x11300, last = 0x1137f },
   ["[尼瓦尔语]"] = { first = 0x11400, last = 0x1147f },
   ["[提尔胡塔文]"] = { first = 0x11480, last = 0x114df },
   ["[悉昙文字]"] = { first = 0x11580, last = 0x115ff },
   ["[莫迪文]"] = { first = 0x11600, last = 0x1165f },
   ["[蒙古语增补]"] = { first = 0x11660, last = 0x1167f },
   ["[塔克里文]"] = { first = 0x11680, last = 0x116cf },
   ["[阿洪姆语]"] = { first = 0x11700, last = 0x1174f },
   ["[多格拉语]"] = { first = 0x11800, last = 0x1184f },
   ["[瓦兰齐地文]"] = { first = 0x118a0, last = 0x118ff },
   ["[迪维希文字]"] = { first = 0x11900, last = 0x1195f },
   ["[南迪城文]"] = { first = 0x119a0, last = 0x119ff },
   ["[札那巴札尔方形字母]"] = { first = 0x11a00, last = 0x11a4f },
   ["[索永布字母]"] = { first = 0x11a50, last = 0x11aaf },
   ["[加拿大统一原住民音节扩展‐A]"] = { first = 0x11ab0, last = 0x11abf },
   ["[包钦豪文]"] = { first = 0x11ac0, last = 0x11aff },
   ["[拜克舒基文]"] = { first = 0x11c00, last = 0x11c6f },
   ["[玛钦文]"] = { first = 0x11c70, last = 0x11cbf },
   ["[马萨拉姆贡德文字]"] = { first = 0x11d00, last = 0x11d5f },
   ["[贡贾拉贡德文]"] = { first = 0x11d60, last = 0x11daf },
   ["[望加锡文]"] = { first = 0x11ee0, last = 0x11eff },
   ["[傈僳文字补充]"] = { first = 0x11fb0, last = 0x11fbf },
   ["[泰米尔文增补]"] = { first = 0x11fc0, last = 0x11fff },
   ["[楔形文字]"] = { first = 0x12000, last = 0x123ff },
   ["[楔形文字数字和标点符号]"] = { first = 0x12400, last = 0x1247f },
   ["[古代楔形文字]"] = { first = 0x12480, last = 0x1254f },
   ["[赛伯乐-米诺语]"] = { first = 0x12f90, last = 0x12fff },
   ["[埃及圣书体]"] = { first = 0x13000, last = 0x1342f },
   ["[埃及圣书体格式控制]"] = { first = 0x13430, last = 0x1343f },
   ["[安纳托利亚象形文字]"] = { first = 0x14400, last = 0x1467f },
   ["[巴姆穆文字增补]"] = { first = 0x16800, last = 0x16a3f },
   ["[默禄文]"] = { first = 0x16a40, last = 0x16a6f },
   ["[唐山语]"] = { first = 0x16a70, last = 0x16acf },
   ["[巴萨哇文字]"] = { first = 0x16ad0, last = 0x16aff },
   ["[帕哈苗文]"] = { first = 0x16b00, last = 0x16b8f },
   ["[梅德法伊德林文]"] = { first = 0x16e40, last = 0x16e9f },
   ["[柏格理苗文]"] = { first = 0x16f00, last = 0x16f9f },
   ["[表意符号和标点符号]"] = { first = 0x16fe0, last = 0x16fff },
   ["[西夏文]"] = { first = 0x17000, last = 0x187ff },
   ["[西夏文部首]"] = { first = 0x18800, last = 0x18aff },
   ["[契丹小字]"] = { first = 0x18b00, last = 0x18cff },
   ["[西夏文字补充]"] = { first = 0x18d00, last = 0x18d8f },
   ["[加纳文扩展-B]"] = { first = 0x1aff0, last = 0x1afff },
   ["[假名补充]"] = { first = 0x1b000, last = 0x1b0ff },
   ["[假名扩展A]"] = { first = 0x1b100, last = 0x1b12f },
   ["[小型日文假名扩展]"] = { first = 0x1b130, last = 0x1b16f },
   ["[女书]"] = { first = 0x1b170, last = 0x1b2ff },
   ["[杜普雷速记]"] = { first = 0x1bc00, last = 0x1bc9f },
   ["[速记格式控制符]"] = { first = 0x1bca0, last = 0x1bcaf },
   ["[Znamenny音乐记谱法]"] = { first = 0x1cf00, last = 0x1cfcf },
   ["[拜占庭音乐符号]"] = { first = 0x1d000, last = 0x1d0ff },
   ["[音乐符号]"] = { first = 0x1d100, last = 0x1d1ff },
   ["[古希腊音乐记号]"] = { first = 0x1d200, last = 0x1d24f },
   ["[玛雅数字]"] = { first = 0x1d2e0, last = 0x1d2ff },
   ["[太玄经符号]"] = { first = 0x1d300, last = 0x1d35f },
   ["[算筹]"] = { first = 0x1d360, last = 0x1d37f },
   ["[字母和数字符号]"] = { first = 0x1d400, last = 0x1d7ff },
   ["[萨顿书写符号]"] = { first = 0x1d800, last = 0x1daaf },
   ["[拉丁语扩展-G]"] = { first = 0x1df00, last = 0x1dfff },
   ["[格拉哥里字母增补]"] = { first = 0x1e000, last = 0x1e02f },
   ["[尼亚坑普阿绰苗文]"] = { first = 0x1e100, last = 0x1e14f },
   ["[Toto]"] = { first = 0x1e290, last = 0x1e2bf },
   ["[文乔字母]"] = { first = 0x1e2c0, last = 0x1e2ff },
   ["[埃塞俄比亚语扩展-B]"] = { first = 0x1e7e0, last = 0x1e7ff },
   ["[门德基卡库文]"] = { first = 0x1e800, last = 0x1e8df },
   ["[阿德拉姆字母]"] = { first = 0x1e900, last = 0x1e95f },
   ["[印度西亚格数字]"] = { first = 0x1ec70, last = 0x1ecbf },
   ["[奥斯曼西亚克数字]"] = { first = 0x1ed00, last = 0x1ed4f },
   ["[阿拉伯字母数字符号]"] = { first = 0x1ee00, last = 0x1eeff },
   ["[麻将牌]"] = { first = 0x1f000, last = 0x1f02f },
   ["[多米诺骨牌]"] = { first = 0x1f030, last = 0x1f09f },
   ["[扑克牌]"] = { first = 0x1f0a0, last = 0x1f0ff },
   ["[带圈字母补充]"] = { first = 0x1f100, last = 0x1f1ff },
   ["[方框字补充]"] = { first = 0x1f200, last = 0x1f2ff },
   ["[杂符]"] = { first = 0x1f300, last = 0x1f5ff },
   ["[表情]"] = { first = 0x1f600, last = 0x1f64f },
   ["[装饰符号]"] = { first = 0x1f650, last = 0x1f67f },
   ["[交通和地图符号]"] = { first = 0x1f680, last = 0x1f6ff },
   ["[炼金术符号]"] = { first = 0x1f700, last = 0x1f77f },
   ["[几何扩]"] = { first = 0x1f780, last = 0x1f7ff },
   ["[追加箭头-C]"] = { first = 0x1f800, last = 0x1f8ff },
   ["[符号补]"] = { first = 0x1f900, last = 0x1f9ff },
   ["[象棋]"] = { first = 0x1fa00, last = 0x1fa6f },
   ["[符号和象形文字扩展-A]"] = { first = 0x1fa70, last = 0x1faff },
   ["[传统计算机符号]"] = { first = 0x1fb00, last = 0x1fbff },
   ["[标签]"] = { first = 0xe0000, last = 0xe007f },
   ["[变化选择器补充]"] = { first = 0xe0100, last = 0xe01ef },
   ["[私用区补充A]"] = { first = 0xf0000, last = 0xffff },
   ["[私用区补充B]"] = { first = 0x100000, last = 0x10ffff },
   ["[Compat]"] = { first = 0x2F8000, last = 0x2FA1FF } }

local function exists(single_filter, text)
  for i in utf8.codes(text) do
     local c = utf8.codepoint(text, i)
     if (not single_filter(c)) then
	return false
     end
  end
  return true
end

local function is_charset(s)
   return function (c)
      return c >= charset[s].first and c <= charset[s].last
   end
end

local function is_cjk_ext(c)
   return is_charset("中日韩统一汉字扩展A")(c) or is_charset("中日韩统一汉字扩展B")(c) or
      is_charset("中日韩统一汉字扩展C")(c) or is_charset("中日韩统一汉字扩展D")(c) or
      is_charset("中日韩统一汉字扩展E")(c) or is_charset("中日韩统一汉字扩展F")(c) or
      is_charset("中日韩统一汉字扩展G")(c) or is_charset("中日韩统一汉字")(c) or
      is_charset("中日韩汉字部首补充")(c) or is_charset("康熙部首")(c) or
      is_charset("中日韩兼容汉字")(c) or is_charset("中日韩兼容汉字补充")(c) or
      is_charset("中日韩汉字笔画")(c) or is_charset("结构")(c) or
      is_charset("注音符号")(c) or is_charset("注音扩展")(c) or
      is_charset("基本拉丁文字")(c) or is_charset("拉丁文字西欧语言补充")(c) or
      is_charset("拉丁文字扩展A")(c) or is_charset("拉丁文字扩展B")(c) or
      is_charset("国际音标扩展")(c) or is_charset("占位修饰符")(c) or
      is_charset("组合附加记号")(c) or is_charset("希腊文字和科普特文字")(c) or
      is_charset("西里尔文")(c) or is_charset("西里尔文补充")(c) or
      is_charset("亚美尼亚文")(c) or is_charset("希伯莱文")(c) or
      is_charset("阿拉伯文")(c) or is_charset("叙利亚文")(c) or
      is_charset("阿拉伯文补充")(c) or is_charset("它拿文")(c) or
      is_charset("西非书面文字")(c) or is_charset("撒马利亚文字")(c) or
      is_charset("曼达安文字")(c) or is_charset("叙利亚文补充")(c) or
      is_charset("阿拉伯文补充")(c) or is_charset("天城文")(c) or
      is_charset("孟加拉文")(c) or is_charset("古木基文")(c) or
      is_charset("古吉拉特文")(c) or is_charset("奥里亚文")(c) or
      is_charset("泰米尔文")(c) or is_charset("泰卢固文")(c) or
      is_charset("卡纳达文")(c) or is_charset("马拉雅拉姆文")(c) or
      is_charset("僧伽罗文")(c) or is_charset("泰文")(c) or
      is_charset("老挝文")(c) or is_charset("藏文")(c) or
      is_charset("缅甸文")(c) or is_charset("格鲁吉亚文")(c) or
      is_charset("谚文字母")(c) or is_charset("埃塞俄比亚文")(c) or
      is_charset("埃塞俄比亚文补充")(c) or is_charset("切罗基文")(c) or
      is_charset("统一加拿大原住民音节文字")(c) or is_charset("欧甘文字")(c) or
      is_charset("卢恩文字")(c) or is_charset("他加禄文")(c) or
      is_charset("哈努诺文")(c) or is_charset("布希德文")(c) or
      is_charset("塔格巴努瓦文")(c) or is_charset("高绵文")(c) or
      is_charset("蒙古文")(c) or is_charset("统一加拿大原住民音节文字扩展")(c) or
      is_charset("林布文")(c) or is_charset("德宏傣文")(c) or
      is_charset("西双版纳新傣文")(c) or is_charset("高绵文符号")(c) or
      is_charset("布吉文字")(c) or is_charset("西双版纳老傣文")(c) or
      is_charset("组合附加记号扩展")(c) or is_charset("巴厘文字")(c) or
      is_charset("巽他文字")(c) or is_charset("巴塔克文")(c) or
      is_charset("雷布查文")(c) or is_charset("桑塔利文")(c) or
      is_charset("西里尔文扩展C")(c) or is_charset("格鲁吉亚文")(c) or
      is_charset("巽他文字补充")(c) or is_charset("吠陀文字补充")(c) or
      is_charset("音标扩展")(c) or is_charset("音标扩展补充")(c) or
      is_charset("组合附加记号补充")(c) or is_charset("拉丁文附加扩展")(c) or
      is_charset("希腊文扩展")(c) or is_charset("通用标点符号")(c) or
      is_charset("上标和下标")(c) or is_charset("货币符号")(c) or
      is_charset("符号用组合附加记号")(c) or is_charset("类字母符号")(c) or
      is_charset("数字形式")(c) or is_charset("缅箭头")(c) or
      is_charset("数学运算符")(c) or is_charset("杂类技术符号")(c) or
      is_charset("控制符图形")(c) or is_charset("光学字符诀别符号")(c) or
      is_charset("包围式字母与数字符号")(c) or is_charset("制表符")(c) or
      is_charset("方块元素")(c) or is_charset("几何形状")(c) or
      is_charset("杂类符号")(c) or is_charset("印刷符号")(c) or
      is_charset("杂类数学符号A")(c) or is_charset("补充箭头A")(c) or
      is_charset("盲文点字")(c) or is_charset("补充箭头B")(c) or
      is_charset("杂类数学符号B")(c) or is_charset("补充数学运算符")(c) or
      is_charset("杂类标志与箭头")(c) or is_charset("格拉哥里文字")(c) or
      is_charset("拉丁文字扩展C")(c) or is_charset("科普特文")(c) or
      is_charset("格鲁吉亚文补充")(c) or is_charset("提非纳文字")(c) or
      is_charset("埃塞俄比亚文扩展")(c) or is_charset("西里尔文扩展A")(c) or
      is_charset("补充标点符号")(c) or is_charset("表意文字描述字符")(c) or
      is_charset("中日韩符号和标点")(c) or is_charset("平假名")(c) or
      is_charset("片假名")(c) or is_charset("谚文兼容字母")(c) or
      is_charset("汉文记号")(c) or is_charset("注音符号扩展")(c) or
      is_charset("片假名音标扩展")(c) or is_charset("包围式中日韩字符与月份")(c) or
      is_charset("中日韩兼容全角字符")(c) or is_charset("易经六十四卦符号")(c) or
      is_charset("彝文")(c) or is_charset("彝文部首")(c) or
      is_charset("老傈僳文")(c) or is_charset("卡瓦伊文")(c) or
      is_charset("西里尔文扩展B")(c) or is_charset("巴姆穆文")(c) or
      is_charset("声调修饰符号")(c) or is_charset("拉丁文字扩展D")(c) or
      is_charset("锡尔赫特城文字")(c) or is_charset("通用印度数学")(c) or
      is_charset("八思巴文")(c) or is_charset("索拉什特拉文字")(c) or
      is_charset("天城文扩展")(c) or is_charset("克耶里文")(c) or
      is_charset("勒姜文")(c) or is_charset("谚文字母扩展A")(c) or
      is_charset("爪哇文")(c) or is_charset("缅甸文扩展B")(c) or
      is_charset("占文")(c) or is_charset("缅甸文扩展A")(c) or
      is_charset("越南傣文")(c) or is_charset("曼尼普尔文扩展")(c) or
      is_charset("埃塞俄比亚文扩展A")(c) or is_charset("拉丁文字扩展E")(c) or
      is_charset("切罗基文字补充")(c) or is_charset("曼尼普尔文")(c) or
      is_charset("谚文")(c) or is_charset("谚文字母扩展B")(c) or
      is_charset("私用区")(c) or is_charset("字母变体")(c) or
      is_charset("阿拉伯文变体A")(c) or is_charset("异体选择符")(c) or
      is_charset("竖排标点符号")(c) or is_charset("组合用半记号")(c) or
      is_charset("中日韩兼容标点符号")(c) or is_charset("小型标点符号")(c) or
      is_charset("阿拉伯文变体B")(c) or is_charset("半角与全角符号")(c) or
      is_charset("特殊字符")(c) or is_charset("线形文字B音节文字")(c) or
      is_charset("线形文字B表意文字")(c) or is_charset("爱琴数学")(c) or
      is_charset("古希腊数学")(c) or is_charset("古代符号")(c) or
      is_charset("费斯托斯圆盘符号")(c) or is_charset("吕基亚文")(c) or
      is_charset("卡利亚文")(c) or is_charset("科普特闰余数字")(c) or
      is_charset("古意大利文")(c) or is_charset("哥特文")(c) or
      is_charset("古彼尔姆文")(c) or is_charset("乌加里特文")(c) or
      is_charset("古波斯楔形文")(c) or is_charset("德塞雷特文")(c) or
      is_charset("萧伯纳文")(c) or is_charset("奥斯曼亚文")(c) or
      is_charset("欧塞奇文")(c) or is_charset("爱尔巴桑文")(c) or
      is_charset("高加索爱尔巴尼亚文")(c) or is_charset("线形文字A")(c) or
      is_charset("塞浦路斯音节文字A")(c) or is_charset("皇家亚拉姆文字")(c) or
      is_charset("帕尔迈拉文字")(c) or is_charset("纳巴泰文")(c) or
      is_charset("哈特拉文")(c) or is_charset("腓尼基文")(c) or
      is_charset("吕底亚文")(c) or is_charset("麦罗埃象形文字")(c) or
      is_charset("麦罗埃草书文字")(c) or is_charset("佉卢虱吒文")(c) or
      is_charset("古南阿拉伯文")(c) or is_charset("古北阿拉伯文")(c) or
      is_charset("摩尼文")(c) or is_charset("阿维斯陀文")(c) or
      is_charset("帕提亚碑铭体文字")(c) or is_charset("巴列维碑铭体文字")(c) or
      is_charset("巴列维圣诗体文字")(c) or is_charset("古突厥文")(c) or
      is_charset("古匈牙利文")(c) or is_charset("哈乃斐罗兴亚文")(c) or
      is_charset("鲁米数学符号")(c) or is_charset("雅兹迪文")(c) or
      is_charset("古粟特文")(c) or is_charset("粟特文")(c) or
      is_charset("花剌子模文字")(c) or is_charset("婆罗米文字")(c) or
      is_charset("凯提文")(c) or is_charset("索拉僧平文")(c) or
      is_charset("查克马文")(c) or is_charset("马哈佳尼文")(c) or
      is_charset("夏拉达文")(c) or is_charset("僧伽罗古代数学")(c) or
      is_charset("克吉奇文")(c) or is_charset("穆尔塔尼文")(c) or
      is_charset("信德文")(c) or is_charset("格兰塔文")(c) or
      is_charset("尼瓦文")(c) or is_charset("提尔胡塔文")(c) or
      is_charset("悉昙文")(c) or is_charset("莫迪文")(c) or
      is_charset("蒙古文补充")(c) or is_charset("泰克里文")(c) or
      is_charset("阿洪姆文")(c) or is_charset("多格拉文")(c) or
      is_charset("瓦兰齐地文")(c) or is_charset("迪维希文")(c) or
      is_charset("喜城文")(c) or is_charset("札那巴札尔方形文字")(c) or
      is_charset("索永布文")(c) or is_charset("包钦毫文")(c) or
      is_charset("拜克舒基文")(c) or is_charset("玛钦文")(c) or
      is_charset("马萨拉姆贡德文")(c) or is_charset("贡贾拉贡德文")(c) or
      is_charset("望加锡文")(c) or is_charset("傈僳文补充")(c) or
      is_charset("泰米尔文补充")(c) or is_charset("楔形文字补充")(c) or
      is_charset("楔形文字数字和标点符号")(c) or is_charset("早期王朝楔形文字")(c) or
      is_charset("埃及象形文字")(c) or is_charset("埃及象形文字格式控制符")(c) or
      is_charset("安纳托利亚象形文字")(c) or is_charset("巴姆穆文补充")(c) or
      is_charset("木如文")(c) or is_charset("巴萨文")(c) or
      is_charset("杨松录苗文")(c) or is_charset("梅德法伊德林文字")(c) or
      is_charset("柏格理苗文")(c) or is_charset("表意文字符号及标点")(c) or
      is_charset("西夏文")(c) or is_charset("西夏文部首")(c) or
      is_charset("契丹小字")(c) or is_charset("西夏文补充")(c) or
      is_charset("假名补充")(c) or is_charset("假名扩展A")(c) or
      is_charset("小写假名扩展")(c) or is_charset("女书")(c) or
      is_charset("杜普雷速记文字")(c) or is_charset("速记格式控制符")(c) or
      is_charset("拜占庭乐谱符号")(c) or is_charset("乐谱符号")(c) or
      is_charset("古希腊乐谱记号")(c) or is_charset("玛雅数字")(c) or
      is_charset("太玄经符号")(c) or is_charset("算筹数字")(c) or
      is_charset("数学字母数字符号")(c) or is_charset("萨顿手语符号")(c) or
      is_charset("格拉哥里文字补充")(c) or is_charset("花布苗文")(c) or
      is_charset("万却文字")(c) or is_charset("门德基卡库文字")(c) or
      is_charset("阿德拉姆文字")(c) or is_charset("印度西亚克数字")(c) or
      is_charset("奥斯曼西亚克数字")(c) or is_charset("阿拉伯数学用字母符号")(c) or
      is_charset("麻将牌")(c) or is_charset("多米诺骨牌")(c) or
      is_charset("扑克牌")(c) or is_charset("包围式字母数字补充")(c) or
      is_charset("包围式表意文字补充")(c) or is_charset("杂类符号与图形标记")(c) or
      is_charset("表情符号")(c) or is_charset("装饰印刷符号")(c) or
      is_charset("交通与印刷符号")(c) or is_charset("炼金术符号")(c) or
      is_charset("几何形状扩展")(c) or is_charset("补充箭头C")(c) or
      is_charset("补充符号与图形标记")(c) or is_charset("棋类符号")(c) or
      is_charset("符号及图形标记扩展A")(c) or is_charset("传统计算机符号")(c) or
      is_charset("标签")(c) or is_charset("异体选择符补充")(c) or
      is_charset("补充私用区A")(c) or is_charset("补充私用区B")(c) or
      is_charset("Compat")(c)
end

local function charset_filter(input)
   for cand in input:iter() do
      if (not exists(is_cjk_ext, cand.text))
      then
	 yield(cand)
      end
   end
end


--- charset comment filter
local function charset_comment_filter(input,env)
  local b = env.engine.context:get_option("charset_comment_filter")--开关状态
  for cand in input:iter() do
    if b then
     for s, r in pairs(charset) do
       if (exists(is_charset(s), cand.text)) then
         cand:get_genuine().comment = cand.comment .. " " .. s
         break
       end--if
      end--for
     end--if
      yield(cand)
   end
end


return charset_comment_filter