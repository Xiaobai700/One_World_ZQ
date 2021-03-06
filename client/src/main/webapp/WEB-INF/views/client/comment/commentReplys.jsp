<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/5/3
  Time: 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    <!--引入主页的js文件-->
    <script src="../../static/js/index_js.js"></script>
    <%--layer--%>
    <script type="text/javascript" src="../../static/js/layer/2.1/layer.js"></script>
    <title>查看对话</title>
</head>
<body>
<input type="hidden" value="${account}" id="account">
<c:forEach var="reply" items="${reply}" >
    <div class="col-lg-12">
        <div class="social-feed-box">
            <div class="social-avatar">
                <a href="#" class="pull-left">
                    <img alt="image" src="head/${reply.replyerUser.head}">
                </a>
                <div class="media-body">
                    <div>
                        <a style="float: left;"><small>${reply.replyerUser.nickName}</small></a><small style="float: left;">回复</small><a  style="float: left;"><small>${reply.replyedUser.nickName}</small></a>
                    </div>
                        <%--<small class="text-muted">软件工程师</small>--%>
                </div>
            </div>
            <div class="social-body">
                <p>
                    ${reply.reply.replyContent}
                </p>
                <div class="under_answer">
                    <a class="time"><i class="fa fa-clock-o"></i> ${reply.time}</a>
                    <%--<a class="talk"><i class="fa fa-comments"></i>查看对话</a>--%>
                    <div class="other">
                        <a class="reply" account="${reply.replyerUser.account}" commentId="${commentId}" parentId="${patentId}"><i class="glyphicon glyphicon-share"></i>回复</a>
                    </div>
                    <div class="replyDiv"></div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>

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
<script type="text/javascript">
    $(".reply").toggle(function () {
        var account = $(this).attr("account");
        var commentId = $(this).attr("commentId");
        var parentId = $(this).attr("parentId");
        var replyInput =' <input type="text" class="form-control">'+
            '<button class="btn btn-primary aa">回复</button>'+
            '<button class="btn btn-default cancel">取消</button>';
        $(this).parent().next().append(replyInput);

        $(".aa").live('click',function () {
            replyComment(account,commentId,${replyType},'${parentId}');
        });

        $(".cancel").live('click',function () {
            cancelReply();
        });
    },function () {
        cancelReply();
    });
</script>
</body>
</html>
