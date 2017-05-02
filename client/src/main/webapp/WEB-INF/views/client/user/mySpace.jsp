<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--引入主页的css样式文件-->
    <link href="static/css/index_style.css" rel="stylesheet">
    <!--引入导航的css样式文件-->
    <link href="static/css/duckr.css" rel="stylesheet">
    <link href="static/css/ionicons.css" rel="stylesheet">
    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

    <!--bootstrap-->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/pikaday.css">
    <!-- <script type="text/javascript" src="js/jquery-2.2.4.min.js"></script> -->
    <script src="static/js/jquery-1.8.3.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
    <!--引入主页的js文件-->
    <script src="static/js/index_js.js"></script>
<title>我的空间</title>

</head>
<style type="text/css">

/*主页的上部分*/
/*导航栏*/
nav{
    height: 250px;
    background-color: #a9dba9;
    background: url("img/background.jpg");
}
/*包含logo和登陆者的头像*/
.dh_div_left{
    float: left;
}
.dh_div_logo{
    padding: 10px;
}
/*登陆者头像*/
.dh_div_dl_tx{
    width: 50px;
    height: 185px;
    margin-top: -100px;
    margin-left: 240px;
}
.xian{
    margin-left: 24px;
    width: 4px;
    height: 124px;
    background-color: #FFCCFF;
}
.dl_tx img{
    width: 50px;
    height: 50px;
    border-radius:25px;
}
/*右边菜单*/
.dh_div_right{
    float: right;
    margin-top: 20px;
}
.dh_div_right ul li{
    display: inline-block;
    list-style: none;
    width: 80px;
}
.dh_div_right li a{
    color: black;
}
.cai_dan{
    width: 66px;
    height:30px;
    border:1px solid black;
    text-align: center;
    display: table-cell;/*让div中的文字纵向居中*/
    vertical-align:middle;/*让div中的文字纵向居中*/
    box-shadow: 5px 5px 5px #0e0e0e;
    background-color: pink;
}
.cai_dan:hover{
    background-color: #F47A7A;
}
.zhu_ce{
    border-right: 2px solid darkgrey;
}
.hd{
    display: none;
    width:90px;
    background-color: pink;
    position: absolute;
    z-index: 8000;
    margin-left: -17px;
    text-align: center;
}
.hd li{
    width: 95px;
    list-style: none;
    margin-left:-39px;
}
/*主页的底部*/
footer{
    height: 140px;
    background-color: #E5E5E5;
}
</style>
<body >
<header>
    <!--通栏导航部分-->
    <nav>
        <div class="dh_div_1">
            <div class="dh_div_left">
                <!--同行Logo-->
                <div class="dh_div_logo">
                    <img src="img/logo.png">
                </div>
            </div>

            <!--右边的菜单-->
            <%--<div class="dh_div_right">
                <ul class="ul_first">
                    <li class="li_cai_dan"><a href="index.do"><div class="cai_dan">首页</div></a></li>
                    <li class="li_cai_dan"><a href="allShares.do"><div class="cai_dan">分享</div></a></li>
                    <li class="li_cai_dan"><a href="welcome.do"><div class="cai_dan">欢迎</div></a></li>
                    <li class="li_cai_dan"><a href="discussPageNew.do"><div class="cai_dan">职业讨论</div></a></li>
                    <li class="li_cai_dan"><a href="allyueban.do"><div class="cai_dan">约伴</div></a></li>
                    <!-- <li style="width: 30px;"><a  data-toggle="modal" data-target=".login">登陆</a></li>
                    <li style="width: 30px;" class="zhu_ce"><a data-toggle="modal" data-target=".sign">注册</a></li> -->
                    <li style="width: 90px;"><a>发起活动</a>
                        <ul class="hd">
                            <li><a>活动约伴</a></li>
                            <li><a>行业交流</a></li>
                        </ul>
                    </li>
                </ul>
            </div>--%>
            <div class="dh_div_right">
                <ul class="ul_first">
                    <li class="li_cai_dan"><a href="index.do"><div class="cai_dan" style="background-color:#F47A7A;">首页</div></a></li>
                    <li class="li_cai_dan"><a href="allShares.do"><div class="cai_dan">分享</div></a></li>
                    <li class="li_cai_dan"><a href="welcome.do"><div class="cai_dan">欢迎</div></a></li>
                    <li class="li_cai_dan"><a href="discussPageNew.do"><div class="cai_dan">职业讨论</div></a></li>
                    <li class="li_cai_dan"><a href="allyueban.do"><div class="cai_dan">约伴</div></a></li>
                    <%--<li class="li_cai_dan"><a href="#">消息<span class="label label-danger" id="message">22</span></a></li>--%>
                    <li class="dropdown li_cai_dan" style="width: 40px;">
                        <a class="<%--dropdown-toggle count-info--%>" <%--data-toggle="dropdown"--%> href="#">
                            <i class="fa fa-bell"></i> <span class="label label-danger" id="size"
                                                             style="line-height: 12px;padding: 1px 5px;position: absolute;;top: -2px;"></span>
                        </a>
                        <ul class="message">
                            <li class="a">
                                <i class="fa fa-envelope fa-fw"></i><span id="underSize"></span>条未读消息
                            </li>
                            <li class="a">
                                <div id="messageDetail" style="text-align: left">
                                </div>
                            </li>
                            <li class="a" onclick="allMessagePage('与我相关','allMessage.do')">
                                <i class="fa fa-envelope fa-fw"></i>查看更多消息
                            </li>
                        </ul>
                    </li>
                    <li style="width: 90px;"><a>发起活动</a>
                        <ul class="hd">
                            <li><a onclick="addAppPage('发布约伴活动','add-app.html')" >活动约伴</a></li>
                            <li><a onclick="addDiscussPage('发布讨论活动','add-discuss.html')">行业交流</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<div class="personal_main">
    <!--头像年龄等信息-->
    <div class="personal_main_left">
    <form action="uploadHead.action" method="post" enctype="multipart/form-data">
  						<input type="file" id="btn_file" name="file" style="display:none;">
  						<img src="head/${index.userInfo.head}" id="userHead" style="margin-top:-50px;width: 80px;height: 80px;border-radius: 40px;" /><br />
  						<button class="btn btn-success" type="submit">保存</button>
  						</form>
        <span style="margin-left: 23px;margin-top: 6px;font-size: smaller;">${index.userInfo.nickName }</span><br />
        <span style="margin-left: 15px;color: palevioletred;"class="${index.userInfo.sex }"></span>
        <span style="margin-left: 1px;font-size: smaller;">${index.userInfo.age }</span><br />
        <span <%--data-toggle="modal"--%> <%--data-target=".care"--%> style="margin-left: 12px;font-size: smaller;"><a href="fansOrcarer.do?label=我关注的">关注</a></span><span <%--data-toggle="modal" data-target=".fans"--%> style="font-size: smaller;margin-left: 2px;"><a href="fansOrcarer.do?label=关注我的">粉丝</a></span><br />
        <span style="margin-left: 17px;">${index.userInfo.care_count }</span><span style="margin-left: 15px;">${index.userInfo.fans_count }</span>
    </div>
    <div class="personal_main_right">
        <div class="personal_main_right_1">
            <ul>
                <li class="zhu_ye background_gray">主页</li>
                <li class="yue_ban">约伴</li>
                <li class="z_y_j_l">职业交流</li>
                <li class="f_x">分享</li>
            </ul>
        </div>
        <!---->
        <div class="personal_main_right_2">
            <div class="personal_main_right_zy"><!--主页-->
                <div><span class="personal_zi">个人信息</span></div>
                <!--主要内容-->
                <div><!-- 最大的div -->
                	<div class="col-md-12"><!-- 放昵称性别的 -->
                		<div class="col-md-6">
                			<div>昵称</div>
                			<div>
                				<input class="form-control" id="nickName" value="${index.userInfo.nickName }">
                			</div>
                		</div>
                		<div class="col-md-6">
                		<div>性别</div>
                            <input type="hidden" id="user_sex" value="${index.userInfo.sex }">
                		<div>
                		<label class="radio-inline">
						  <input type="radio" name="inlineRadioOptions" class="sex" id="inlineRadio1" value="gender ion-male"> 男
						</label>
						<label class="radio-inline">
						  <input type="radio" name="inlineRadioOptions" class="sex" id="inlineRadio2" value="gender ion-female"> 女
						</label>
                		</div>
                		</div>
                	</div>
                	<div class="col-md-12"><!-- 生日常在地 -->
                		<div class="col-md-6">
                		<div>生日</div>
                	<input id="datepicker" type="text"  class="form-control" value="${index.userInfo.birth }" >
                		</div>
                		<div class="col-md-6">
                		<%--<div>常住地: ${index.userInfo.location }</div>--%>
                <select id="province" class="form-control duckr-select short" data-reactid=".0.1.1.1.1.0.2.1.1">
                <option data-reactid=".0.1.1.1.1.0.2.1.1.0">北京市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.1">天津市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.2">河北</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.3">山西</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.4">内蒙古</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.5">辽宁</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.6">吉林</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.7">黑龙江</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.8">上海市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.9">江苏</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.a">浙江</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.b">安徽</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.c">福建</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.d">江西</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.e">山东</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.f">河南</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.g">湖北</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.h">湖南</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.i">广东</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.j">广西</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.k">海南</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.l">重庆市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.m">四川</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.n">贵州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.o">云南</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.p">西藏</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.q">陕西</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.r">甘肃</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.s">青海</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.t">宁夏</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.u">新疆</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.v">台湾</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.w">香港</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.1.x">澳门</option>
                </select>
                
              <!--   --北京市", -->
              <!-- ,["东城区","西城区","崇文区","宣武区","朝阳区","丰台区","石景山区","海淀区","门头沟区","房山区","通州区","顺义区",
              "昌平区","大兴区","怀柔区","平谷区","密云县","延庆县","延庆镇"]); -->
              <select class="citys" class="form-control duckr-select" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option data-reactid=".0.1.1.1.1.0.2.1.2.0">东城区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">西城区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">崇文区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">宣武区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">朝阳区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">丰台区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">石景山区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">海淀区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">门头沟区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">房山区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">通州区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.b">顺义区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">昌平区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">大兴区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">怀柔区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">平谷区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">密云县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">延庆县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">延庆镇</option>
                </select>
               <!--  "天津市", -->
               <!-- "和平区","河东区","河西区","南开区","河北区","红桥区","塘沽区","汉沽区","大港区","东丽区","西青区","津南区"
               ,"北辰区","武清区","宝坻区","蓟县","宁河县","芦台镇","静海县","静海镇"]); -->
                <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">和平区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">河东区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">河西区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">南开区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">河北区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">红桥区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">塘沽区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">汉沽区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">大港区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">东丽区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">西青区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.b">津南区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">北辰区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">武清区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">宝坻区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">蓟县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">宁河县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">芦台镇</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">静海县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">静海镇</option>
                </select>
                <!-- "河北省", -->
               <!-- 
			["石家庄市","张家口市","承德市","秦皇岛市","唐山市","廊坊市","保定市","衡水市","沧州市","邢台市","邯郸市"] -->
               <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">石家庄市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">张家口市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">承德市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">秦皇岛市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">唐山市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">廊坊市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">保定市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">衡水市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">沧州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">邢台</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">邯郸市</option>
                </select>
               <!--  "山西省", -->
               <!-- "太原市","朔州市","大同市","阳泉市","长治市","晋城市","忻州市","晋中市","临汾市","吕梁市","运城市"]); -->
             <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">太原市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">朔州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">大同市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">阳泉市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">长治市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">晋城市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">忻州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">晋中市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">临汾市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">吕梁市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">运城市</option>
                </select>
              <!--   "内蒙古", -->
              <!-- "呼和浩特市","包头市","乌海市","赤峰市","通辽市","呼伦贝尔市","鄂尔多斯市","乌兰察布市","巴彦淖尔市","兴安盟",
    "锡林郭勒盟","阿拉善盟"] -->
               <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">呼和浩特市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">包头市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">乌海市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">赤峰市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">通辽市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">呼伦贝尔市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">鄂尔多斯市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">乌兰察布市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">巴彦淖尔市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">兴安盟</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">锡林郭勒盟</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.b">阿拉善盟</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c"></option>
                </select>
                <!-- "辽宁省", -->
                <!-- "沈阳市","朝阳市","阜新市","铁岭市","抚顺市","本溪市","辽阳市","鞍山市","丹东市",
                "大连市","营口市","盘锦市","锦州市",
    "葫芦岛市"]); -->
    <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">沈阳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">朝阳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">阜新市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">铁岭市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">抚顺市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">本溪市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">辽阳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">鞍山市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">丹东市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">大连市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">营口市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.b">盘锦市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">锦州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">葫芦岛市</option>
                </select>
                <!-- "吉林省", -->
                <!-- 长春市","白城市","松原市","吉林市","四平市","辽源市","通化市","白山市","延边州"]); -->
             <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">长春市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">白城市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">松原市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">吉林市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">四平市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">辽源市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">通化市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">白山市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">延边州</option>
                </select>
              <!--   "黑龙江省", -->
              <!--"哈尔滨市","齐齐哈尔市","七台河市","黑河市","大庆市","鹤岗市","伊春市","佳木斯市","双鸭山市","鸡西市","牡丹江市",
    "绥化市","大兴安岭地区"]);  -->
    <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">哈尔滨市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">齐齐哈尔市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">七台河市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">黑河市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">大庆市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">鹤岗市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">伊春市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">佳木斯市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">双鸭山市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">鸡西市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">牡丹江市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.b">绥化市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">大兴安岭地区</option>
                </select>
              <!--   "上海市", -->
              <!-- ["黄浦区","卢湾区","徐汇区","长宁区","静安区","普陀区","闸北区","虹口区","杨浦区","闵行区","宝山区","嘉定区","浦东新区",
    "金山区","松江区","青浦区","南汇区","奉贤区","崇明县","城桥镇"]); -->
    <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">黄浦区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">卢湾区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">徐汇区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">长宁区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">静安区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">普陀区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">闸北区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">虹口区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">杨浦区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">闵行区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">宝山区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.b">嘉定区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">浦东新区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">金山区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">松江区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">青浦区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">南汇区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">奉贤区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">崇明县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">南汇区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">城桥镇</option>
                </select>
              <!--   "江苏省", -->

              <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">南京市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">无锡市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">徐州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">常州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">苏州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">南通市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">连云港市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">淮安市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">盐城市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">扬州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">镇江市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.b">泰州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">宿迁市</option>
                </select>
              <!--   "浙江省", -->
              <!--  杭州市","湖州市","嘉兴市","舟山市","宁波市","绍兴市","衢州市","金华市","台州市","温州市","丽水市"]);-->
            <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">杭州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">湖州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">嘉兴市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">舟山市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">宁波市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">绍兴市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">衢州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">金华市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">台州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">温州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">丽水市</option>
                </select>
              <!--   "安徽省", -->
              <!-- "合肥市","宿州市","淮北市","亳州市","阜阳市","蚌埠市","淮南市","滁州市","马鞍山市","芜湖市","铜陵市","安庆市",
    "黄山市","六安市","巢湖市","池州市","宣城市"]); -->
              <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">合肥市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">宿州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">淮北市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">亳州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">阜阳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">蚌埠市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">淮南市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">滁州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">马鞍山市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">芜湖市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">铜陵市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.b">安庆市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">黄山市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">六安市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">巢湖市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">池州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">宣城市</option>
                </select>
               <!--  "福建省", -->
               <!--福州市","南平市","莆田市","三明市","泉州市","厦门市","漳州市","龙岩市","宁德市"]);  -->
               <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">福州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">南平市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">莆田市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">三明市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">泉州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">厦门市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">漳州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">龙岩市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">宁德市</option>
                </select>
               <!--  "江西省", -->
               <!-- 南昌市","九江市","景德镇市","鹰潭市","新余市","萍乡市","赣州市","上饶市","抚州市","宜春市","吉安市"]) -->
              <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">南昌市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">九江市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">景德镇市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">鹰潭市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">新余市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">萍乡市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">赣州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">上饶市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">抚州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">宜春市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">吉安市</option>
                </select>
               <!--  "山东省", -->
               <!--济南市","青岛市","聊城市","德州市","东营市","淄博市","潍坊市","烟台市","威海市","日照市","临沂市","枣庄市",
    "济宁市","泰安市","莱芜市","滨州市","菏泽市"  -->
               <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">济南市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">青岛市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">聊城市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">德州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">东营市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">淄博市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">潍坊市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">烟台市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">威海市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">日照市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.b">临沂市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">枣庄市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">济宁市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">泰安市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">莱芜市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">滨州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">菏泽市</option>
                </select>
               <!--  "河南省", -->
               <!--郑州市","开封市","三门峡市","洛阳市","焦作市","新乡市","鹤壁市","安阳市","濮阳市","商丘市","许昌市","漯河市",
    "平顶山市","南阳市","信阳市","周口市","驻马店市","济源市"] -->
              <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">郑州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">开封市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">三门峡市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">洛阳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">焦作市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">新乡市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">鹤壁市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">安阳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">濮阳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">商丘市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">许昌市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.b">漯河市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">平顶山市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">南阳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">信阳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">周口市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">驻马店市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">济源市</option>
                </select>
               <!--  "湖北省", -->
               <!-- "武汉市","十堰市","襄樊市","荆门市","孝感市","黄冈市","鄂州市","黄石市","咸宁市","荆州市","宜昌市","随州市",
    "省直辖县级行政单位","恩施州"]) -->
    <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">武汉市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">十堰市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">襄樊市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">荆门市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">孝感市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">黄冈市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">鄂州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">黄石市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">咸宁市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">荆州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">宜昌市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.b">随州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">省直辖县级行政单位</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">恩施州</option>
                </select>
             <!--    "湖南省", -->
             <!-- 长沙市","张家界市","常德市","益阳市","岳阳市","株洲市","湘潭市","衡阳市","郴州市","永州市","邵阳市","怀化市",
    "娄底市","湘西州" -->
    <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">长沙市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">张家界市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">常德市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">益阳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">岳阳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">株洲市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">湘潭市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">衡阳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">郴州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">永州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">邵阳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.b">怀化市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">娄底市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">湘西州</option>
                </select>
              <!--   "广东省", -->
              <!-- 广州市","深圳市","清远市","韶关市","河源市","梅州市","潮州市","汕头市","揭阳市","汕尾市","惠州市","东莞市",
    "珠海市","中山市","江门市","佛山市","肇庆市","云浮市","阳江市","茂名市","湛江市"]); -->
              <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">广州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">深圳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">清远市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">韶关市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">河源市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">梅州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">潮州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">汕头市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">揭阳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">汕尾市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">惠州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.b">东莞市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">珠海市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">中山市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">江门市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">佛山市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">肇庆市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">云浮市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">阳江市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">茂名市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">湛江市</option>
                </select>
               <!--  "广西", -->
               <!-- 南宁市","桂林市","柳州市","梧州市","贵港市","玉林市","钦州市","北海市","防城港市","崇左市","百色市","河池市",
    "来宾市","贺州市 -->
    <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">南宁市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">桂林市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">柳州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">梧州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">贵港市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">玉林市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">钦州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">北海市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">防城港市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">崇左市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">百色市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.b">河池市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">来宾市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">贺州市</option>
                </select>
                <!-- "海南省", -->
              <!-- 海口市","三亚市","省直辖行政单位"]); -->
              <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">海口市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">三亚市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">省直辖行政单位</option>
                </select>
              
    <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">渝中区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">大渡口区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">江北区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">沙坪坝区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">九龙坡区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">南岸区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">北碚区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">万盛区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">双桥区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">渝北区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">巴南区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.b">万州区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">涪陵区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">黔江区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">长寿区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">合川市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">永川区市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">江津市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">南川市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">綦江县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">潼南县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">铜梁县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">大足县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">荣昌县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">璧山县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">垫江县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">武隆县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">丰都县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">城口县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">梁平县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">开县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">巫溪县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">巫山县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">奉节县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">云阳县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">忠县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">石柱土家族自治县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">彭水苗族土家族自治县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">酉阳土家族苗族自治县</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">秀山土家族苗族自治县</option>
                </select>
              <!--   "四川省", -->
              <!-- 成都市","广元市","绵阳市","德阳市","南充市","广安市","遂宁市","内江市","乐山市","自贡市","泸州市","宜宾市",
    "攀枝花市","巴中市","达州市","资阳市","眉山市","雅安市","阿坝州","甘孜州","凉山州"]); -->
    <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">成都市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">广元市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">绵阳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">德阳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">南充市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">广安市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">遂宁市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">内江市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">乐山</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">自贡市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">泸州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.b">宜宾市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">攀枝花市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">巴中市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">达州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">资阳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">眉山市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">雅安市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">阿坝州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">甘孜州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">凉山州</option>
                </select>
                <!-- "贵州省", -->
                <!-- ["贵阳市","六盘水市","遵义市","安顺市","毕节地区","铜仁地区","黔东南州","黔南州","黔西南州"]); -->
              <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" class="shi" data-reactid=".0.1.1.1.1.0.2.1.2.0">贵阳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">六盘水市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">遵义市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">安顺市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">毕节地区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">铜仁地区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">黔东南州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">黔南州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">黔西南州</option>
                </select>
              <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">昆明市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">曲靖市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">玉溪市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">保山市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">昭通市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">丽江市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">思茅市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">临沧市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">德宏州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">怒江州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">迪庆州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.b">大理州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">楚雄州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">红河州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">文山州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">西双版纳州</option>
                </select>
              <!--   "西藏", -->
              <!-- 
dsy.add("0_25",["拉萨市","那曲地区","昌都地区","林芝地区","山南地区","日喀则地区","阿里地区"]); -->
<select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">拉萨市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">那曲地区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">昌都地区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">林芝地区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">山南地区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">日喀则地区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">阿里地区</option>
                </select>
               <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">西安市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">延安市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">铜川市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">渭南市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">咸阳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">宝鸡市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">汉中市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">榆林市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">安康市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">商洛市</option>
                </select>
    <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">兰州市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">嘉峪关市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">白银市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">天水市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">武威市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">酒泉市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">张掖市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">庆阳市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">平凉市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">定西市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">陇南市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.b">临夏州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">甘南州</option>
                </select>
               <!--  "青海省", -->
               <!--西宁市","海东地区","海北州","海南州","黄南州","果洛州","玉树州","海西州"]);  -->
             <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">西宁市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">海东地区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">海北州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">海南州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">黄南州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">果洛州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">玉树州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">海西州</option>
                </select>
             <!--    "宁夏", -->
             <!--  ["银川市","石嘴山市","吴忠市","固原市","中卫市"]);-->
             <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option data-reactid=".0.1.1.1.1.0.2.1.2.0">银川市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">石嘴山市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">吴忠市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">固原市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">中卫市</option>
                </select>
               <!--  "新疆", -->
<select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option data-reactid=".0.1.1.1.1.0.2.1.2.0">乌鲁木齐市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.1">克拉玛依市</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">自治区直辖县级行政单位</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">喀什地区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">阿克苏地区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">和田地区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">吐鲁番地区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">哈密地区</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">克孜勒苏柯州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">博尔塔拉州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">昌吉州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.b">巴音郭楞州</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">伊犁州</option>
                 <option data-reactid=".0.1.1.1.1.0.2.1.2.c">塔城地区</option>
                  <option data-reactid=".0.1.1.1.1.0.2.1.2.c">阿勒泰地区</option>
                </select>
               <!-- "台湾省" -->
               <!-- 
dsy.add("0_33",["台北","高雄","台中","花莲","基隆","嘉义","金门","连江","苗栗","南投","澎湖","屏东","台东","台南","桃园",
    "新竹","宜兰","云林","彰化"]); -->
    <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option>台北</option>
                <option>高雄</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.2">台中</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.3">花莲</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.4">基隆</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.5">嘉义</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.6">金门</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.7">连江</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.8">苗栗</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.9">南投</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.a">澎湖</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.b">屏东</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">台东</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">台南</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">桃园</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">新竹</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">宜兰</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">云林</option>
                <option data-reactid=".0.1.1.1.1.0.2.1.2.c">彰化</option>
                </select>
              <!--   "香港", -->
              <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">香港特别行政区</option>
                
                </select>
               <!--  "澳门", -->
               <!--["澳门特别行政区"]);s  -->
                <select class="citys" class="form-control" style="margin-left:4%;" data-reactid=".0.1.1.1.1.0.2.1.2">
                <option selected="" data-reactid=".0.1.1.1.1.0.2.1.2.0">澳门特别行政区</option>
                </select>
                		</div>
                	</div>
                	<div class="col-md-6"><!-- 职业 -->
                	<div>职业: ${userInfo.job }</div>
			                <select id="job-select" class="form-control duckr-select" data-reactid=".0.1.1.1.1.0.3.0.1" value="">
                                <option value="-1">请选择</option>
                                <c:forEach var="industry" items="${industries}">
                                    <option data-reactid=".0.1.1.1.1.0.3.0.1.0">${industry.industry_name}</option>
                                </c:forEach>
			               <%-- <option data-reactid=".0.1.1.1.1.0.3.0.1.0">计算机/互联网/通讯</option>
			                <option data-reactid=".0.1.1.1.1.0.3.0.1.1">商业/服务业/个体经营</option>
			                <option data-reactid=".0.1.1.1.1.0.3.0.1.2">金融/银行/投资/保险</option>
			                <option data-reactid=".0.1.1.1.1.0.3.0.1.3">文化/广告/传媒</option>
			                <option data-reactid=".0.1.1.1.1.0.3.0.1.4">娱乐/艺术/表演</option>
			                <option data-reactid=".0.1.1.1.1.0.3.0.1.5">医疗/护理/制药</option>
			                <option data-reactid=".0.1.1.1.1.0.3.0.1.6">律师/法务</option>
			                <option data-reactid=".0.1.1.1.1.0.3.0.1.7">教育/培训</option>
			                <option data-reactid=".0.1.1.1.1.0.3.0.1.8">公务员/事业单位</option>
			                <option data-reactid=".0.1.1.1.1.0.3.0.1.9">学生</option>--%>
			                </select>
                	</div>
                	<div class="col-md-6">
                	<div>兴趣</div>
                	<div>
                	<input class="form-control" id="hobby" value="${index.userInfo.hobby }">
                	<input type="hidden" value="${index.userInfo.location }" class="sheng">
                	</div>
                	</div>
                	<div class="col-md-12"><!-- 个性签名 -->
                	<div>签名</div>
                	<textarea class="form-control" rows="3" id="signature">${index.userInfo.signature }</textarea>
                	</div>
                	<div class="col-md-12" style="text-align:center;margin-top:30px;">
                	  <button class="btn btn-success" id="save">保存</button>
                	</div>
                </div>
                </div>
            <div class="personal_main_right_yb"><!--约伴-->
                <div><span class="personal_zi">我发起的</span></div>
                <c:if test="${index.appResult.appSize == 0}">
            		<div style="margin-left:300px;margin-top:150px;"><p style="font-size:30px;color:green;">空空如也!</p></div>
		    		</c:if> 
            <c:forEach var="app" items="${index.appResult.app}">
                <!--主要内容-->
                    <div class="huo_dong_zuo">
		               <img src="img/huiyi.png" ><br />
		               <p style="font-size:20px;color:white;margin-left:25px;">回忆...</p>
	               	</div>
                    <div class="huo_dong_you" style="background-color:#F4F3F1;">
                    	<!-- 头像 昵称 -->
                    	<div style="width:100%;float:left;">
                    		<img src="head/${index.userInfo.head }" style="width:40px;height:40px; border-radius: 20px;margin-left:15px;margin-top:15px;float:left;">
                    		<div style="float:left;width:40px;height:40px;margin-top:20px;margin-left:15px;color:#EAD146;">${index.userInfo.nickName }</div>
                    	</div>
                    	<!-- 持续时间 开始时间 -->
                    	<div style="width:100%;float:left;margin-top:17px;margin-left:20px;">
                    	<span style="border-right:2px solid #4f4f4f;">${app.appointment.duration }</span><span>${app.appointment.begin_time }</span>
                    	</div>
                    	<!-- 主题 -->
                    	<div style="width:100%;float:left;margin-top:8px;border-bottom:1px solid lightgray;">
                    	<a href="myYuebanDetail.do?id=${app.appointment.id }"><span style="font-size:18px;color:gray;margin-top:27px;margin-left:27px;">${app.appointment.theme }</span></a>
                    	</div>
                    	<!-- 有几人加入 -->
                    	<div style="width:100%;float:left;margin-top:8px;">
                    	<span style="margin-left:20px;margin-top:20px;">有${app.want_join_count}人申请加入</span>
                    	</div>
                    </div>
                     </c:forEach>
            </div>
           
            <div class="personal_main_right_jl"><!--职业交流-->
                <div class="personal_main_right_jl_anser" >
                    <div><span class="personal_zi">回答的问题</span></div>
                    <c:if test="${index.discussAnswerResult.disAnswerSize == 0}">
            		<div style="margin-left:300px;margin-top:150px;"><p style="font-size:30px;color:green;">空空如也!</p></div>
		    		</c:if> 
                    <!--主要内容-->
                     <c:forEach var="join" items="${index.discussAnswerResult.discussAnswer}">
                    <div class="content">
                        <div class="jl_zuo">
                            <span style="margin-left: 20px;">${join.answer.agree_times }</span><br />
                            <span style="margin-left: 15px;">赞同</span>
                        </div>
                        <div class="jl_you">
                            <a href="talksDetails.do?id=${join.discuss.id }"><span>问题：${join.discuss.discuss_title }</span><br /></a>
                            <span>回答：${join.answer.answer_content }</span>
                        </div>
                    </div>
                     </c:forEach> 
                </div>
                <div class="personal_main_right_jl_question">
                    <div><span class="personal_zi">提出的问题</span></div>
                    <c:if test="${index.discussMeResult.discussMeSize == 0}">
            		<div style="margin-left:300px;margin-top:150px;"><p style="font-size:30px;color:green;">空空如也!</p></div>
		    		</c:if> 
                    <!--主要内容-->
                    <c:forEach var="fq" items="${index.discussMeResult.discussMe}">
                    <div class="content">
                        <div class="jl_zuo">
                            <span style="margin-left: 20px;">${fq.answer_times }</span><br />
                            <span style="margin-left: 15px;">回答</span>
                        </div>
                        <div class="jl_you">
                            <span>问题：${fq.discuss_title }</span><br />
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
            <div class="personal_main_right_fx"><!--分享-->
            <c:if test="${index.shareResult.shareSize == 0}">
            	<div style="margin-left:300px;margin-top:200px;"><p style="font-size:30px;color:green;">空空如也！快去分享吧！</p></div>
		    	</c:if> 
             <c:forEach var="share" items="${index.shareResult.share}">
                <div class="content">
                    <div class="shi_jian">
                        <span>${share.share_time }</span>
                    </div>
                    <div class="zhao_pian">
                        <img src="${share.share_thumbnail }"  />
                    </div>
                    <div class="content_zi">
                        ${share.share_content }
                    </div>
                </div>
     </c:forEach>
            </div>
        </div>
    </div>
</div>
<script src="js/pikaday.js"></script>
<script type="text/javascript">
var disable = false, picker = new Pikaday({
    field: document.getElementById('datepicker'),
    firstDay: 1,
    minDate: new Date(1900, 0, 1),
    maxDate: new Date(2020, 12, 31),
    yearRange: [1900,2020],

    showDaysInNextAndPreviousMonths: true
});		
</script>
<script type="text/javascript">
    <%--头像上传--%>
$("#userHead").click(function(){
					$("#btn_file").click();
					$("#btn_file").on("change",function(){
						var objUrl = getObjectURL(this.files[0]);
						if(objUrl){
							$("#userHead").attr("src",objUrl);
						}
					});
				});
			 
			function getObjectURL(file){
				var url = null;
				if(window.createObjectURL != undefined){
					url=window.createObjectURL(file);
				}else if(window.URL != undefined){
					url=window.URL.createObjectURL(file);
				}else if(window.webkitURL != undefined){
					url=window.webkitURL.createObjectURL(file);
				}
				return url;
			}
//
 var currentShowCity=0; 
 var shi = "";
 var sheng = $(".sheng").val();
$("#province").change(function(){
	   $("#province option").each(function(i,o){
		   if($(this).attr("selected"))
		   {
			   $(".citys").hide();//所有的城市隐藏
			   $(".citys").eq(i).show();//与省对应的城市显示
			   //再加一个循环
			   var obj = $(".citys").eq(i);
			   /*  shi = $(".citys").eq(i).val();  */
			     for(var i=0;i<obj.length;i++){
				   $(".citys option").addClass("shi");
			   }
			     $(".shi").click(function(){
					   shi = $(this).text();
				   }); 
			    currentShowCity=i; 
		   }
	   });
});
$("#province").change();
var sex = "";
var obj;   
 obj=document.getElementsByName("inlineRadioOptions"); 
 sex = $('input[name="inlineRadioOptions"]').val();
// 性别此处未处理好
 if(obj!=null){ 
    var i;
     for(i=0;i<obj.length;i++){
         if(obj[i].value == $("#user_sex").val()){
             $(this).prop("selected",selected);
         }
        $(".sex").click(function(){
        	sex=$(this).val();
        });
     }
} 
 $("#province option").click(function(){
	 sheng = $(this).text();
 });
    //修改个人信息
    $("#save").click(function(){
    	    	$.ajax({
    				url:"modifyUser.do",
    				type:"post",
    				data:{
    					nickName:$("#nickName").val(),
    					sheng:sheng,
    					shi:shi,
    					hobby:$("#hobby").val(),
    					signature:$("#signature").val(),
    					job:$("#job-select").val(), 
    					sex:sex,
    					birth:$("#datepicker").val()
    				},
    				dataType:"text",
    				success:function(data){
                        var dataObj=eval("("+data+")");
//                        alert(dataObj.returnMsg);
                        if(dataObj.code == 0){
                            layer.msg("信息修改成功！");
//                            window.location.href="mySpace.do";
                            window.location.reload();
                        }else{
                        }

    				},
    				error:function(){
    					alert("错误");
    				}
    			});
    	    });
 
</script>
<div class="modal fade care" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" >我的关注</h4>
            </div>
            <div class="modal-body">
             <c:forEach var="caredUser" items="${caredUser}"> 
                <img src="head/${caredUser.get(0).head }" style="width:40px;height:40px;border-radius: 20px;">
             </c:forEach>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade fans" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" >我的粉丝</h4>
            </div>
            <div class="modal-body">
             <c:forEach var="fansUser" items="${fansUser}"> 
                <a href="personal.do?account=${fansUser.account }"><img src="head/${fansUser.head }" style="width:40px;height:40px;border-radius: 20px;"></a>
             </c:forEach>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>