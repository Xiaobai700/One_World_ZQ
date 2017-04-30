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
	<!-- 钟 -->
    <script type="text/javascript" src="static/js/bootstrap-clockpicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="static/css/bootstrap-clockpicker.min.css">
	<!-- 日期 -->
    <link rel="stylesheet" href="static/css/pikaday.css">
    <!--引入主页的js文件-->
    <script src="static/js/index_js.js"></script>
	<script type="text/javascript">
	 $(function(){
		 $(".pagination .myPage a").click(function(){
			 var page = $(this).html();
			 $.ajax({
				 url : "page1.do",
				 type : "post",
				 data : {
				     page : page
				 },
				 dataType : "json",
				 success : function(data) {//回调函数
					 $(".zy_tl_main_1_you_content").empty();//清除原有记录
					 $.each(data,function(index,value){
						      var discuss = '<div class="one">'+
								 '<div class="small_tx_div">'+
								 '<a><img class="small_tx" src="head/'+value.head+'" /></a>'+
								 ' </div>'+
								 '<div class="tl_bt">'+
								 '<a href="#"><p>'+value.title+'</p></a>'+
								 '</div>'+
								 '<div  class="tl_bt_hd">'+
								 '<span>'+value.times+'个回答</span><br />'+
								 '<span>'+value.time+'</span>'+
								 ' </div>'+
			                '</div>';
			                $(".zy_tl_main_1_you_content").append(discuss);  //将超链接添加到div中  
					 })
				 }
			 });
			return false;
		 });
	 });
	</script>
    <title>所有讨论</title>
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
                    <li class="li_cai_dan"><a href="allDiscuss.do"><div class="cai_dan" style="background-color:#F47A7A;">职业讨论</div></a></li>
                    <li class="li_cai_dan"><a href="allyueban.do"><div class="cai_dan">约伴</div></a></li>
                    <!-- <li style="width: 30px;"><a>登陆</a></li>
                    <li style="width: 30px;" class="zhu_ce"><a>注册</a></li> -->
                    <li style="width: 90px;"><a>发起活动</a>
                        <ul class="hd">
                            <li><a data-toggle="modal" data-target=".yueban">活动约伴</a></li>
                                <li><a data-toggle="modal" data-target="#myTalk">行业交流</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<div class="zy_tl_main">
    <div class="zy_tl_main_0">
        <strong style="font-size: 20px;color: white;">广场</strong>
    </div>
    <div class="zy_tl_main_1">
        <div class="zy_tl_main_1_zuo">
            <!--检索标准-->
            <a href="discussPageNew.do"><span id="an_shijian" class="${color_1 }">按时间</span></a><br />
            <a href="discussPageTimes.do"><span id="an_redu" class="${color_2}">按热度</span></a>
        </div>
        <div class="zy_tl_main_1_you">
        <div class="zy_tl_main_1_you_content">
        <c:forEach var="discusses1" items="${discusses}">
                <div class="one">
                    <div class="small_tx_div">
                        <a><img class="small_tx" src="head/${discusses1.get(0).head }" /></a>
                    </div>
                    <!--讨论标题-->
                    <div class="tl_bt">
                        <a href="talksDetails.do?id=${discusses1.get(1).id }&user_account=${discusses1.get(1).asker_account}"><p>${discusses1.get(1).discuss_title }</p></a>
                    </div>
                    <div  class="tl_bt_hd">
                        <span>${discusses1.get(1).answer_times }个回答</span><br />
                        <span>${discusses1.get(2) }</span>
                    </div>
                </div>
        </c:forEach>
        </div>
        <div class="one">
         <!-- 导航区域开始 -->
				 <ul class="pagination">
				 		<li class="disabled"><a href="#" aria-label="Previous">
				 		 <span aria-hidden="true">&laquo;</span>
				 		</a></li>
				 		<c:forEach var="x" begin="1" end="${pages}" step="1">
				 			<li class="myPage"><a href="#">${x}</a></li>
				 		</c:forEach>
				 		<li class="page"><a href="#" aria-label="Next"> 
				 		<span aria-hidden="true">&raquo;</span>
				 		</a></li>
				 </ul>
        <!-- 导航区域结束 -->
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
</body>
</html>