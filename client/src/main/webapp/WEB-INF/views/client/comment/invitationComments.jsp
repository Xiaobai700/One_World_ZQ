<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/5/2
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

    <%--H+--%>
    <link href="../../static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="../../static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="../../static/css/animate.min.css" rel="stylesheet">
    <link href="../../static/css/style.min862f.css?v=4.1.0" rel="stylesheet">

    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script type="text/javascript" src="../../static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../../static/js/bootstrap.min.js"></script>
    <%--<!--bootstrap-->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script src="../../static/js/jquery-2.2.4.min.js"></script>
    <script src="../../static/js/bootstrap.min.js"></script>--%>

    <%--<script src="../../static/js/bootstrap.min.js?v=3.3.6"></script>--%>
    <%--<script src="../../static/js/content.min.js?v=1.0.0"></script>--%>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    <!--引入主页的js文件-->
    <script src="../../static/js/index_js.js"></script>
    <%--layer--%>
    <script type="text/javascript" src="../../static/js/layer/2.1/layer.js"></script>
    <title>讨论的评论</title>
</head>
<body>
<input type="hidden" value="${account}" id="account">
<%--回复的模态框--%>
            <div>
                <c:if test="${commentSize == 0}">
                    <h3><p style="font-family: 微软雅黑;color: lightgray;padding-left: 20px;">当前回答没有任何评论！</p></h3>
                </c:if>
                <c:forEach var="comment" items="${comment}">
                    <div class="col-lg-12">
                        <div class="social-feed-box">
                            <div class="social-avatar">
                                <a href="#" class="pull-left">
                                    <img alt="image" src="head/${comment.userInfo.head }">
                                </a>
                                <div class="media-body">
                                    <a href="#">
                                            ${comment.userInfo.nickName }
                                    </a>
                                    <small class="text-muted">软件工程师</small>
                                </div>
                            </div>
                            <div class="social-body">
                                <p>
                                        ${comment.comment.comment_content }
                                </p>
                                <div class="under_answer">
                                    <a class="time"><i class="fa fa-clock-o"></i> ${comment.time}</a>
                                    <a class="talk"><i class="fa fa-comments"></i>查看对话</a>
                                    <div class="other">
                                        <a><i class="glyphicon glyphicon-share reply"></i>回复</a>
                                    </div>
                                    <div class="replyDiv"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div style="padding-left: 15px;padding-right: 15px;">
                <textarea class="form-control" id="commentContent"></textarea>
                <button type="button" class="btn btn-primary" style="float: right;margin-top: 10px;" onclick="commentAPP(${objectAccount},${targetId},1)">发送</button>
            </div>
<script type="text/javascript">
    $(".social-body").hover(function () {
        $(this).find("div.other").show();
    },function () {
        $(this).find("div.other").hide();
    })
</script>
<script type="text/javascript" src="../../client/js/addAppAndDiscussFunction.js"></script>
<script src="../../static/js/toastr.min.js"></script>
<script src="../../static/js/toast.js"></script>
</body>
</html>
