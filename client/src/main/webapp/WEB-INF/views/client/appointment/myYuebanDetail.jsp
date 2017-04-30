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
    <title>约伴详情</title>
    <script type="text/javascript">
    $(function(){
    	//把从文本编辑器中的图片放到和文本内容不一样的位置，让图片处于文本的下方
    	$(".yue_ban_img").html($(".yue_ban_content img"));
    })
    </script>
</head>
<body>
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
                        <a class="tx_gr" href="mySpace.do"><img src="head/${userInfo.head}"></a>
                    </div>
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
<div class="yb_xq_main">
    <div class="yb_xq_main_1">
        <div class="main_1_1">
            <!--活动开始的时间，活动的主题，-->
            <span class="stay">${appointment.duration }</span>
            <span class="stay">${appointment.begin_time }开始</span>
            <span class="m_or_w">${appointment.sex_restrict }</span>
            <!--<span>2015.12.6</span>&nbsp;&nbsp;<span>读书</span><br />-->
            <!--地点-->
            <span style="font-size: 20px;color: #8c4810;">${appointment.site }</span><br />
            <span><img src="head/${find_userInfo.head }" style="width: 80px;height: 80px;border-radius: 40px;" /></span><br />
            <span style="margin-left: 10px;"><strong>由${find_userInfo.nickName }发起</strong></span><br />
            <span style="margin-left: 13px;color: palevioletred;"class="gender ion-female"></span>
            <span style="margin-left: 1px;">${find_userInfo.age }</span>
        </div>
        <!--活动的内容详细，文字和图片-->
        <div class="main_1_2">
        <div class="yue_ban_content">
            ${appointment.content }
        </div>
            <div class="yue_ban_img">
            </div>
        </div>
        <div class="main_1_3">
            <div class="row">
                <div class="col-md-12">
                    <span>用户等待审核</span>
                </div>
                <div class="can_yu_tx">
                    <ul>
                     <c:forEach var="joiner" items="${join_userInfos}">
                        <li><a><img src="head/${joiner.head }" />
                        <input type="hidden" value="${joiner.account }">
                        <c:forEach var="join" items="${joined }">
		    			    <c:choose >
		    			    	<c:when test="${join.account == joiner.account}">
		    			    		<span style="float: right;margin-top: 10px;" class="glyphicon glyphicon-ok-circle flag">已同意</span>
		    			    	</c:when>
		    			    </c:choose>
		    			  </c:forEach>
                        <span class="glyphicon glyphicon-plus-sign flag agree"></span>
                        <input type="hidden" value="${appointment.id }"></a></li>
                      </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <!--评论相关，显示评论，写评论的文本框-->
        <div class="main_1_4">
            <span><strong>评论</strong></span>
            <div>
                <!--评论框-->
                 <form action="commentYueban.do?target_id=${appointment.id }">
                <div class="input-group">
                	<input type="text" class="form-control" name="comment_content">
                	<input type="hidden" value="${appointment.id }" name="target_id">
                    <span class="input-group-btn">
                    <button class="btn btn-success" type="submit">发表评论</button>
                  	</span>
                </div>
                 </form>
                <div>
                    <ul class="media-list">
                        <!--每个li是一个评论-->
                        <c:forEach var="comment" items="${allList}">
                        <li class="media">
                            <a class="media-left" href="#">
                                <img src="head/${comment.get(1).head }" style="width: 50px;height: 50px;border-radius: 25px;">
                            </a>
                            <div class="media-body">
                                <Strong class="media-heading">${comment.get(1).nickName }</strong>
                                <h5>${comment.get(0).comment_content }</h5>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<footer>
    <div>
        <br />
        <p style="text-align: center;">南京工业职业技术学院计算机与软件学院</p>
    </div>
</footer>
<script type="text/javascript">
var careOne=$(".flag");
if(careOne.length>0){
	$(".flag").next().hide();
}	
$(".agree").click(function(){
	$.ajax({
		url:"/One_World/agreeJoin.do",
		type:"post",
		data:{
			account:$(this).prev().val(),
			id:$(this).next().val()
		},
		dataType:"text",
		success:function(data){
			alert(data);
			window.location.reload();//刷新页面 
		}
	});
	
});













</script>
</body>
</html>