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
    <script src="static/js/index_js.js"></script>
    <%--layer--%>
    <script type="text/javascript" src="../../static/js/layer/2.1/layer.js"></script>
    <script type="text/javascript" src="../../client/js/addAppAndDiscussFunction.js"></script>
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
        <div class="pin_lun_xian_shi">
            <ul class="media-list">
                <li class="media">
                    <a class="media-left" href="#">
                        <img src="head/${comment.userInfo.head }" style="width: 30px;height: 30px;border-radius: 25px;">
                    </a>
                    <div class="media-body">
                        <Strong class="media-heading">${comment.userInfo.nickName }</strong><br />
                        <h6>${comment.comment.comment_content }</h6>
                    </div>
                </li>
            </ul>
        </div>
    </c:forEach>
    <div style="margin-top: 20px;">
        <div style="margin-bottom: 20px;">
            <h4>我的评论</h4>
        </div>
        <form action="commentShare.do?target_id=${shares1.share.id }">
            <div class="input-group">
                <input type="text" class="form-control" name="comment_content">
                <input type="hidden" value="" name="target_id">
                <span class="input-group-btn">
                    <button class="btn btn-success" type="submit">发表评论</button>
                  </span>
            </div>
        </form>
    </div>
</div>
<!--  -->
</body>
</html>
