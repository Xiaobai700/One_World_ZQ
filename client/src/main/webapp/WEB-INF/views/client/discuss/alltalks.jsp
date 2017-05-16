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
    <!--bootstrap-->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script type="text/javascript" src="../../static/js/jquery-1.8.3.min.js"></script>
    <%--H+--%>
    <link href="../../static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="../../static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="../../static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="../../static/css/toastr.min.css" rel="stylesheet">
    <!--引入主页的js文件-->
    <script src="static/js/index_js.js"></script>
    <%--layer--%>
    <%--jquery 文件要在此脚本之前引入 此脚本置于尾部不可用--%>
    <script type="text/javascript">
        $(function(){
            /*点击页码 jquery文件的引入很重要 不要动不动就注释掉 代码要尽量规范 好好写*/
            $(".zqPage").click(function(){
                var page = $(this).html();
                $.ajax({
                    url : "page.do",
                    type : "post",
                    data : {
                        page : page,
                        keys:$("#searchText").val()
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
                                '<button class="btn btn-primary btn-xs" type="button">'+value.industryName+'</button>'+
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
    <title>所有讨论</title>
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
                    <input type="text" class="form-control searchText" id="searchText" value="${keys}" style="width:290px;height: 40px;border-radius: 6px;"> <span class="input-group-btn"> <button type="button" onclick="searchForm(1)" class="btn btn-primary">搜索
                                        </button> </span>
                </div>
            </div>
            <div class="dh_div_right">
                <ul class="ul_first">
                    <li class="li_cai_dan" style="width: 40px;">
                        <a class="myInfo" href="#" style="display: block;">
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
                    <li class="li_cai_dan"><a href="discussPageNew.do"><div class="cai_dan" style="background-color:#F47A7A;">职业讨论</div></a></li>
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
        <div class="wrapper wrapper-content blog">
            <div class="row content">
                <c:if test="${index.discussNumbers == 0}">
                    <h2><p style="font-family: '微软雅黑';margin-left: 90px;
                margin-top: 60px;">啥也没搜到！看看别的吧！</p></h2>
                </c:if>
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
                                <strong>${discuss.userInfo.nickName}</strong> <span class="text-muted"><i class="fa fa-clock-o"></i> ${discuss.time}</span>
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
<div id="dv"></div>
<footer>
    <div>
        <ul>
            <li>联系作者:1053373312@qq.com</li>
            <li class="feedBack" onclick="feedBackPage('反馈信息','feedBack.html')">反馈</li>
        </ul>
    </div>
</footer>
<script type="text/javascript" src="../../static/js/content.min.js?v=1.0.0"></script>
<script type="text/javascript" src="../../static/js/layer/2.1/layer.js"></script>
<script type="text/javascript" src="../../client/js/addAppAndDiscussFunction.js"></script>
<script src="../../static/js/toastr.min.js"></script>
<script src="../../static/js/toast.js"></script>

</body>
</html>