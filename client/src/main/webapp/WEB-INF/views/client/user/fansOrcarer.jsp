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
    <link href="../../static/css/ionicons.css" rel="stylesheet">
    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <%--H+--%>
    <link href="../../static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="../../static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="../../static/css/animate.min.css" rel="stylesheet">
    <link href="../../static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
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
<div class="fans_care" style="margin-top: 50px;margin-left: 120px;min-height: 420px;">
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
        <br />
        <p style="text-align: center;">南京工业职业技术学院计算机与软件学院</p>
    </div>
</footer>
<script src="../../static/js/jquery.min.js?v=2.1.4"></script>
<script src="../../static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="../../client/js/addAppAndDiscussFunction.js"></script>
<%--<script src="../../static/js/content.min.js?v=1.0.0"></script>--%>
<script>
    $(document).ready(function(){$(".contact-box").each(function(){animationHover(this,"pulse")})});
</script>
<%--<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>--%>
</body>
</html>
