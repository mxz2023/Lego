!(function(global) {
  // 该全局变量用于兼容ios8.3系统内存溢出，造成js未暴露JrBrige全局对象问题
  var JUMPMAP = {
      "caifu/jijin/fundlist": { num: '1' }, // jumpUrl:1 - 基金列表页
      "caifu/jijin/funddetail": { num: '3' }, // jumpUrl:3 - 基金详情页
      "xiaojin/ious/openious": { num: '4' }, // jumpUrl:4 - 白条页
      "setting/feedback/homepage": { num: '5' }, // jumpUrl:5 - 用户反馈页
      "setting/homepage": { num: '6' }, // jumpUrl:6 - 账户设置页
      "operation/qrscan": { num: '7' }, // jumpUrl:7 - 扫一扫
      "messagecenter/messagelist": { num: '8' }, // jumpUrl:8 - 消息中心
      "bankcard/oldcardlist": { num: '9' }, // jumpUrl:9 - 银行卡
      "tradeorder/list": { num: '10' }, // jumpUrl:10 - 交易单
      "hold/dingqi/holdlist": { num: '11' }, // jumpUrl:11 - 我的理财
      "caifu/xjk/homepage": { num: '12' }, // jumpUrl:12 - 小金库主页
      "main/homepage": { num: '16' }, // jumpUrl:16 - APP首页
      "tradeorder/baitiao/shoppingorder": { num: '19' }, // jumpUrl:19 - 购物订单
      "caifu/momfinance/homepage": { num: '21' }, // jumpUrl:21 - 妈妈理财首页
      "crowdfund/homepage": { num: '22' }, // jumpUrl:22 - 众筹首页
      "crowdfund/productdetail": { num: '25' }, // jumpUrl:25 - 众筹单品首页
      "messagecenter/oldmessagedetail": { num: '33' }, // jumpUrl:33 - 消息详情页
      "crowdfund/shipspage": { num: '35' }, // jumpUrl:35 - 筹客子页面
      "setting/feedback/submitpage": { num: '38' }, // jumpUrl:38 - 用户反馈页子页面---提交页面
      "jimu/mycollection": { num: '39' }, // jumpUrl:39 - 我的收藏
      "community/fundplatform/jmaccountpage": { num: '40' }, // jumpUrl:40 - 积木人的详情
      "jimu/commentlist": { num: '43' }, // jumpUrl:43 - 积木评论列表
      "tradeorder/jijin/redeemdetail": { num: '44' }, // jumpUrl:44 - 赎回单详情-基金
      "hold/freeproduct/tradedetail": { num: '46' }, // jumpUrl:46 - 白拿2交易详情
      "hold/piaoju/tradedetail": { num: '47' }, // jumpUrl:47 - 票据交易详情
      "tradeorder/jijin/tradeorderdetail": { num: '52' }, // jumpUrl:52 - 基金交易单详情
      "tradeorder/piaoju/tradeorderdetail": { num: '53' }, // jumpUrl:53 - 票据交易单详情
      "crowdfund/supportpage": { num: '56' }, // jumpUrl:56 - 众筹档位支持页面
      "tradeorder/ioustrade/productdetail": { num: '58' }, // jumpUrl:58 - 白条商品详情
      "jimu/articlepage": { num: '59' }, // jumpUrl:59 - 积木详情-文章页面
      "personcenter/homepage": { num: '60' }, // jumpUrl:60 - 个人中心 首页-我
      "hold/jijin/fundhold": { num: '61' }, // jumpUrl:61 - 基金持仓页
      "kpl/skudetail": { num: '64' }, // jumpUrl:64 - 根据商品ID打开详情页，含广告跟单分拥功能-开普勒
      "kpl/skulist": { num: '66' }, // jumpUrl:66 - 打开导航/列表页-开普勒
      "kpl/urldetail": { num: '67' }, // jumpUrl:67 - 根据商品URL打开开普勒页面 -- 仅限广告分佣url-开普勒
      "stock/index/indexdetail": { num: '70' }, // jumpUrl:70 - 指数详情_沪深_股票
      "stock/hs/indexdetail": { num: '71' }, // jumpUrl:71 - 股票详情_沪深_股票
      "appsystem/opensystemweb": { num: '73' }, // jumpUrl:73 - 打开系统浏览器
      "tradeorder/ioustrade/tradedetail": { num: '75' }, // jumpUrl:75 - 白条消费交易单详情
      "tradeorder/ioustrade/repaymentdetail": { num: '76' }, // jumpUrl:76 - 白条还款交易单详情
      "life/phonerecharge/feerecharge": { num: '78' }, // jumpUrl:78 - 手机充值
      "kpl/orderlist": { num: '80' }, // jumpUrl:80 - 打开订单列表-开普勒
      "hold/dingqi/holdlist": { num: '81' }, // jumpUrl:81 - 我的理财（新版持仓页）
      "operation/calendar/homepage": { num: '85' }, // jumpUrl:85 - 日历主页
      "operation/calendar/addevent": { num: '86' }, // jumpUrl:86 - 日历-添加事件页
      "operation/calendar/share": { num: '87' }, // jumpUrl:87 - 日历分享页
      "setting/safepage": { num: '90' }, // jumpUrl:90 - 账户安全页面
      "account/jimu/jimulist": { num: '91' }, // jumpUrl:91 - 个人页-积木列表
      "account/uploadidcards": { num: '92' }, // jumpUrl:92 - 上传身份证
      "kpl/categorylist": { num: '93' }, // jumpUrl:93 - 根据传入的名称 打开对应的分类列表-开普勒
      "kpl/searchresult": { num: '94' }, // jumpUrl:94 - 根据搜索关键字 打开搜索结果页-开普勒
      "kpl/shoppingcart": { num: '95' }, // jumpUrl:95 - 打开购物车界面-开普勒
      "kpl/addcart": { num: '96' }, // jumpUrl:96 - 直接购买或者添加购物车-开普勒
      "stock/etf/detail": { num: '98' }, // jumpUrl:98 - ETF详情_股票
      "stock/us/detail": { num: '99' }, // jumpUrl:99 - 美股详情_股票
      "operation/live/player": { num: '106' }, // jumpUrl:106 - 直播模块
      "caifu/xjk/billpage": { num: '107' }, // jumpUrl:107 - 小金库账单页
      "operation/coinspeed/homepage": { num: '111' }, // jumpUrl:111 - 加息币-主页
      "operation/coinspeed/incomelist": { num: '112' }, // jumpUrl:112 - 加息币-收入列表页
      "operation/coinspeed/costlist": { num: '113' }, // jumpUrl:113 - 加息币-花费列表页
      "operation/coinspeed/profitlist": { num: '114' }, // jumpUrl:114 - 加息币-收益列表页
      "appcommon/dynamic": { num: '115' }, // jumpUrl:115 - 动态搭建3.0页面
      "stock/homepage": { num: '116' }, // jumpUrl:116 - 股票主页面
      "xiaojin/socialious/opensocialious": { num: '117' }, // jumpUrl:117 - 社交白条-激活流程
      "xiaojin/socialious/invitationlist": { num: '118' }, // jumpUrl:118 - 社交白条-邀请列表
      "tradeorder/caifu/jizhitradedetail": { num: '119' }, // jumpUrl:119 - 基智账户交易单详情
      "jdpay/paymentcode": { num: '120' }, // jumpUrl:120 - 付款码页面-jdapy新付款码
      "operation/globalsearch/homepage": { num: '121' }, // jumpUrl:121 - 全局搜索页
      "jimu/mysubscribe": { num: '122' }, // jumpUrl:122 - 我的订阅
      "jimu/addfollow/homepage": { num: '123' }, // jumpUrl:123 - 添加订阅页
      "tradeorder/jizhi/redeemorderdetail": { num: '124' }, // jumpUrl:124 - 基智账户赎回单详情页
      "community/jimu/channelsubpage": { num: '127' }, // jumpUrl:127 - 专栏频道子页面
      "community/jimu/zhuanti": { num: '130' }, // jumpUrl:130 - 专题详情页
      "caifu/jijin/fundselected": { num: '131' }, // jumpUrl:131 - 基金-我的自选基金
      "caifu/dingqi/channel": { num: '132' }, // jumpUrl:132 - 定期理财频道页 4.9.12 改为 稳健-固守聚合页
      "community/dynamicdetail": { num: '133' }, // jumpUrl:133 - 社区动态详情页面
      "community/fundplatform/jmaccountpage": { num: '134' }, // jumpUrl:134 - 基金运营平台-基金公司列表页面
      "community/fundplatform/jmaccountpage": { num: '135' }, // jumpUrl:135 - 基金运营平台-基金经理列表页面
      "community/fundplatform/dynamiclist": { num: '136' }, // jumpUrl:136 - 精选动态列表页面
      "stock/recommend": { num: '139' }, // jumpUrl:139 - 牛人推荐-股票
      "community/fundplatform/jmaccountpage": { num: '141' }, // jumpUrl:141 - 基金运营平台-基金公司列表页面
      "community/fundplatform/jmaccountpage": { num: '142' }, // jumpUrl:142 - 基金运营平台-基金经理列表页面
      "community/jimu/accountqrcode": { num: '144' }, // jumpUrl:144 - 积木账户二维码
      "stock/us/indexdetail": { num: '145' }, // jumpUrl:145 - 股票美股指数详情
      "hold/xby/transferdetail": { num: '147' }, // jumpUrl:147 - 信保盈转让交易详情
      "community/publisher": { num: '148' }, // jumpUrl:148 - 发布器
      "jimu/addfollow/subpage": { num: '149' }, // jumpUrl:149 - 添加专栏作者二级页面
      "community/jimu/topicpage": { num: '150' }, // jumpUrl:150 - 话题聚合页
      "community/jimu/followchannel": { num: '152' }, // jumpUrl:152 - 我关注的频道
      "operation/allservice": { num: '153' }, // jumpUrl:153 - 服务频道页子页
      "jdpay/paysettiing": { num: '154' }, // jumpUrl:154 - 支付设置页面
      "operation/allservice": { num: '155' }, // jumpUrl:155 - 全部服务页面
      "hold/dingqi/holddetail": { num: '157' }, // jumpUrl:157 - 定期持仓详情
      "plugin/jimikefu": { num: '158' }, // jumpUrl:158 - JIMI客服
      "hold/zhitou/homepage": { num: '159' }, // jumpUrl:159 - 智投主页
      "hold/jijin/singlehold": { num: '160' }, // jumpUrl:160 - 基金持仓小持仓
      "hold/jijin/holddetail": { num: '161' }, // jumpUrl:161 - 基金持仓详情
      "bankcard/mycardlist": { num: '162' }, // jumpUrl:162 - 银行卡管理-我的银行卡列表
      "bankcard/bankservice": { num: '163' }, // jumpUrl:163 - 银行卡管理-银行服务号
      "bankcard/cardmanagerlist": { num: '164' }, // jumpUrl:164 - 银行卡管理-卡片管理-(银行卡列表)
      "bankcard/cardmanagerdetail": { num: '165' }, // jumpUrl:165 - 银行卡管理-卡片管理-(银行卡详情)
      "bankcard/billdetail": { num: '166' }, // jumpUrl:166 - 银行卡管理-账单详情
      "appcommon/tencentmap/search": { num: '167' }, // jumpUrl:167 - 腾讯地图
      "hold/jizhi/holddetail": { num: '168' }, // jumpUrl:168 - 基智账户持仓详情
      "community/baoliaodetail": { num: '169' }, // jumpUrl:169 - 社区爆料详情页面
      "community/tanqianchannel": { num: '170' }, // jumpUrl:170 - 社区频道（谈钱频道）
      "community/message": { num: '171' }, // jumpUrl:171 - 社区频道-互动消息
      "main/lifechannel": { num: '172' }, // jumpUrl:172 - 支付频道 首页tab
      "stock/jump": { num: '173' }, // jumpUrl:173 - 股票SDK内部页面跳转
      "life/lottery/homepage": { num: '174' }, // jumpUrl:174 - 彩票首页
      "life/lottery/winnotice": { num: '175' }, // jumpUrl:175 - 彩票开奖公告
      "life/lottery/windetail": { num: '176' }, // jumpUrl:176 - 彩票开奖详情
      "main/youth/swicthpage": { num: '177' }, // jumpUrl:177 - 青春版切换版本页
      "main/youth/mainpage": { num: '178' }, // jumpUrl:178 - 青春版首页tab-消费生活H5
      "main/youth/xiaobaikapage": { num: '179' }, // jumpUrl:179 - 青春版首页tab-小白青春卡H5
      "community/jimu/messagesetting": { num: '180' }, // jumpUrl:180 - 积木账户消息设置页
      "caifu/certicateapply": { num: '181' }, // jumpUrl:181 - 资产证明申请流程
      "caifu/xjk/turninpage": { num: '182' }, // jumpUrl:182 - 小金库转入流程
      "caifu/xjk/turnoutpage": { num: '183' }, // jumpUrl:183 - 小金库转出流程
      "lkl/homepage": { num: '184' }, // jumpUrl:184 - 拉卡拉主页
      "caifu/weifuchong/homepage": { num: '185' }, // jumpUrl:185 - 微付充
      "life/phonerecharge/trafficcharge": { num: '186' }, // jumpUrl:186 - 手机充流量
      "jimu/personmainpage": { num: '187' }, // jumpUrl:187 - 个人主页
      "life/phonerecharge/feerecharge": { num: '188' }, // jumpUrl:188 - 手机话费充值 新版
      "bankcard/newmycardlist": { num: '189' }, // jumpUrl:189 - 我的银行卡列表 新版
      "jimu/regionasetting": { num: '190' }, // jumpUrl:190 - 地区设置
      "jimu/signaturesetting": { num: '191' }, // jumpUrl:191 - 个性签名设置
      "main/caifupage": { num: '192' }, // jumpUrl:192 - 财富频道
      "main/xinyongpage": { num: '193' }, // jumpUrl:193 - 信用频道
      "main/baoxianpage": { num: '195' }, // jumpUrl:195 - 保险频道
      "lego/feedspage": { num: '196' }, // jumpUrl:196 - 5.0系统运营页面
      "main/lifepage": { num: '198' }, // jumpUrl:198 - 生活频道
      "caifu/subpage/professional": { num: '199' }, // jumpUrl:199 - 财富二级-专业
      "life/subpage/carddiscount": { num: '200' }, // jumpUrl:200 - 银行卡特惠
      "xiaojin/jintiao/subpage": { num: '201' }, // jumpUrl:201 - 金条二级页面
      "life/nfc/recharge": { num: '202' }, // jumpUrl:202 - 一卡通NFC充值(北京)-仅Android
      "community/answercommunity/message": { num: '203' }, // jumpUrl:203 - 消息中心-互动通知
      "community/answercommunity/myfollows": { num: '208' }, // jumpUrl:208 - 社区-我的粉丝
      "community/answercommunity/questiondetail": { num: '209' }, // jumpUrl:209 - 社区-问题详情页
      "community/answercommunity/personpage": { num: '210' }, // jumpUrl:210 - 社区-普通用户个人主页
      "community/answercommunity/invitationanswer": { num: '211' }, // jumpUrl:211 - 社区-邀请回答页
      "community/answercommunity/commentdetail": { num: '212' }, // jumpUrl:212 - 社区-评论详情页
      "community/answercommunity/answerdetail": { num: '213' }, // jumpUrl:213 - 社区-回答详情页
      "community/answercommunity/questionpublisher": { num: '214' }, // jumpUrl:214 - 社区-发布问题页
      "community/answercommunity/answerpublisher": { num: '215' }, // jumpUrl:215 - 社区-回答发布页
      "setting/pushsetting": { num: '216' }, // jumpUrl:216 - 设置-服务号消息推送设置
      "usercenter/personcenter/setting": { num: '217' }, // jumpUrl:217 - 个人页-信息设置（仅安卓.iOS使用5016）
      "community/myattention": { num: '218' }, // jumpUrl:218 - 社区-我的关注页
      "caifu/gaoduan/homepage": { num: '219' }, // jumpUrl:219 - 财富-高端理财频道页
      "hold/jijin/zhongchanhold": { num: '220' }, // jumpUrl:220 - 中产持仓
      "hold/jijin/zhongchanholddetail": { num: '221' }, // jumpUrl:221 - 中产持仓详情
      "community/myattentionfeed": { num: '222' }, // jumpUrl:222 - 我的关注列表流
      // "insurance/insuranceList":{num:'223'},                      // jumpUrl:223 - 保险产品列表页
      // "jimu/videoDetail":{num:'224'},                             // jumpUrl:224 - 积木视频播放页
      "caifu/xjk/openxjk": { num: '2001' }, // jumpUrl:2001 - 开通小金库的首页
      "caifu/xjk/openresult": { num: '2002' }, // jumpUrl:2002 - 开通小金库结果页面
      "stock/openweb": { num: '2003' }, // jumpUrl:2003 - 股票sdk内部跳转
      "ocr/bankcard": { num: '2004' }, // jumpUrl:2004 - OCR银行卡识别
      "ocr/identityid": { num: '2005' }, // jumpUrl:2005 - OCR身份证识别
      "appsystem/sendsms": { num: '2006' }, // jumpUrl:2006 - 短信功能
      "face/main": { num: '2007' }, // jumpUrl:2007 - 人脸识别
      "appsystem/contacts": { num: '2008' }, // jumpUrl:2008 - 通信录点选
      "appsystem/photoalbum": { num: '2009' }, // jumpUrl:2009 - 相机相册点选
      "appcommon/nonetwork": { num: '2010' }, // jumpUrl:2010 - 无网络说明
      "jdpay/openjdpay": { num: '2011' }, // jumpUrl:2011 - 京东支付
      "jdpay/quickpay": { num: '2012' }, // jumpUrl:2012 - 京东闪付
      "appsystem/call": { num: '2013' }, // jumpUrl:2013 - 拨号打电话页面
      "face/experience": { num: '2014' }, // jumpUrl:2014 - 刷脸登录体验
      "account/loginpage": { num: '2015' }, // jumpUrl:2015 - 登录页面
      "lkl/bracelet": { num: '2016' }, // jumpUrl:2016 - 拉卡拉手环
      "jdpay/waveredpageket": { num: '2017' }, // jumpUrl:2017 - U235红包（声波）
      "jdpay/thirdopenjdpay": { num: '2018' }, // jumpUrl:2018 - 第三方APP唤起支付SDK
      "face/getphoto": { num: '2019' }, // jumpUrl:2019 - 人脸识别,获取识别照片
      "ocr/identityid/getresult": { num: '2020' }, // jumpUrl:2020 - 身份证识别, 获取识别结果
      "appcommon/facerecognition/login": { num: '2021' }, // jumpUrl:2021 - 风控刷脸登录
      "jdpay/huntermap": { num: '2022' }, // jumpUrl:2022 - 猎户地图
      "jdminiprogram/programlist": { num: '2023' }, // jumpUrl:2023 - 京东小程序列表
      "jdminiprogram/open": { num: '2024' }, // jumpUrl:2024 - 跳转到某个京东小程序
      "plugin/life/jdwallet": { num: '3000' }, // jumpUrl:3000 - 钱包&&生活业务跳转
      "plugin/life/gasstation": { num: '3001' }, // jumpUrl:3001 - 车主帮-加油站列表页
      "caifu/wenjian/newchannel": { num: '3120' }, // jumpUrl:3120 - 乐高搭建的稳健频道
      "messagecenter/feedback/list": { num: '5001' }, // jumpUrl:5001 - 我的反馈-消息站内信
      "messagecenter/messagedetail": { num: '5003' }, // jumpUrl:5003 - 系统通知-消息站内信
      "messagecenter/jimu/subscribearticle": { num: '5004' }, // jumpUrl:5004 - 订阅专栏作者文章-消息站内信
      "messagecenter/jimu/subscribecomment": { num: '5005' }, // jumpUrl:5005 - 订阅专栏文章评论-消息站内信
      "caifu/jijin/managerlist": { num: '5006' }, // jumpUrl:5006 - 基金经理列表页-基金详情
      "caifu/jijin/managerdetail": { num: '5007' }, // jumpUrl:5007 - 基金经理详情页-基金详情
      "caifu/jijin/fundarchives": { num: '5008' }, // jumpUrl:5008 - 基金档案-基金详情
      "caifu/jijin/fundinvest": { num: '5009' }, // jumpUrl:5009 - 投资组合-基金详情
      "caifu/jijin/fundcompany": { num: '5010' }, // jumpUrl:5010 - 基金公司-基金详情
      "caifu/jijin/tradeexplain": { num: '5011' }, // jumpUrl:5011 - 基金交易说明-基金详情
      "caifu/xjk/totalincome": { num: '5012' }, // jumpUrl:5012 - 小金库-累计收益
      "tradeorder/list": { num: '5013' }, // jumpUrl:5013 - 交易单（同10 处理一下➕1 的逻辑iOS）
      "hold/lecai/redeemdetail": { num: '5015' }, // jumpUrl:5015 - 赎回单详情-乐猜
      "usercenter/personcenter/setting": { num: '5016' }, // jumpUrl:5016 - 个人设置页
      "hold/jijin/changebonus": { num: '5017' }, // jumpUrl:5017 - 基金修改分红方式
      "life/creditcard/homepage": { num: '5018' }, // jumpUrl:5018 - 信用卡首页-新版
      "jimu/settingmessagetype": { num: '5019' }, // jumpUrl:5019 - 设置接收消息类型
      "jimu/blacklist": { num: '5020' }, // jumpUrl:5020 - 黑名单列表页 
      "appcommon/wxminiprogram/openprogram": { num: '7000' }, // jumpUrl:7000 - 微信小程序相关业务跳转
      "flutter/community/newfollower": { num: '8001' }, // jumpUrl:8001 - 消息中心-新增关注
      "flutter/community/agreelist": { num: '8002' }, // jumpUrl:8002 - 消息中心-收到的赞同
      "flutter/community/comment": { num: '8003' }, // jumpUrl:8003 - 消息中心-评论与回复
      "flutter/community/invitationanswer": { num: '8004' }, // jumpUrl:8004 - 消息中心-邀请与回答
      "shouye/debugpage": { num: '9000' }, // jumpUrl:9000 - 首页事项预览
      "test/debugpage": { num: '20180109' } // jumpUrl:20180109 - 摇一摇测试页
  }

  global.___JUMPMAP___ = function(str) {
      return JUMPMAP[str]
  }
})(typeof window !== 'undefined' ? window : this)

!(function(global, factory) {

  // 'use strict';

  if (typeof define === 'function' && define.amd) {

      define(function() {
          return (global.JrBridge = factory(global)); // amd异步加载方式
      });

  } else if (typeof module !== 'undefined' && module.exports) {

      module.exports = factory(global); // moudle模块导入方式

  } else {

      global.JrBridge = factory(global); // js文件引入方式

  }

})(typeof window !== 'undefined' ? window : this, function(global) {
  'use strict';

  // jssdk 当前版本
  var VERSION = "2.1.3";
  var curVersion = Number(VERSION.split('.').join('')) // 当前版本号转数字类型
  var exitVersion = (JrBridge && JrBridge._version) ? Number(JrBridge._version.split('.').join('')) : 0 // 已存在版本号转数字类型

  // 重复引用情况下的版本判断，始终使用最大版本
  if (!JrBridge || exitVersion < curVersion) {
      // 版本兼容判断APP版本号
      var DIFFAPPVERSION = '5.1.0'
      // 客户端通信 callback 回调方法（老版本 -- 同步式调用）
      var nativeCallback = null
      // 客户端通信 callback 回调方法（新版本 -- 异步式调用）
      var callBackMap = {}

      /* 环境判断 */
      var ua = navigator.userAgent;
      var isJdJrApp = /jdjr/g.test(ua.toLowerCase()); // 是否在京东金融app
      var isJdApp = /jdapp/g.test(ua.toLowerCase()); // 是否在京东商城app
      var isAndroid = /((Android)|(Adr))/g.test(ua); // 是否在andriod环境
      var isIos = /\(i[^;]+;( U;)? CPU.+Mac OS X/g.test(ua); // 是否在IOS环境
      var _pf = navigator.platform.toLowerCase();
      var isPc = !(!_pf.match("mac") && !_pf.match("win")); // 是否在PC环境

      var application = ua.match(/application.*?&/g) // 是否在京东金融老年版app（跳转兼容）
      var isJDJR_Aget_App = false
      if (application) {
          isJDJR_Aget_App = application[0].slice(application[0].indexOf("=") + 1, -1) === 'JDJR-App-Aged' ? true : false
      }

      /* 工具区 */
      var Type = {};
      for (var i = 0, type; type = ['String', 'Number', 'Boolean', 'Array', 'Object', 'Function'][i++];) {
          (function(type) {
              Type['is' + type] = function(obj) {
                  return Object.prototype.toString.call(obj) === '[object ' + type + ']';
              }
          })(type)
      }

      // 原生ajax请求方法
      var $ajax = function(config, successFunc, failFunc) {
          var req = null;
          try {
              if (global.XMLHttpRequest) {
                  req = new XMLHttpRequest();
              } else {
                  req = new ActiveXObject("Microsoft.XMLHTTP")
              }
              req.onreadystatechange = function() {
                  if (req.readyState === 4) {
                      if (req.status === 200) {
                          if (Type.isFunction(successFunc)) successFunc(JSON.parse(req.responseText))
                      } else {
                          if (Type.isFunction(failFunc)) failFunc(JSON.parse(req.responseText))
                      }
                  }
              }
              req.open('POST', config.url, true);
              req.setRequestHeader("Content-type", "application/x-www-form-urlencoded;charset=UTF-8");
              req.send(JSON.stringify(config.data));
          } catch (error) {
              console.log(error)
          }
      }

      // util工具
      var utils = {
          // 动态生成callbackId
          getCallbackName: function() {
              var callbackId = 'callback' + Number(Math.random().toString().substr(3,10) + Date.now()).toString(36);
              return callbackId
          },
          // app版本号比较方法（targeVersion：需要比较的目标版本，大于等于返回true，小于返回false）
          curvBiggerThen: function(targetVerison) {
              var targetVerisonArr = targetVerison.split('.')
              var targetDigitOne = Number(targetVerisonArr[0]) // 目标大版本号
              var targetDigitTwo = transformNum(targetVerisonArr[1]) // 目标小版本号
              var targetDigitThree = transformNum(targetVerisonArr[2]) // 目标细分版本号

              var ua = navigator.userAgent;
              var clientVersion = ua.match(/clientVersion.*?&/g)
              if (clientVersion) {
                  var currentVersionArr = clientVersion[0].slice(clientVersion[0].indexOf("=") + 1, -1).split('.')
                  var currentDigitOne = Number(currentVersionArr[0]) // 当前大版本号
                  var currentDigitTwo = transformNum(currentVersionArr[1]) // 当前小版本号
                  var currentDigitThree = transformNum(currentVersionArr[2]) // 当前细分版本号
              }

              // 大版本号比较
              if (currentDigitOne > targetDigitOne) {
                  return true
              } else if (currentDigitOne < targetDigitOne) {
                  return false
              } else if (currentDigitOne === targetDigitOne) {
                  // 小版本号比较
                  if (currentDigitTwo > targetDigitTwo) {
                      return true
                  } else if (currentDigitTwo < targetDigitTwo) {
                      return false
                  } else if (currentDigitTwo === targetDigitTwo) {
                      // 细分版本号比较
                      if (currentDigitThree >= targetDigitThree) {
                          return true
                      } else if (currentDigitThree < targetDigitThree) {
                          return false
                      }
                  }
              }
              // 版本号补位方法
              function transformNum (digitStr) {
                  var digitNumber
                  if (digitStr.length === 1 && digitStr !== '0') {
                      digitNumber = Number(digitStr + '00')
                      return digitNumber
                  } else if (digitStr.length === 2) {
                      digitNumber = Number(digitStr + '0')
                      return digitNumber
                  } else if (digitStr.length === 3 || digitStr === '0') {
                      digitNumber = Number(digitStr)
                      return digitNumber
                  }
              }
          }
      }

      /**
       * 安卓通信统一回调。此方法兼容老版本的回调，新设计的通信回调不为固定一个方法，动态传入
       * @param data
       */
      if (isJdJrApp && isAndroid) {
          global.goToGetres = function(data) {
              try {
                  if (utils.curvBiggerThen('5.3.0')) {

                      if (/callbackid/.test(data)) {
                          var dataObj = JSON.parse(data)
                          var cbMap = window.callBackMap
                          if (cbMap && cbMap[dataObj.callbackid]) {
                              cbMap[dataObj.callbackid](data)
                          }
                      } else {
                          window.nativeCallback && window.nativeCallback(data);
                      }

                  } else {
                      window.nativeCallback && window.nativeCallback(data);
                  }
              } catch (error) {
                  console.log(error);
              }
          };
      }

      /* 京东app专用回调 */
      if (isJdApp) {
          global.goToJDAppGetres = function(data) {
              try {
                  window.nativeCallback && window.nativeCallback(data);
              } catch (error) {
                  console.log(error);
              }
          };
      }


      var JrBridge = (function() {

          /* private */
          var readyCallbacks = []; // 存放监听ready 的焦点函数集。(原生api调用集合)
          var focusCallbacks = []; // 存放监听webViewFocus 的焦点函数集。
          var bridgeStatus = {
              ready: false, // APP通信初始化完成*/
              listener: false, // IOS通信桥初始化注册监听事件完成
              listenerFocus: false // 监听webView醒来
          };
          var callbackHub = []; // 存放安全键盘回调函数

          // 客户端版本兼容信息
          var clientVersion = ua.match(/clientVersion.*?&/g)
          var targetNumber = clientVersion ? clientVersion[0].slice(clientVersion[0].indexOf("=") + 1, -1).split('.').join('').slice(0, 3) : ''
          var compareVersion = targetNumber < 522;

          /* * 监控上报
              * bid 业务id（产品提供，查数用）
              * param_json	自定义参数
              *  v    当前jsbridge版本	version
                  s   系统类型：iOS/andr	systemType
                  a   手机平台
                  c   客户端版本	clientVersion
                  u   当前接入页面的url	url
                  t   当前页面title	title
                  l   加载完成时间	loadTime
              * https://cf.jd.com/pages/viewpage.action?pageId=157313665
          */
          if (!isPc && (isIos || isAndroid) && (isJdJrApp || isJdApp)) {
              try {
                  /* 根据环境判断上报 */
                  var protocol = location.protocol.indexOf('https:') > -1 ? 'https:' : 'http:';
                  var env = protocol + (location.host.indexOf('m.jr.jd.com') > -1 ? '//m' : '//minner');
                  var dur = performance && performance.getEntriesByName ? performance.getEntriesByName(env + '.jr.jd.com/common/jssdk/jrbridge/' + VERSION + '/jrbridge.js')[0] || null : null;
                  var config = {
                      url: protocol + '//jrmfp.jr.jd.com/npvuv',
                      data: {
                          bid: 'jrjssdk1001',
                          param_json: {
                              v: VERSION,
                              s: isIos ? 'iOS' : isAndroid ? 'Android' : 'sms',
                              a: isJdApp ? 'JDAPP' : isJdJrApp ? 'JDJRAPP' : '',
                              c: clientVersion || '',
                              u: encodeURIComponent(location.href) || '',
                              t: document.title || '',
                              l: dur && dur.duration ? Number(dur.duration).toFixed() + 'ms' : ''
                          }
                      }
                  };
                  $ajax(config);
              } catch (error) {}
          }

          // 老版本jumpType与新版本protocolParams映射关系
          var Container_Login_Wallet = {
              'h5/false/_': {
                  jumpType: 2,
              },
              'native/true/_': {
                  jumpType: 5,
              },
              'native/false/_': {
                  jumpType: 6,
              },
              'h5/_/_': {
                  jumpType: 7,
              },
              'h5/true/_': {
                  jumpType: 8,
              },
              'h5/true/true': {
                  jumpType: 9,
              },
              'h5/false/true': {
                  jumpType: 10,
              },
              'rn/false/_': {
                  jumpType: 11,
              },
              'rn/true/_': {
                  jumpType: 12,
              },
              'xview/false/_': {
                  jumpType: 13,
              },
              'xview/true/_': {
                  jumpType: 14,
              }
          }

          /* sendWeiXinCot 默认分享渠道配置
          *  0-微信朋友圈，1-微信好友，2-新浪微博，3-短信，4-QQ好友，5-QQ空间
          */
          var defaultChannel = ["0", "1", "4", "5", "3"]
          //是否强制使用默认分享渠道 ，false不强制，true强制
          var isSure = false;
          /* sendWeiXinCot 默认配置 */
          var cotDefaut = {
              appId: '',
              img: window.location.protocol + '//m.jr.jd.com/statics/logo.jpg',
              link: window.location.protocol + '//m.jr.jd.com/',
              /* 最具全面的理财软件 */
              desc: '\u6700\u5177\u5168\u9762\u7684\u7406\u8d22\u8f6f\u4ef6',
              /* 欢迎使用京东金融app */
              title: '\u6b22\u8fce\u4f7f\u7528\u4eac\u4e1c\u91d1\u878d\u0061\u0070\u0070',
              friendesc: '\u6b22\u8fce\u4f7f\u7528\u4eac\u4e1c\u91d1\u878d\u0061\u0070\u0070',
              /* 分享 */
              btnTextS: '\u5206\u4eab',
              /* 跳转 */
              btnTextJ: '\u8df3\u8f6c',
              /* 金融 */
              btnTextN: '\u91d1\u878d'
          };

          // 校验分享渠道
          function checkChannel(channels, links) {
              try {
                  var newChannel = defaultChannel;
                  if (channels && Type.isArray(channels) && channels.length > 0) {
                      if (!isSure) {
                          /* 过滤固定值 */
                          channels.forEach(function(value, i) {
                              if (parseInt(value) === 2) channels.splice(i, 1);
                          })
                          newChannel = channels;
                      }
                  }
                  if (links.length > 0) {
                      if (links.toString().indexOf("open.weixin.qq.com") != -1) {
                          newChannel = ["0", "1"];
                      }
                  }
                  return newChannel;
              } catch (error) {

              }
          }

          // 校验分享链接
          function checkUrl(links, url) {
              try {
                  var newArrUrl = [];
                  if (!links) {
                      for (var i = 0; i < defaultChannel.length; i++) {
                          newArrUrl.push(url);
                      }
                  } else {
                      for (var i = 0, lls = (Type.isArray(links) && links.length < 6 ? links.length : 6); i < lls; i++) {
                          newArrUrl.push(links[i] || url);
                      }
                  }
                  return newArrUrl;
              } catch (error) {

              }
          }

          // 设置分享数据
          function defaultShareData(a) {
              var c = {};
              if (!Type.isObject(a)) a = cotDefaut;
              for (var k in a) {
                  if (k == 'img' || k == 'link') {
                      c[k] = (a[k].length <= 0 ? cotDefaut[k] : ((/http:|https:/i).test(a[k]) ? a[k] : window.location.protocol + a[k]));
                  } else if (k == 'btnTextS' || k == 'btnTextJ' || k == 'btnTextN') {} else {
                      c[k] = a[k] || cotDefaut[k];
                  }
              }
              return c;
          };

          // 分享入参
          function configShareChannel(optionNew, option) {
              try {
                  var newOption = {
                      "isLogin": optionNew.isLogin || "0",
                      "id": optionNew.id || "5",
                      "linkSubtitle": optionNew.linkSubtitle || option.desc,
                      "imageUrl": optionNew.imageUrl || option.img,
                      "link": checkUrl(optionNew.link, option.link),
                      "linkTitle": optionNew.linkTitle || option.title,
                      "channels": checkChannel(optionNew.channels, checkUrl(optionNew.link, option.link)),
                      "productName": optionNew.productName || "",
                      "productId": optionNew.productId || ""
                  }

                  // 兼容微信小程序分享
                  if (optionNew.channelList && Type.isArray(optionNew.channelList) && optionNew.channelList.length > 0) {
                      newOption.channelList = optionNew.channelList
                  }

                  return newOption;
              } catch (error) {}
          };

          // =========》sendWeiXinCot 分享相关配置结束

          /* 核心区域 */
          var coreObj = {

              init: function() {
                  var _this = this;
                  console.log('init');

                  if (isAndroid) {

                      if (window.jd) {
                          _this.noticeReady();
                      }

                  } else if (isIos) {

                      if (window.WebViewJavascriptBridge) {
                          _this.noticeReady();
                      }

                      document.addEventListener('WebViewJavascriptBridgeReady', function(event) {
                          console.log('WebViewJavascriptBridgeReady事件触发', window.initStatus)
                          var bridge = event['bridge'];

                          if (!window.initStatus) {
                              window.initStatus = true
                              bridge.init(function(msg) {
                                  console.log('============== iOS 初始化 后回调 ===========', msg, window.callBackMap)
                                  if (utils.curvBiggerThen('5.3.0')) {

                                      if (msg && msg.callbackid && window.callBackMap && window.callBackMap[msg.callbackid]) {
                                          window.callBackMap[msg.callbackid](msg)
                                      } else {
                                          window.nativeCallback && window.nativeCallback(msg)
                                      }

                                  } else {
                                      window.nativeCallback && window.nativeCallback(msg)
                                  }
                              });

                              console.log('bridge.init():END');
                              _this.noticeReady();
                          }

                      }, true);

                  } else {
                      console.log('Only support android and ios');
                  }
              },

              // JrBridge初始化完成，改变ready状态
              noticeReady: function() {
                  if (window.readyCallbacks && window.readyCallbacks.length) {
                      bridgeStatus.ready = true;
                      for (var i = 0; i < window.readyCallbacks.length; i++) {
                          window.readyCallbacks[i]();
                      } 
                      window.readyCallbacks = [];
                  } else {
                      window.readyCallbacks = []
                  }
              },

              // 客户端通信协议调用栈
              ready: function(callback) {
                  if (typeof callback === 'function') {
                      if (window.readyCallbacks) {
                          window.readyCallbacks.push(callback)
                      } else {
                          window.readyCallbacks = [callback]
                      }
                  }

                  if (window.WebViewJavascriptBridge) {
                      if (window.readyCallbacks && window.readyCallbacks.length) {
                          for (var i = 0; i < window.readyCallbacks.length; i++) {
                              window.readyCallbacks[i]();
                          }
                          window.readyCallbacks = [];
                      } else {
                          window.readyCallbacks = []
                      }

                  } else {
                      this.init();
                  }
              },

              /**
               * brigde 公共原生方法调用区
               * @param apiName Function 调用原生方法名
               * @param params String 原生方法入参
               * @param autoCallbackName String 原生方法回调
               */
              callNativeAPI: function(apiName, params, autoCallbackName) {
                  var _this = this;

                  console.log('=============callNativeAPI', apiName, params, Object.prototype.toString.call(autoCallbackName));

                  // 原生通信
                  try {
                      // Android
                      if (isAndroid) {

                          // 安卓全局对象
                          if (window.jd) {
                              if (typeof params === 'object') params = JSON.stringify(params);
                              window.jd[apiName](params);
                          }

                      } else if (isIos) { // iOS
                          console.log('.WebViewJavascriptBridge.', window.WebViewJavascriptBridge)
                          // iOS WebViewJavascriptBridge
                          if (window.WebViewJavascriptBridge) {
                              console.log('=======iOS in', apiName, params)
                              window.WebViewJavascriptBridge['callHandler'](apiName, params, function(res) {
                                  console.log('============== iOS预判的回调', res)

                              });
                          } else {
                              // WKWebView
                              if (window['webkit'] && 
                                  window['webkit']['messageHandlers'] && 
                                  window['webkit']['messageHandlers'][apiName] &&
                                  Type.isFunction(window['webkit']['messageHandlers'][apiName].postMessage)) 
                              {
                                  window['webkit']['messageHandlers'][apiName].postMessage(params);
                              }
                          }

                      }
                  } catch (e) {
                      console.log('catch', e);
                  }
              },

              /**
               * 根据版本 创建回调
               * @param callback Function 开发者定义的回调
               * @param autoCallbackName String 自动创建回调函数名称
               */
              setCallback: function(callback, autoCallbackName, typeFilter) {
                  var callBackFun = function(data) {
                      try {
                          if (typeof data != 'object'){
                              data = JSON.parse(data);
                              if (data.callbackid) delete data.callbackid
                          } else {
                              delete data.callbackid
                          }

                          if (typeFilter && typeFilter.status && typeFilter.type) {
                              if (Type.isObject(data)) {
                                  var whiteCtr = false;
                                  if (String(data.type) === '43') {
                                      whiteCtr = (String(typeFilter.type) === '0' || String(typeFilter.type) === '43') ? false : true;
                                  }
                                  if (whiteCtr) return;
                                  callback(data)
                              }
                          } else {
                              /* 处理安全键盘回调 */
                              if (Type.isObject(data) && data.keyboardType) {
                                  if (String(data.successStatus) === '1' && window.callbackHub && Type.isFunction(window.callbackHub[1])) {
                                      window.callbackHub.pop().call(null, data)
                                  } else if (window.callbackHub && window.callbackHub.length > 0) {
                                      window.callbackHub[0](data)
                                  }
                                  return;
                              } else if (String(data.type) === '43' && Type.isString(typeFilter)) {
                                  return;
                              }
                              callback(data)
                          }
                      } catch (error) {
                          callback(data)
                      }
                  }

                  if (utils.curvBiggerThen('5.3.0')) { // 此处为版本判断,新版
                      console.log('异步回调',autoCallbackName)

                      if (window.callBackMap) {
                          window.callBackMap[autoCallbackName] = callBackFun // 新版回调缓存池
                      } else {
                          window.callBackMap = {}
                          window.callBackMap[autoCallbackName] = callBackFun // 新版回调缓存池
                      }

                      // callBackMap[autoCallbackName] = callBackFun // 新版回调缓存池
                      window.nativeCallback = callBackFun // 老版全局回调
                  } else {
                      window.nativeCallback = callBackFun // 老版全局回调
                  }

              },

              /**
               * 校验参数是否为对象类型
               * @param data 需要校验的参数对象
               */
              checkParam: function(data) {
                  return data && Type.isObject(data) ? true : false;
              },

              /**
               * getResponse协议功能列表
               * @param data callNative方法入参
               */
              checkGetResponse: function(data) {
                  var type = data.type
                  var typeList = [
                      '1','2','3','4','5','6','7','8','9','10',
                      '11','12','13','14','15','16','17','18','19','20',
                      '21','22','23','24','25','26','27','28','29','30',
                      '31','32','33','34','35','36','37','38','39','40',
                      '41','42','43','44','45','46','47','48','49','50',
                      '51','52','53','54','55','56','57','58','59','60',
                      '61','62','63','64','65','66','67','68','70','72',
                      '73','74','75','76','77','78','79','80','81','82',
                      '83','84','85','5000','5001','5002'
                  ]
                  return typeList.indexOf(type) > -1
              },

              /** ==================================== API部分 ==================================== **/

              /** getResponse 原生通信 **/
              callNative: function(params, callback) {
                  var _this = this;
                  var typeFilter = null;
                  if (_this.checkParam(params)) {
                      // getResponse协议功能注册校验
                      if (_this.checkGetResponse(params)) {
                          /* 设置过滤多次调用 */
                          if (params.type) {
                              typeFilter = (params.filterStatus && params.filterStatus === '0') ? null : {
                                  status: true,
                                  type: params.type
                              };
                          }

                          /* 分享参数格式化 */
                          if (params && Type.isObject(params) && Number(params.type) === 4) {
                              params = {
                                  type: params.type,
                                  shareDate: defaultShareData(params.shareDate),
                                  shareDataNew: configShareChannel(params.shareDataNew || {}, params.shareDate || {})
                              }
                          }

                          /* type=48 andriod和ios两端参数兼容
                          * 针对安卓端入参的 data 字段进行兼容处理，转为字符串类型
                          */
                          if (isAndroid) {
                              if (params.type === 48) {
                                  var methodType = params.data.type
                                  delete params.data.type
                                  params.data["methodType"] = methodType
                                  params.data = JSON.stringify(params.data)
                              } else if (params.data && Type.isObject(params.data)) {
                                  console.log("安卓入参：", params, JSON.stringify(params.data))
                                  params.data = JSON.stringify(params.data)
                              }
                          }

                          /* 设置回调 */
                          var callbackName = utils.getCallbackName();
                          if (callback) {
                              _this.setCallback(callback, callbackName, typeFilter);
                              if (utils.curvBiggerThen('5.3.0')) {
                                  params.callbackid = callbackName
                              }
                          }

                          /* 调用方法 */
                          _this.ready(function() {
                              _this.callNativeAPI('getResponse', params, callbackName);
                          });

                      } else {
                          callback({
                              code: '200',
                              msg: '当前方法未在jsbridge中注册，调用前请查阅js通信使用文档。'
                          })
                      }
                  }
              },

              /** closeWebViewExtend 跳转协议 */
              openView: function(params) {
                  var _this = this;
                  var schemeData = '';
                  var option = {};

                  // productId isclose param 三个参数优先进行合法性校验
                  if (params.productId && Type.isString(params.productId)) {
                      option.productId = params.productId;
                  }
                  if (Type.isBoolean(params.isclose)) {
                      option.isclose = params.isclose;
                  }
                  if (params.param && Type.isObject(params.param)) {
                      option.param = params.param;
                  }

                  if (!isNaN(params.target)) { // target值为数字的情况

                      option.jumpUrl = params.target
                      jumpAction(option)

                  } else if (params.target && Type.isString(params.target)) { // target值为字符串的情况

                      if (isJDJR_Aget_App) { // 判断环境是否为老年版app

                          schemeHandle('jdmobile-aged://com.jd.jrapp/')

                      } else { // 主站app

                          if (compareVersion) { // 老版本

                              if (/(http|https):\/\//.test(params.target)) { // h5、rn跳转
                                  option.jumpUrl = params.target
                              } else if (___JUMPMAP___(params.target)) { // 原生跳转
                                  option.jumpUrl = ___JUMPMAP___(params.target).num
                              }
                              jumpAction(option)

                          } else { // 新版本

                              schemeHandle('openjdjrapp://com.jd.jrapp/')
                          }
                      }

                  }

                  function schemeHandle(protocol) {
                      console.log('schemeProtocol：', protocol)
                      if (/(http|https):\/\//.test(params.target)) { // h5、rn跳转
                          // schemeData = 'openjdjrapp://' + params.target.replace(/(http|https):\/\//,'');
                          schemeData = params.target // 跳转h5和rn，传递原始页面链接，不作协议头替换
                          console.log('schemeH5&RN跳转：=', schemeData)
                      } else if (params.target) { // 原生跳转
                          console.log('jumpNatvie')
                          schemeData = protocol + params.target;
                      }

                      // scheme参数校验拼接
                      console.log(22247, params)
                      schemeData = schemeData + (params.target.indexOf('?') > -1 ? '&' : '?') + 'jrcontainer=' + params.container.trim()
                      schemeData = schemeData + (Type.isBoolean(params.islogin) ? '&jrlogin=' + params.islogin : '');
                      schemeData = schemeData + (Type.isBoolean(params.wallet) ? '&jrwallet=' + params.wallet : '');
                      schemeData = schemeData + (option.productId ? '&jrproductid=' + encodeURIComponent(option.productId) : '');
                      schemeData = schemeData + (Type.isBoolean(option.isclose) ? '&jrcloseweb=' + option.isclose : '');
                      schemeData = schemeData + (option.param ? '&jrparam=' + encodeURIComponent(JSON.stringify(option.param)) : '');
                      console.log('schemeData:::::::',schemeData)
                      _this.ready(function() {
                          _this.callNativeAPI('closeWebViewScheme', schemeData);
                      });
                  }

                  function jumpAction(option) {
                      // container islogin wallet 三个参数决定老版本jumpType值
                      var str = '';
                      Type.isString(params.container) ? str += params.container.trim() : str += '_';
                      Type.isBoolean(params.islogin) ? str += '/' + params.islogin : str += '/_';
                      Type.isBoolean(params.wallet) && JSON.parse(params.wallet) === true ? str += '/' + params.wallet : str += '/_';
                      if (Container_Login_Wallet[str]) option.jumpType = Container_Login_Wallet[str].jumpType;

                      // 方法入参差异化处理
                      if (isAndroid) {
                          /* 根据需求重构，删除jumpUrl、jumpType */
                          var option = {
                              forward: option,
                              isclose: option.isclose,
                              productId: option.productId
                          }
                      }

                      console.log(option)
                          // 老版本跳转方法
                      _this.ready(function() {
                          _this.callNativeAPI('closeWebViewExtend', option);
                      });
                  }

              },

              /** Scheme 统一跳转 */
              openScheme: function (schemeData) {
                  var _this = this
                  if (isAndroid) {
                      var data = {
                          forward: schemeData,
                          isclose: schemeData.isclose,
                          productId: schemeData.productId
                      }
                      _this.ready(function() {
                          _this.callNativeAPI('closeWebViewExtend', data);
                      });
                  } else if (isIos) {
                      _this.ready(function() {
                          _this.callNativeAPI('closeWebViewExtend', schemeData);
                      });
                  }
              },

              /** closeWebView 按钮点击关闭当前webview */
              closeView: function() {
                  var _this = this;
                  this.ready(function() {
                      _this.callNativeAPI('closeWebView', null);
                  });
              },

              /** WebViewNaviBar 设置顶部通栏 */
              setTopBar: function(params, callback) {
                  var _this = this;
                  if (_this.checkParam(params)) {
                      /*
                      * 方法版本值，固定值、覆盖后该方法失效。注意version不加 android可以，ios背景展示会有问题，参数不对也是如此.故在此固定
                      */
                      params.version = 100;
                      /* 配置回调方法 */
                      var callbackName = utils.getCallbackName()
                      if (callback) {
                          _this.setCallback(callback, callbackName)
                          if (utils.curvBiggerThen('5.3.0')) {
                              params.callbackid = callbackName
                          }
                      }
                      if (Type.isArray(params.rightItemList) && params.rightItemList[0]) {
                          var rightItemList = params.rightItemList[0];
                          if (String(rightItemList.jumpType) === '2' && rightItemList.jumpData) {
                              rightItemList.jumpData = configShareChannel(rightItemList.jumpData || {}, {})
                          }
                      }
                      this.ready(function() {
                          _this.callNativeAPI('WebViewNaviBar', params, callbackName);
                      })
                  }
              },

              /** WebViewNaviBar 设置顶部通栏（仅分享） */
              setTopBarShare: function(params, callback) {
                var _this = this;

                /* 配置回调方法 */
                var callbackName = utils.getCallbackName()
                if (callback) {
                    _this.setCallback(callback, callbackName)
                    if (utils.curvBiggerThen('5.3.0')) {
                        params.callbackid = callbackName
                    }
                }

                this.ready(function() {
                    _this.callNativeAPI('WebViewNaviBar', params, callbackName);
                })
              },

              /** sendWeiXinCot - 设置右上角分享
               * @param params
               */
              setShareConfig: function(params, callback) {
                  var _this = this;
                  if (_this.checkParam(params)) {
                      
                      params = {
                          isShow: params.isShow,
                          optionType: 1,
                          btnText: params.btnText || cotDefaut.btnTextS,
                          shareDate: defaultShareData(params.shareDate),
                          shareDataNew: configShareChannel(params.shareDataNew || {}, params.shareDate || {})
                      }

                      var callbackName = utils.getCallbackName()
                      if (callback) {
                          _this.setCallback(callback, callbackName)
                          if (utils.curvBiggerThen('5.3.0')) {
                              params.callbackid = callbackName
                          }
                      }

                      this.ready(function() {
                          _this.callNativeAPI('sendWeiXinCot', params, callbackName);
                      });
                  }
              },

              /**
               * sendWeiXinCot - 设置右侧面板跳转h5、原生
               * @param params
               */
              setMenuPanel: function(params) {
                  var _this = this,
                      _params = {};
                  if (_this.checkParam(params) && params.optionType) {
                      params.optionType = Number(params.optionType)
                      if (params.optionType > 1 && params.optionType <= 4) {
                          _params = {
                              isShow: params.isShow,
                              optionType: params.optionType,
                              btnText: params.btnText || cotDefaut['btnText' + (params.optionType === 2 ? 'J' : 'N')],
                          }
                          switch (params.optionType) {
                              // 2:连接跳转类型
                              case 2:
                                  _params.jumpLiDate = params.jumpLiDate
                                  break;
                                  // 3：跳原生模块
                              case 3:
                                  _params.jumpNaDate = params.jumpNaDate
                                  break;
                              case 4:
                                  _params.showData = params.showData
                                  break;
                              default:
                                  break;
                          }
                          params = _params

                          this.ready(function() {
                              _this.callNativeAPI('sendWeiXinCot', params);
                          });
                      }
                  }
              },

              /**
               * 评论 ***注意只有ios有此功能，
               *  ios老版本也未调通待确认
               * @param params
               */
              goComment: function(params) {
                  var _this = this;
                  this.ready(function() {
                      _this.callNativeAPI('goToComment', null);
                  });
              },

              /** JDPaySDK 唤起支付sdk */
              jdPay: function(params, callback) {
                  var _this = this;
                  console.log(params);

                  /* 设置回调 */
                  var callbackName = utils.getCallbackName();
                  console.log('=========callbackName', callbackName)
                  if (callback) {
                      _this.setCallback(callback, callbackName);
                      if (utils.curvBiggerThen('5.3.0')) {
                          params.callbackid = callbackName
                      }
                  }

                  if (_this.checkParam(params)) {

                      /* 商城 */
                      if (isJdApp) {
                          try {
                              if (isIos) {
                                  /* 根据前置判断 */
                                  window.location.href = 'native://pay?type=' + params.type + '&appId=' + params.appId + '&payParam=' + params.payParam + '&bizParam=' + params.bizParam + '&callback=goToJDAppGetres';
                              } else if (isAndroid && global.JDPaySdk) {
                                  if (global.JDPaySdk.pay) {
                                      /* 根据前置判断 */
                                      console.warn('JDPaySdk', JDPaySdk)
                                          // global.JDPaySdk[(params.type == '2') ? 'front' : 'pay'](params.type, params.appId, params.payParam, params.bizParam, 'goToJDAppGetres');
                                      global.JDPaySdk.pay(params.type, params.appId, params.payParam, params.bizParam, 'goToJDAppGetres');
                                  }
                              }
                          } catch (e) {}
                      }

                      /* 金融 */
                      if (isJdJrApp) {
                          _this.ready(function() {
                              _this.callNativeAPI('JDPaySDK', params);
                          });
                      }
                  }
              },

              /** sendRecord 积木相关通信 */
              callJiMu: function(params, callback) {
                  var _this = this;

                  /* 设置回调 */
                  var callbackName = utils.getCallbackName();
                  if (callback) {
                      _this.setCallback(callback, callbackName);
                      if (utils.curvBiggerThen('5.3.0')) {
                          params.callbackid = callbackName
                      }
                  }

                  if (_this.checkParam(params)) {
                      _this.ready(function() {
                          _this.callNativeAPI('sendRecord', params, callbackName);
                      });
                  }
              },

              // 浏览记录
              callNativeReport: function(params, callback) {
                  var _this = this;
                  var option = {};

                  // 方法入参差异化处理
                  if (isAndroid) {
                      /* 根据需求重构，删除jumpUrl、jumpType */
                      option = {
                          type: params.type,
                          stat: {
                              businessType: params.stat.businessType,
                              tinyType: params.stat.tinyType,
                              productId: params.stat.productId,
                              productName: params.stat.productName,
                          }
                      }
                  } else {
                      option = params
                  }

                  // 设置回调
                  var callbackName = utils.getCallbackName()
                  if (callback) {
                      _this.setCallback(callback, callbackName)
                      if (utils.curvBiggerThen('5.3.0')) {
                          option.callbackid = callbackName
                      }
                  }

                  if (option != '' && typeof option == 'object') {
                      _this.ready(function() {
                          _this.callNativeAPI('JDJRWebStat', option);
                      });
                  }
              },

              /** closeXview 关闭Xview */
              closeXView: function(params) {
                  var _this = this;
                  if (_this.checkParam(params)) {
                      this.ready(function() {
                          _this.callNativeAPI('closeXview', params);
                      })
                  }
              },

              /** pageStatusCallBack Xview页面加载成功、失败等状态回调 */
              openXViewStatus: function(params) {
                  var _this = this;

                  if (_this.checkParam(params)) {
                      this.ready(function() {
                          _this.callNativeAPI('pageStatusCallBack', params);
                      })
                  }
              },

              /** showSecurityKeyboard 安全键盘交互协议 */
              callSafeKeyboard: function(params, callback) {
                  var _this = this;
                  var callbackName = utils.getCallbackName() // 设置回调函数名

                  if (callback) {
                      if (!window.callbackHub) {
                          window.callbackHub = []
                      }
                      (params && !params.keyboardStatus) ? window.callbackHub = [callback]: window.callbackHub[1] = callback;
                      
                      _this.setCallback(callback, callbackName, (params && params.digitalKeyboardType || ''));
                      if (utils.curvBiggerThen('5.3.0')) {
                          params.callbackid = callbackName
                      }
                  }

                  if (params && Type.isObject(params)) {
                      _this.ready(function() {
                          _this.callNativeAPI('showSecurityKeyboard', params, callbackName);
                      })
                  }
              },

              /**
               * 获取设备信息
               * @param params
               * 注意：获取定位信息时候容易发生超时问题，所以 isLocation 设置为 false，如非要获取定位信息，才可以使用true。得true时采用原生通信方法。
               */
              getDeviceInfo: function(func) {
                  var _this = this;
                  if (func && Type.isFunction(func)) {
                      _this.callNative({
                          type: '9',
                          isLocation: false,
                      }, func)
                  }
              },
              /** 检测 api 可用性 */
              apiAvailability: function(apiList, func){
                  if (utils.curvBiggerThen('5.3.0')) {
                      var _this = this;
                      if (apiList && Type.isArray(apiList) && func && Type.isFunction(func)) {
                          _this.callNative({
                              "type": '62',
                              "checkApiList": apiList
                          }, func)
                      }
                  } else {
                      if (apiList && Type.isArray(apiList) && func && Type.isFunction(func)) {
                          func({
                              "status": false,
                              "msg": "The current client version cannot detect API availability"
                          }) 
                      }
                  }
              }
          };

          /* public */
          return {
              _version: VERSION,
              init: coreObj.init.bind(coreObj),
              callNative: coreObj.callNative.bind(coreObj),
              getDeviceInfo: coreObj.getDeviceInfo.bind(coreObj),
              openView: coreObj.openView.bind(coreObj),
              openScheme: coreObj.openScheme.bind(coreObj),
              closeView: coreObj.closeView.bind(coreObj),
              setTopBar: coreObj.setTopBar.bind(coreObj),
              setTopBarShare: coreObj.setTopBarShare.bind(coreObj),
              setShareConfig: coreObj.setShareConfig.bind(coreObj),
              setMenuPanel: coreObj.setMenuPanel.bind(coreObj),
              goComment: coreObj.goComment.bind(coreObj),
              jdPay: coreObj.jdPay.bind(coreObj),
              callJiMu: coreObj.callJiMu.bind(coreObj),
              callNativeReport: coreObj.callNativeReport.bind(coreObj),
              closeXView: coreObj.closeXView.bind(coreObj),
              openXViewStatus: coreObj.openXViewStatus.bind(coreObj),
              callSafeKeyboard: coreObj.callSafeKeyboard.bind(coreObj),
              apiAvailability: coreObj.apiAvailability.bind(coreObj)
          };

      })();

      //IOS 需要初始一次固调用此方法
      JrBridge.init();

      if (window.JrBridge) {
          return Object.assign({}, window.JrBridge, JrBridge)
      }
      return JrBridge
  }
});