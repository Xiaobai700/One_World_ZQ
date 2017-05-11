<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 重要！不在线引入就会出现各种各样奇葩的问题 -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script type="text/javascript" src="../../static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../../static/js/bootstrap.min.js"></script>
    <!--引入主页的css样式文件-->
    <link href="../../static/css/index_style.css" rel="stylesheet">
    <!--引入导航的css样式文件-->
    <link href="../../static/css/dao_hang_style.css" rel="stylesheet">
    <link href="../../static/css/ionicons.css" rel="stylesheet">
    <%--H+的相关样式--%>
    <link href="../../static/css/font-awesome.min93e3.css" rel="stylesheet">
    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link href="../../static/css/toastr.min.css" rel="stylesheet">
    <link href="../../static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <!--引入主页的js文件-->
    <script src="../../static/js/index_js.js"></script>
    <link href="../../static/css/toastr.min.css" rel="stylesheet">
    <%--layer--%>
    <script type="text/javascript" src="../../static/js/layer/2.1/layer.js"></script>
    <title>所有约伴</title>
</head>
<body>
<input type="hidden" value="${account}" id="account">
<header>
    <!--通栏导航部分-->
    <nav>
        <div class="dh_div_1">
            <div class="dh_div_left">
                <!--同行Logo-->
                <div class="dh_div_logo">
                    <img src="img/logo.png">
                </div>
                <!--登陆者头像-->
                <div class="dh_div_dl_tx">
                    <div class="xian"></div>
                    <div class="dl_tx">
                        <a class="tx_gr" href="mySpace.do"><img src="head/${userHead}"></a>
                    </div>
                </div>
            </div>
            <%--搜索框--%>
            <div class="search">
                <div class="input-group">
                    <input type="text" class="form-control searchText" value="${keys}" id="searchText" style="width:290px;height: 40px;border-radius: 6px;"> <span class="input-group-btn"> <button type="button" onclick="searchForm(2)" class="btn btn-primary">搜索
                                        </button> </span>
                </div>
            </div>
            <!--右边的菜单-->
            <div class="dh_div_right">
                <ul class="ul_first">
                    <li class="li_cai_dan" style="width: 40px;">
                        <a class="myInfo" href="#">
                            <i class="fa fa-bell"></i> <span class="<%--label label-danger--%>" id="size"
                                                             style="font-size: 10px;font-weight: 600;background-color: #ed5565;color: #FFF;line-height: 12px;padding: 1px 5px;position: absolute;/*top: -2px;*/"></span>
                        </a>
                        <div class="upUp" style="position: absolute;">
                            <span class="glyphicon glyphicon-chevron-up"></span>
                        </div>
                        <div class="myMessage">
                            <div class="messageTop" style="line-height: 1.7;">
                                <button class="inform" id="inform" style="">通知消息</button>
                                <button class="inform" id="system" style="width: 50%;float: left;text-align: center;font-size: 17px;">系统消息</button>
                            </div>
                            <div class="messageDetail" id="messageDetail">
                                <div id="systemMessage" style="display: none;">
                                </div>
                                <div id="informMessage">

                                </div>
                            </div>
                            <div class="messageBottom" onclick="allMessagePage('与我相关','allMessage.do')">
                                <i class="fa fa-envelope fa-fw"></i>查看更多消息
                            </div>
                        </div>
                    </li>
                    <li class="li_cai_dan"><a href="index.do"><div class="cai_dan">首页</div></a></li>
                    <li class="li_cai_dan"><a href="allShares.do"><div class="cai_dan">分享</div></a></li>
                    <li class="li_cai_dan"><a href="welcome.do"><div class="cai_dan">欢迎</div></a></li>
                    <li class="li_cai_dan"><a href="discussPageNew.do"><div class="cai_dan">职业讨论</div></a></li>
                    <li class="li_cai_dan"><a href="allyueban.do"><div class="cai_dan" style="background-color:#F47A7A;">约伴</div></a></li>
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
<!--中部主要部分-->
<div class="fx_main">
    <div class="fx_main_0">
        <div class="fx_guang_chang">
            <strong style="font-size: 20px;color: white;">广场</strong>
        </div>
    </div>
    <div class="fx_main_1">
        <div class="fx_left">
            <!--检索标准-->
            <a href="allyueban.do"><span id="an_shijian" class="${color_1 }">按时间</span></a><br />
            <a href="allyuebanLikes.do"><span id="an_redu" class="${color_2 }">按热度</span></a>
        </div>
        <!--  -->
        
        <!--  -->
        <div class="fx_right">
            <c:if test="${index.appSize == 0}">
                <h2><p style="font-family: '微软雅黑';margin-left: 90px;
                margin-top: 60px;">啥也没搜到！看看别的吧！</p></h2>
            </c:if>
         <c:forEach var="app" items="${index.app}">
             <div class="main_yb_div">
                            <div class="main_yb_div_1">
                                <img src="head/${app.orgnizerInfo.head}" class="main_tx"><!--活动发起者头像-->
                                <span><b>${app.orgnizerInfo.nickName }</b></span><!--活动发起者昵称-->
                                <c:if test="${app.isJoin == false}">
                                    <span style="float: right;margin-top: 10px;" class="glyphicon glyphicon-plus-sign" onclick="join_app('${app.appointment.id}',${app.orgnizerInfo.account})"></span><!--加入活动的小图标-->
                                </c:if>
                                <c:if test="${app.isJoin == true}">
                                    <span style="float: right;margin-top: 10px;" class="glyphicon glyphicon-ok-circle">已申请</span>
                                </c:if>
                                <span style="float: right; margin-top: 10px;">2016.11.9&nbsp;</span><!--活动发起时间-->
                            </div>
                            <!--约伴活动的其他具体信息-->
                            <a href="appDetails.do?id=${app.appointment.id}">
                                <div class="main_yb_div_hd_xq">
                                    <div><!--地点  主题-->
                                        <span class="location">${app.appointment.site}</span>
                                        <span class="theme"><strong>${app.appointment.theme}</strong></span>
                                    </div>
                                    <div><!--活动持续的时间 开始的时间-->
                                        <span class="stay">${app.appointment.duration}</span>
                                        <span class="stay">${app.appointment.begin_time}</span>
                                        <span class="m_or_w">${app.appointment.sex_restrict}</span>
                                    </div>
                                    <div class="ms"><!--活动的描述-->
                                        <p>
                                            ${app.appointment.content}
                                        </p>
                                    </div>
                                </div>
                                <!--约伴活动的缩略图-->
                                <div class="main_yb_div_slt">
                                    <img src="${app.appointment.thumbnail}" class="main_slt">
                                </div>
                            </a>
             </div>&nbsp;
            </c:forEach>
        </div>
        <div class="final_right">
            <div class="find_type">
                <label style="margin-bottom: 5px;" class="btn btn-outline btn-primary">选择你喜欢的活动主题</label><br />
                <c:forEach var="appType" items="${index.appTypes}">
                    <c:if test="${appType.id == appTypeId}">
                        <a href="allYuebanType.do?appTypeId=${appType.id}"><button class="btn btn-warning">${appType.typeName}</button></a>
                    </c:if>
                    <c:if test="${appType.id != appTypeId}">
                        <a href="allYuebanType.do?appTypeId=${appType.id}"><button class="btn btn-outline btn-warning">${appType.typeName}</button></a>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<div id="dv"></div>
<footer>
    <div>
        <ul>
            <li>联系作者:1053373312@qq.com</li>
            <li class="feedBack" onclick="feedBackPage('反馈信息','feedBack.html')">反馈</li>
        </ul>
    </div>
</footer>
<script type="text/javascript" src="../../client/js/addAppAndDiscussFunction.js"></script>
<script src="../../static/js/toastr.min.js"></script>
<script src="../../static/js/toast.js"></script>
</body>
</html>