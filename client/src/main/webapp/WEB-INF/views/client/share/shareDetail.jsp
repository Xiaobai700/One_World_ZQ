<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/4/25
  Time: 17:09
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
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    <!--引入主页的js文件-->
    <script src="../../static/js/index_js.js"></script>
    <%--layer--%>
    <script type="text/javascript" src="../../static/js/layer/2.1/layer.js"></script>

    <style type="text/css">
        .share_contents img{
            margin-left:38px;
            width:400px;
            height:300px;
        }
    </style>
    <title>分享详情</title>
</head>
<body>
<input type="hidden" value="${account}" id="account">
<!--  -->
<div style="padding-left: 10px;padding-right: 10px;">
    <div style="margin-top: 10px;">
        <ul class="media-list">
            <li class="media">
                <a class="media-left" href="#">
                    <img src="../../img/a1.jpg" style="width: 50px;height: 50px;border-radius: 25px;">
                </a>
                <div class="media-body">
                    <Strong class="media-heading">${index.editor.nickName}</strong><br />
                    <span style="color: palevioletred;"class="${index.editor.sex}"></span>
                    <span style="margin-left: 1px;">${index.editor.age}</span>
                </div>
            </li>
        </ul>
    </div>
    <div style="padding-left: 5px;" class="share_contents">
       ${index.share.share_content}
    </div>
    <div class="share_img"></div>
    <div style="margin-top: 20px;">
        <span class="x_s_p_l">评论</span>
        <span style="color:purple;" class="glyphicon glyphicon-thumbs-up">赞</span>
        <!--  -->
    </div>
    <!--显示评论-->
    <c:forEach var="comment" items="${index.comment}">
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
                        <c:if test="${comment.replyNumbers > 0}">
                        <a class="talk" onclick="getReply('查看对话','replyPage.do','${comment.comment.id}',2)"><i class="fa fa-comments"></i>查看对话</a>
                    </c:if>
                        <%--<a class="talk"><i class="fa fa-comments"></i>查看对话</a>--%>
                        <div class="other">
                            <a class="reply" account="${comment.userInfo.account}" commentId="${comment.comment.id}"><i class="glyphicon glyphicon-share reply"></i>回复</a>
                        </div>
                        <div class="replyDiv"></div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    <div style="margin-top: 20px;margin-bottom: 30px;">
        <div style="margin-bottom: 20px;">
            <h4>我的评论</h4>
        </div>
            <div class="input-group">
                <input type="text" class="form-control" id="commentContent">
                <input type="hidden" value="" name="target_id">
                <span class="input-group-btn">
                    <button class="btn btn-success" onclick="commentAPP(${index.editor.account},'${index.share.id}',3)">发表评论</button>
                  </span>
            </div>
    </div>
</div>
<!--  -->
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
        var replyInput =' <input type="text" class="form-control">'+
            '<button class="btn btn-primary aa">回复</button>'+
            '<button class="btn btn-default cancel">取消</button>';
        $(this).parent().next().append(replyInput);

        $(".aa").live('click',function () {
            replyComment(account,commentId,2);
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
