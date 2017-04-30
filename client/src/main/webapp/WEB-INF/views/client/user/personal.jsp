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

    <!--引入主页的css样式文件-->
    <link href="static/css/index_style.css" rel="stylesheet">
    <!--引入导航的css样式文件-->
    <link href="static/css/dao_hang_style.css" rel="stylesheet">
    <link href="static/css/ionicons.css" rel="stylesheet">
    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

    <!--bootstrap-->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script src="static/js/jquery-2.2.4.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>

    <!--引入主页的js文件-->
    <script src="static/js/index_js.js"></script>
    <title>个人中心</title>

</head>
<body style="background-color:#F4F3F1;">
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
            <div class="dh_div_right">
                <ul class="ul_first">
                    <li class="li_cai_dan"><a href="index.do"><div class="cai_dan">首页</div></a></li>
                    <li class="li_cai_dan"><a href="allShares.do"><div class="cai_dan">分享</div></a></li>
                    <li class="li_cai_dan"><a href="welcome.do"><div class="cai_dan">欢迎</div></a></li>
                    <li class="li_cai_dan"><a href="allDiscuss.do"><div class="cai_dan">职业讨论</div></a></li>
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
            </div>
        </div>
    </nav>
</header>

<div class="personal_main">
    <!--头像年龄等信息-->
    <div class="personal_main_left">
  		<img src="head/${userInfo.head }" style="width: 80px;height: 80px;border-radius: 40px;" /><br />
        <span style="margin-left: 23px;margin-top: 6px;font-size: smaller;">${userInfo.nickName }</span><br />
        <span style="margin-left: 15px;color: palevioletred;"class="${userInfo.sex }"></span>
        <span style="margin-left: 1px;font-size: smaller;">${userInfo.age }</span><br />
        <span style="margin-left: 12px;font-size: smaller;">关注</span><span style="font-size: smaller;margin-left: 2px;">粉丝</span><br />
        <span style="margin-left: 17px;">${userInfo.care_count }</span><span style="margin-left: 15px;">${userInfo.fans_count }</span>
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
                <div class="row">
                    <div style="background-image: url('img/icon_dot.png');height: 8px;width: 100%;"></div>
                    <div class="col-md-4">
                        <div style="background-image: url('img/icon_dot.png');width: 8px;"></div>
                        <div class="shang">职业</div>
                        <div class="zhong">${userInfo.job }</div>
                    </div>
                    <div class="col-md-4">
                        <div style="
                        background-image: url('img/icon_dot.png');
                        position: absolute; z-index: 50;
                        width: 8px;
                        height: 85px;">
                        </div>
                        <div class="shang">常住地</div>
                        <div class="zhong">${userInfo.location }</div>
                    </div>
                    <div class="col-md-4">
                        <div style="
                        background-image: url('img/icon_dot.png');
                        position: absolute; z-index: 50;
                        width: 8px;
                        height: 85px;">
                        </div>
                        <div class="shang">兴趣爱好</div>
                        <div class="zhong">${userInfo.hobby }</div>
                    </div>
                </div>
                <div class="row">
                    <div style="background-image: url('img/icon_dot.png');height: 8px;width: 100%;"></div>
                    <div class="col-md-6">
                        <div class="shang">个性签名</div>
                        <div class="zhong">${userInfo.signature }</div>
                    </div>
                    <div class="col-md-6">
                        <div style="
                        background-image: url('img/icon_dot.png');
                        position: absolute; z-index: 50;
                        width: 8px;
                        height: 85px;">
                        </div>
                        <div class="shang">注册时间</div>
                        <div class="zhong">${userInfo.regist_time }</div>
                    </div>
                </div>
            </div>
            <div class="personal_main_right_yb"><!--约伴-->
                <div><span class="personal_zi">他发起的</span></div>
                <c:if test="${app_size == 0}">
            		<div style="margin-left:300px;margin-top:150px;"><p style="font-size:30px;color:green;">空空如也!</p></div>
		    		</c:if> 
                <!--主要内容-->
             <c:forEach var="app" items="${app_AllList}"> 
                <!--主要内容-->
                    <div class="huo_dong_zuo">
		               <img src="img/huiyi.png" ><br />
		               <p style="font-size:20px;color:white;margin-left:25px;">回忆...</p>
	               	</div>
	               	<a href="findDetail.do?id=${app.get(0).id }">
	               	<div class="huo_dong_you">
                    	<!-- 头像 昵称 -->
                    	<div style="width:100%;float:left;">
                    		<img src="head/${app.get(1).head }" style="width:40px;height:40px; border-radius: 20px;margin-left:15px;margin-top:15px;float:left;">
                    		<div style="float:left;width:60px;height:40px;margin-top:20px;margin-left:15px;color:#EAD146;">${app.get(1).nickName }</div>
                    	</div>
                    	<!-- 持续时间 开始时间 -->
                    	<div style="width:100%;float:left;margin-top:17px;margin-left:20px;">
                    	<span style="border-right:2px solid #4f4f4f;">${app.get(0).duration }</span><span>${app.get(0).begin_time }</span>
                    	</div>
                    	<!-- 主题 -->
                    	<div style="width:100%;float:left;margin-top:8px;border-bottom:1px solid lightgray;">
                    	<span style="font-size:18px;color:gray;margin-top:27px;margin-left:27px;">${app.get(0).theme }</span>
                    	</div>
                    	<!-- 有几人申请加入 -->
                    	<div style="width:100%;float:left;margin-top:8px;">
                    	<span style="margin-left:20px;margin-top:20px;">有${app.get(2) }人申请加入</span>
                    	<span style="margin-left:20px;margin-top:20px;">有${app.get(3) }人成功加入</span>
                    	</div>
                    </div>
	               	</a>
                     </c:forEach>
        </div>
            <div class="personal_main_right_jl"><!--职业交流-->
                <div class="personal_main_right_jl_anser" >
                    <div><span class="personal_zi">回答的问题</span></div>
                    <c:if test="${answer_size == 0}">
            		<div style="margin-left:300px;margin-top:150px;"><p style="font-size:30px;color:green;">空空如也!</p></div>
		    		</c:if> 
                    <!--主要内容-->
                     <c:forEach var="join" items="${join}"> 
                    <div class="content">
                        <div class="jl_zuo">
                            <span style="margin-left: 20px;">${join.get(0).agree_times }</span><br />
                            <span style="margin-left: 15px;">赞同</span>
                        </div>
                        <div class="jl_you">
                            <a href="talksDetails.do?id=${join.get(1).id }"><span>问题：${join.get(1).discuss_title }</span></a><br />
                            <span>回答：${join.get(0).answer_content }</span>
                        </div>
                    </div>
                     </c:forEach> 
                </div>
               
                <div class="personal_main_right_jl_question">
                    <div><span class="personal_zi">提出的问题</span></div>
                    <c:if test="${discusses_size == 0}">
            		<div style="margin-left:300px;margin-top:150px;"><p style="font-size:30px;color:green;">空空如也!</p></div>
		    		</c:if> 
                    <!--主要内容-->
                    <c:forEach var="fq" items="${fq}"> 
                    <div class="content">
                        <div class="jl_zuo">
                            <span style="margin-left: 20px;">${fq.get(1).answer_times }</span><br />
                            <span style="margin-left: 15px;">回答</span>
                        </div>
                        <div class="jl_you">
                            <a href="talksDetails.do?id=${fq.get(1).id }"><span>问题：${fq.get(1).discuss_title }</span></a><br />
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
            <div class="personal_main_right_fx"><!--分享-->
            <c:if test="${share_size == 0}">
            	<div style="margin-left:300px;margin-top:200px;"><p style="font-size:30px;color:green;">空空如也！</p></div>
		    	</c:if> 
             <c:forEach var="share" items="${self_share}"> 
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

</body>
</html>