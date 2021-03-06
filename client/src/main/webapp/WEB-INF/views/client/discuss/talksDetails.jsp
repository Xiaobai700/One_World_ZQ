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
    <link href="../static/css/toastr.min.css" rel="stylesheet">
    <%--layer--%>
    <script type="text/javascript" src="../../static/js/layer/2.1/layer.js"></script>
    <title>职业讨论的详情</title>
</head>
<body style=" background-color: #FFFFFF;">
<input type="hidden" value="${account}" id="account">
<input type="hidden" value="${id}" id="discussId">
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
                    <div class="dl_tx"><%--head/${userInfo.head}--%>
                       <a class="tx_gr" href="mySpace.do"><img src="head/${userHead}"></a>
                    </div>
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
                    <li class="li_cai_dan"><a href="index.do"><div class="cai_dan" style="background-color:#F47A7A;">首页</div></a></li>
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
<div class="td_main">
    <div class="td_main_1">
        <!--活动发起者的信息-->
        <div style="float: left;width:10%;height: 125px;">
            <span><img src="head/${index.discussUser.head }" style="width: 80px;height: 80px;border-radius: 40px;" /></span><br />
            <span><strong>由${index.discussUser.nickName }发起</strong></span><br />
            <span style="margin-left: 10px;color: palevioletred;"class="gender ion-female"></span>
            <span style="margin-left: 1px;">${index.discussUser.age }岁</span>
        </div>
        <!--讨论的一些信息-->
        <div style="float: left;width:70%;height: 125px;">
            <!--标题和发表时间-->
            <div style="text-align: center;">
                <span style="font-size: 16px;"><strong>${index.discuss.discuss_title }</strong></span>
                <span style="float: right;">发表于：${index.time }</span>
            </div>
            <div style="height: 90px;padding-top: 7px;padding-left: 7px;margin-top: 10px;">
              <p> ${index.discuss.question_describe }</p>
            </div>
        </div>
    </div>
    <hr />
    <!--评论及回复区域-->
    <div class="td_main_2">
        <div class="row">
            <h2>回答：</h2>
            <c:if test="${index.answerNumber == 0}">
                <p>目前木有任何回答！</p>
            </c:if>
            <c:forEach var="answer" items="${index.answer}">
            <div class="col-lg-12">
                <div class="social-feed-box">
                    <div class="social-avatar">
                        <a href="#" class="pull-left">
                            <a href="personal.do?account=${answer.answerUser.account}"><img alt="image" src="head/${answer.answerUser.head }"></a>
                        </a>
                        <div class="media-body">
                            <a href="#" style="float: left;">
                                    ${answer.answerUser.nickName }
                            </a>
                            <small class="text-muted" style="float: left;">${answer.job}行业</small>
                        </div>
                    </div>
                    <div class="social-body">
                        <p>
                                ${answer.answer.answer_content }
                        </p>
                        <div class="under_answer">
                            <a class="time"><i class="fa fa-clock-o"></i>${answer.answerTime }</a>
                            <a class="time" style="margin-left: 3px;">被赞${answer.answer.agree_times}次</a>
                            <div class="other">
                                <c:if test="${answer.isLike == true}">
                                    <a style="color: deepskyblue;" onclick="likeInvitation('${answer.answerUser.account }','${answer.answer.id}',1,'${id}')"><i class="glyphicon glyphicon-thumbs-up"></i>取消赞</a>
                                </c:if>
                                <c:if test="${answer.isLike == false}">
                                    <a onclick="likeInvitation('${answer.answerUser.account }','${answer.answer.id}',1,'${id}')"><i class="glyphicon glyphicon-thumbs-up"></i>点赞</a>
                                </c:if>
                                <%--<a><i class="glyphicon glyphicon-thumbs-down"></i>踩</a>--%>
                                <a data-toggle="modal" onclick="invitationCommentsPage('评论${answer.answerUser.nickName }','invitationComment.do','${answer.answer.id}',1,'${answer.answerUser.account }','${id}')" <%--data-target="#${answer.answer.id}"--%>><i class="glyphicon glyphicon-share reply"></i>评论</a>
                                <a onclick="reportPage('选择举报类型','reportPage.do','${answer.answerUser.account }','${answer.answer.id}',1,'${id}')"><i class="glyphicon glyphicon-flag"></i>举报</a>
                            </div><%--report('${answer.answerUser.account }','${answer.answer.id}',1)--%>
                            <div class="replyDiv"></div>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
    <!--回答问题的文本框-->
    <div class="td_main_3">
        <div style="margin-bottom: 10px;">
            <h4><strong>我的回答</strong></h4>
        </div>
        <div class="input-group" style="width: 100%">
            <%--<input type="text" class="form-control"id="my_reply" name="answer_content">--%>
            <textarea class="form-control" id="my_reply" name="answer_content" ></textarea><br />
            <input type="hidden" value="${discuss.id }" name="discuss_id">
        </div>
        <span class="input-group-btn">
                    <button class="btn btn-success" onclick="answerDiscuss(${index.discussUser.account},'${index.discuss.id}',4)" style="margin-top: 10px;float: right;">发表回答</button>
            </span>
    </div>
<div>
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
<script type="text/javascript">
    $(".social-body").hover(function () {
        $(this).find("div.other").show();
    },function () {
        $(this).find("div.other").hide();
    })
</script>
<script type="text/javascript" src="../../client/js/addAppAndDiscussFunction.js"></script>
<script type="text/javascript" src="../../static/js/toastr.min.js"></script>
<script type="text/javascript" src="../../static/js/toast.js"></script>
</body>
</html>