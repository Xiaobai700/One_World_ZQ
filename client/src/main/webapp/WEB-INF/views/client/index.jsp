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
    <!--bootstrap-->
    <%--<script type="text/javascript" src="static/js/jquery.min.js"></script>--%>
    <%--<script type="text/javascript" src="static/js/bootstrap.min.js"></script>--%>
    <!--bootstrap-->
    <!-- 重要！不在线引入就会出现各种各样奇葩的问题 -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script type="text/javascript" src="../static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../static/js/bootstrap.min.js"></script>

    <!--引入主页的css样式文件-->
    <link href="../static/css/index_style.css" rel="stylesheet">
    <!--引入导航的css样式文件-->
    <link href="../static/css/dao_hang_style.css" rel="stylesheet">
    <link href="../static/css/ionicons.css" rel="stylesheet">
    <%--H+的相关样式--%>
    <link href="../static/css/font-awesome.min93e3.css" rel="stylesheet">
    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link href="../static/css/toastr.min.css" rel="stylesheet">
    <!--引入主页的js文件-->
    <script src="../static/js/index_js.js"></script>
    <%--layer--%>
    <script type="text/javascript" src="../static/js/layer/2.1/layer.js"></script>

    <script type="text/javascript">
        $(function () {
            /*加入或已经加入的标志只显示一个*/
            var joinOne=$(".joined");
            if(joinOne.length>0){
                $(".joined").next().hide();
            }

            var cared = $(".attent");
            if(cared.length>0){
                $(".attent").next().hide();
            }
        });

    </script>
    <title>主页</title>

</head>
<body style=" background-color: #F4F3F1;">
<div style="background-color: #F4F3F1;">
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
                            <!--头像个人 点击可以进入个人中心的-->
                            <a class="tx_gr" href="mySpace.do?account=${account}"><%--<img src="upload/${userInfo.head}">--%><img src="${userHead}"></a>
                        </div>
                    </div>
                </div>

                <!--右边的菜单-->
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
                        <!-- <li style="width: 30px;"><a  data-toggle="modal" data-target=".login">登陆</a></li>
                        <li style="width: 30px;" class="zhu_ce"><a data-toggle="modal" data-target=".sign">注册</a></li> -->
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
    <div class="main">
        <div class="main_1">
            <div class="jia_ru">
                <span><img src="img/1.jpg" /></span>
                <span class="title_words">热门讨论</span>
                <span><img src="img/2.jpg" /></span>
            </div>
            
            <!--按热度显示的讨论信息-->
            <div class="row" style="background-color: #F4F3F1;">
            <c:forEach var="discuss" items="${index.disResult.dis}">
                <div class="col-md-4" style="margin-top: 50px;">
                    <div style="width: 300px;height: 260px;">
                        <div class="row">
                            <div class="col-lg-12 img-content">
                                <div class="img-circle"></div>
                                <c:forEach var="head" items="${discuss.heads}">
                                <img src="head/${head}" class="img-circle img1" />
                                </c:forEach>
                                <a href="discussDetail.do?id=${discuss.discuss.id }">
                                    <div class="mycircle img-circle">
                                        <p>
                                      ${discuss.discuss.discuss_title }
                                        </p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
           </c:forEach>
            </div>
            <!--你要来加入吗？-->
            <div class="jia_ru" style="margin-top: 10px;">
                <span><img src="img/1.jpg" /></span>
                <span class="title_words">你想加入吗？</span>
                <span><img src="img/2.jpg" /></span>
            </div>
            <!--按热度显示的约伴活动信息-->
            <div class="row">
                <c:forEach var="appointment" items="${index.appResult.app}">
                    <div class="col-md-4">
                        <div class="main_yb_div">
                            <div class="main_yb_div_1">
                                <img src="head/${appointment.orgnizerInfo.head}" class="main_tx"><!--活动发起者头像-->
                                <span><b>${appointment.orgnizerInfo.nickName }</b></span><!--活动发起者昵称-->
                              <c:forEach var="join" items="${joins }">
		    			    <c:choose >
		    			    	<c:when test="${join.appointment_id==appointment.appointment.id}">
		    			    		<span style="float: right;margin-top: 10px;" class="glyphicon glyphicon-ok-circle joined">已申请</span>
		    			    	</c:when>
		    			    </c:choose>
		    			  </c:forEach>
                                <span style="float: right;margin-top: 10px;" class="glyphicon glyphicon-plus-sign joined join" onclick="join_app(${appointment.appointment.id},${appointment.orgnizerInfo.account})">申请加入</span><!--加入活动的小图标-->
                                <input type="hidden" value="${appointment.appointment.id}">
                                <span style="float: right; margin-top: 10px;">${appointment.appointment.publish_time}&nbsp;</span><!--活动发起时间-->
                            </div>
                            <!--约伴活动的其他具体信息-->
                            <a href="appDetails.do?id=${appointment.appointment.id}">
                                <div class="main_yb_div_hd_xq">
                                    <div><!--地点  主题-->
                                        <span class="location">${appointment.appointment.site}</span>
                                        <span class="theme"><strong>${appointment.appointment.theme}</strong></span>
                                    </div>
                                    <div><!--活动持续的时间 开始的时间-->
                                        <span class="stay">${appointment.appointment.duration}</span>
                                        <span class="stay">${appointment.appointment.begin_time}</span>
                                        <span class="m_or_w">${appointment.appointment.sex_restrict}</span>
                                    </div>
                                    <div class="ms"><!--活动的描述-->
                                            ${appointment.appointment.content}
                                    </div>
                                </div>
                                <!--约伴活动的缩略图-->
                                <div class="main_yb_div_slt">
                                    <img src="${appointment.appointment.thumbnail }" class="main_slt">
                                </div>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="jia_ru">
                <span><img src="img/1.jpg" /></span>
                <span class="title_words">同行者</span>
                <span><img src="img/2.jpg" /></span>
            </div>
            <!--按热度显示的用户信息 第一排-->
            <div class="row">
            <c:forEach var="hotOne" items="${index.hot1User.hot1}">
                <div class="col-md-4">
                    <div class="main_yh_div">
                        <div class="row">
                            <div class="col-md-5">
                                <!--头像-->
                                <a href="personal.do?account=${hotOne.account}"><img src="head/${hotOne.head }" class="user_tx"></a>
                            </div>
                            <div class="col-md-7">
                                <!--姓名 性别 年龄-->
                                <div class="y_h">
                                    <span class="yh_name"><strong>${hotOne.nickName }</strong></span>&nbsp;
                                    <span class="${hotOne.sex }" style="color: palevioletred;"></span>
                                    <span style="color: palevioletred">${hotOne.age }</span>
                                    <c:forEach var="care" items="${care }">
		    			    <c:choose >
		    			    	<c:when test="${care.user_account==hotOne.account }">
		    			    		<span style="float: right;margin-top: 10px;color:pink;" class="glyphicon glyphicon-heart attent"></span>
		    			    	</c:when>
		    			    </c:choose>
		    			  </c:forEach>
                                    <span style="float: right;margin-top: 10px;" class="ion-android-favorite-outline attent care" onclick="careUser('${hotOne.account }')"></span>
                                    <input type="hidden" value="${hotOne.account }" />
                                </div>
                                <div class="y_h">
                                    <span class="yh_location">${hotOne.location }</span><br />
                                </div>
                                <div class="y_h">
                                    <span class="yh_name"><strong>${hotOne.signature }</strong></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
</c:forEach>
            </div>
            <%--<!--按热度显示的用户信息 第二排-->--%>
            <%--&nbsp;--%>
            <div class="row">
          		<c:forEach var="hotTwo" items="${index.hot2User.hot2}">
                <div class="col-md-4">
                    <div class="main_yh_div">
                        <div class="row">
                            <div class="col-md-5">
                                <!--头像-->
                                <a href="personal.do?account=${hotTwo.account}"><img src="head/${hotTwo.head }" class="user_tx"></a>
                            </div>
                            <div class="col-md-7">
                                <!--姓名 性别 年龄-->
                                <div class="y_h">
                                    <span class="yh_name"><strong>${hotTwo.nickName }</strong></span>&nbsp;
                                    <span class="${hotTwo.sex }" style="color: palevioletred;"></span>
                                    <span style="color: palevioletred">${hotTwo.age }</span>
                                    <input type="hidden" value="${hotTwo.nickName }" />
                                    <c:forEach var="care" items="${care }">
		    			    <c:choose >
		    			    	<c:when test="${care.user_account==hotTwo.account }">
		    			    		<span style="float: right;margin-top: 10px;color:pink;" class="glyphicon glyphicon-heart attent"></span>
		    			    	</c:when>
		    			    </c:choose>
		    			  </c:forEach>
                                    <span style="float: right;margin-top: 10px;" class="ion-android-favorite-outline attent care" onclick="careUser('${hotTwo.account }')"></span>
                                    <input type="hidden" value="${hotTwo.account }" />
                                </div>
                                <div class="y_h">
                                    <span class="yh_location">${hotTwo.location }</span><br />
                                </div>
                                <div class="y_h">
                                    <span class="yh_name"><strong>${hotTwo.signature }</strong></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
</c:forEach>
            </div>
        </div>

    </div>
</div>
<div id="dv">
    <%--<div class="alert alert-success alert-dismissable">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        H+是一个很棒的后台UI框架 <a class="alert-link" href="notifications.html#">了解更多</a>.
    </div>--%>
</div>
<footer>
    <div>
        <br />
        <p style="text-align: center;">南京工业职业${account}技术学院计算机与软件学院</p>
    </div>
</footer>
</div>
<script type="text/javascript" src="../client/js/addAppAndDiscussFunction.js"></script>
<script src="../static/js/toastr.min.js"></script>
<script src="../static/js/toast.js"></script>
<script type="text/javascript">
    $(function(){var i=-1;var toastCount=0;var $toastlast;var getMessage=function(){var msg="Hi, welcome to Inspinia. This is example of Toastr notification box.";return msg};$("#showsimple").click(function(){toastr.success("Without any options","Simple notification!")});$("#showtoast").click(function(){var shortCutFunction=$("#toastTypeGroup input:radio:checked").val();var msg=$("#message").val();var title=$("#title").val()||"";var $showDuration=$("#showDuration");var $hideDuration=$("#hideDuration");var $timeOut=$("#timeOut");var $extendedTimeOut=$("#extendedTimeOut");var $showEasing=$("#showEasing");var $hideEasing=$("#hideEasing");var $showMethod=$("#showMethod");var $hideMethod=$("#hideMethod");var toastIndex=toastCount++;toastr.options={closeButton:$("#closeButton").prop("checked"),debug:$("#debugInfo").prop("checked"),progressBar:$("#progressBar").prop("checked"),positionClass:$("#positionGroup input:radio:checked").val()||"toast-top-right",onclick:null};if($("#addBehaviorOnToastClick").prop("checked")){toastr.options.onclick=function(){alert("You can perform some custom action after a toast goes away")}}if($showDuration.val().length){toastr.options.showDuration=$showDuration.val()}if($hideDuration.val().length){toastr.options.hideDuration=$hideDuration.val()}if($timeOut.val().length){toastr.options.timeOut=$timeOut.val()}if($extendedTimeOut.val().length){toastr.options.extendedTimeOut=$extendedTimeOut.val()}if($showEasing.val().length){toastr.options.showEasing=$showEasing.val()}if($hideEasing.val().length){toastr.options.hideEasing=$hideEasing.val()}if($showMethod.val().length){toastr.options.showMethod=$showMethod.val()}if($hideMethod.val().length){toastr.options.hideMethod=$hideMethod.val()}if(!msg){msg=getMessage()}$("#toastrOptions").text("Command: toastr["+shortCutFunction+']("'+msg+(title?'", "'+title:"")+'")\n\ntoastr.options = '+JSON.stringify(toastr.options,null,2));var $toast=toastr[shortCutFunction](msg,title);$toastlast=$toast;if($toast.find("#okBtn").length){$toast.delegate("#okBtn","click",function(){alert("you clicked me. i was toast #"+toastIndex+". goodbye!");$toast.remove()})}if($toast.find("#surpriseBtn").length){$toast.delegate("#surpriseBtn","click",function(){alert("Surprise! you clicked me. i was toast #"+toastIndex+". You could perform an action here.")})}});function getLastToast(){return $toastlast}$("#clearlasttoast").click(function(){toastr.clear(getLastToast())});$("#cleartoasts").click(function(){toastr.clear()})});
</script>
<script type="text/javascript">

</script>
</body>
</html>