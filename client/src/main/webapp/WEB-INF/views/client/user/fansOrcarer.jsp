<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/3/14
  Time: 18:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <!--引入导航的css样式文件-->
    <link href="../../static/css/dao_hang_style.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script type="text/javascript" src="../../static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../../static/js/bootstrap.min.js"></script>
    <%--H+--%>
    <link href="../../static/css/font-awesome.min93e3.css" rel="stylesheet">
    <link href="../../static/css/toastr.min.css" rel="stylesheet">
    <link href="../../static/css/animate.min.css" rel="stylesheet">
    <link href="../../static/css/style.min862f.css?v=4.1.0" rel="stylesheet">

    <%--layer--%>
    <script type="text/javascript" src="../../static/js/layer/2.1/layer.js"></script>
    <link href="../../static/css/toastr.min.css" rel="stylesheet">
    <script type="text/javascript">
        $(function () {
            var lis=$("ul.ul_first>li");

            lis.hover(function(){

                $(this).find("ul").show();

            },function(){

                $(this).find("ul").hide();

            })

            $(".myInfo").toggle(function () {
                $(".upUp").show();
                $(".myMessage").show();
            },function () {
                $(".upUp").hide();
                $(".myMessage").hide();
            });
            /*系统消息和通知消息的显示与隐藏*/
            $("#system").click(function () {
                $("#systemMessage").show();
                $("#informMessage").hide();
            });
            $("#inform").click(function () {
                $("#systemMessage").hide();
                $("#informMessage").show();
            });
        });
    </script>
    <title>Title</title>
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
                        <a class="tx_gr" href="mySpace.do"><img src="head/${userHead}"></a>
                    </div>
                </div>
            </div>
            <div class="search">
                <div class="input-group">
                    <input type="text" class="form-control searchText" id="searchText" value="${keys}" style="width:290px;height: 40px;border-radius: 6px;"> <span class="input-group-btn"> <button type="button" onclick="searchForm(4)" class="btn btn-primary">搜索
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
<div class="fans_care" style="margin-top: 50px;margin-left: 120px;min-height: 420px;">
    <input type="hidden" value="${account}" id="account">
    <div class="animated fadeInLeft">
        <label class="badge badge-primary">${index.label}</label>
    </div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <c:if test="${index.numbers == 0}">
                <p style="font-size: 30px;font-family: 微软雅黑;margin-left: 400px;">啥也没有。。。</p>
            </c:if>
            <c:forEach var="user" items="${index.userInfo}">
                <div class="col-sm-4">
                    <div class="contact-box" style="height: 195px;">
                        <a href="personal.do?account=${user.account}">
                            <div class="col-sm-4">
                                <div class="text-center">
                                    <img alt="image" class="img-circle m-t-xs img-responsive" src="head/${user.head}">
                                    <div class="m-t-xs font-bold">
                                        <span style="color: palevioletred;"class="${user.sex}"></span>
                                        <span style="margin-left: 1px;font-size: smaller;">${user.age}</span><br />
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <h3><strong>${user.nickName}</strong></h3>
                                签名:${user.signature}<br>
                                <address>
                                    <p><i class="fa fa-map-marker"></i> ${user.location}</p>
                                    <strong>${user.job}</strong><br>
                                        <%--E-mail:xxx@baidu.com<br>--%>
                                    <abbr title="Birth">生日:</abbr> ${user.birth}
                                </address>
                            </div>
                            <div class="clearfix"></div>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
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
