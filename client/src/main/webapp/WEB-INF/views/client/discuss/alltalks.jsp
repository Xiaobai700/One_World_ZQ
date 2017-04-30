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
    <link href="../../static/css/index_style.css" rel="stylesheet">
    <!--引入导航的css样式文件-->
    <link href="../../static/css/dao_hang_style.css" rel="stylesheet">
    <link href="../../static/css/ionicons.css" rel="stylesheet">
    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

    <!--bootstrap-->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script src="../../static/js/jquery-2.2.4.min.js"></script>
    <%--<script src="../../static/js/bootstrap.min.js"></script>--%>

    <%--H+--%>
    <link href="../../static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="../../static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="../../static/css/animate.min.css" rel="stylesheet">
    <link href="../../static/css/style.min862f.css?v=4.1.0" rel="stylesheet">

    <!--引入主页的js文件-->
    <script src="static/js/index_js.js"></script>
    <%--layer--%>
    <script type="text/javascript" src="../../static/js/layer/2.1/layer.js"></script>
    <script type="text/javascript" src="../../client/js/addAppAndDiscussFunction.js"></script>
    <%--jquery 文件要在此脚本之前引入--%>

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
                         <a class="tx_gr" href="mySpace.do"><%--<img src="head/${userInfo.head}">--%><img src="${userHead}"></a>
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
<div class="zy_tl_main_1">
    <div class="zy_tl_main_1_zuo">
        <!--检索标准-->
        <a href="discussPageNew.do"><span id="an_shijian" class="${color_1 }">按时间</span></a><br />
        <a href="discussPageTimes.do"><span id="an_redu" class="${color_2}">按热度</span></a>
    </div>
    <div class="zy_tl_main_1_you">
        <div class="wrapper wrapper-content  animated fadeInRight blog">
            <div class="row content">
                <c:forEach var="discuss" items="${index.dis}">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-content">
                            <a href="discussDetail.do?id=${discuss.discuss.id }" class="btn-link">
                                <h2>
                                    ${discuss.discuss.discuss_title}
                                </h2>
                            </a>
                            <div class="small m-b-xs">
                                <strong>${discuss.discussUser.nickName}</strong> <span class="text-muted"><i class="fa fa-clock-o"></i> ${discuss.time}</span>
                            </div>
                            <p>
                                ${discuss.discuss.question_describe}
                            </p>
                            <div class="row">
                                <div class="col-md-6">
                                    <h5>标签：</h5>
                                    <button class="btn btn-primary btn-xs" type="button">${discuss.industry.industry_name}</button>
                                    <%--<button class="btn btn-white btn-xs" type="button">速比涛</button>--%>
                                </div>
                                <div class="col-md-6">
                                    <div class="small text-right">
                                        <h5>状态：</h5>
                                        <div> <i class="fa fa-comments-o"> </i>${discuss.discuss.answer_times} 回复 </div>
                                        <%--<i class="fa fa-eye"> </i> 144 浏览--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <%--页码标签--%>
                    <ul class="pagination">
                        <li class="disabled"><a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a></li>
                        <c:forEach var="x" begin="1" end="${pages}" step="1">
                            <li class="myPage"><a href="#" class="zqPage">${x}</a></li>
                        </c:forEach>
                        <li class="page"><a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a></li>
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
<script type="text/javascript" src="../../static/js/jquery.min.js?v=2.1.4"></script>
<script type="text/javascript">
    $(function(){
        /*点击页码 jquery文件的引入很重要 不要动不动就注释掉 代码要尽量规范 好好写*/
        $(".zqPage").click(function(){
            var page = $(this).html();
            $.ajax({
                url : "page.do",
                type : "post",
                data : {
                    page : page
                },
                dataType : "json",
                success : function(data) {//回调函数
                    $(".blog .content").empty();//清楚原有记录
                    $.each(data,function(index,value){
                        var discussZQ = '<div class="col-lg-12">'+
                            '<div class="ibox">'+
                            '<div class="ibox-content">'+
                            '<a href="discussDetail.do?id='+value.id+'" class="btn-link">'+
                            '<h2>'+
                            value.title+
                            '</h2>'+
                            '</a>'+
                            ' <div class="small m-b-xs">'+
                            '<strong>'+value.nickName+'</strong> <span class="text-muted"><i class="fa fa-clock-o"></i>'+value.time+'</span>'+
                            '</div>'+
                            '<p>'+
                            value.describe+
                            '</p>'+
                            '<div class="row">'+
                            '<div class="col-md-6">'+
                            '<h5>标签：</h5>'+
                            '<button class="btn btn-primary btn-xs" type="button">Apple Watch</button>'+
                            '<button class="btn btn-white btn-xs" type="button">速比涛</button>'+
                            ' </div>'+
                            ' <div class="col-md-6">'+
                            '<div class="small text-right">'+
                            '<h5>状态：</h5>'+
                            '<div> <i class="fa fa-comments-o"> </i> '+value.times+'回复 </div>'+
                                /*  '<i class="fa fa-eye"> </i> 144 浏览'+*/
                            '</div>'+
                            '</div>'+
                            '</div>'+
                            '</div>'+
                            '</div>'+
                            '</div>';
                        $(".blog .content").append(discussZQ);
                    })
                }
            });
            return false;
        });
    });
</script>
<script type="text/javascript" src="../../static/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="../../static/js/content.min.js?v=1.0.0"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>