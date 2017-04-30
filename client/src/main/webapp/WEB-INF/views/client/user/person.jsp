<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/4/16
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>用户个人详情</title>
    <link href="../../static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="../../static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="../../static/css/animate.min.css" rel="stylesheet">
    <link href="../../static/css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row animated fadeInRight">
        <div class="col-sm-4">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>个人资料</h5>
                </div>
                <div>
                    <div class="ibox-content no-padding border-left-right">
                        <img alt="image" class="img-responsive" src="head/${index.userInfo.head }">
                    </div>
                    <div class="ibox-content profile-content">
                        <h4><strong>${index.userInfo.nickName }</strong></h4>
                        <p><i class="fa fa-map-marker"></i> ${index.userInfo.location}</p>
                        <h5>
                            关于TA
                        </h5>
                        <p>
                            ${index.userInfo.signature}
                        </p>
                        <div class="row m-t-lg">
                            <div class="col-sm-4">
                                <span class="bar">5,3,9,6,5,9,7,3,5,2</span>
                                <h5>发布活动<strong>${index.appResult.appSize}</strong></h5>
                            </div>
                            <div class="col-sm-4">
                                <span class="line">5,3,9,6,5,9,7,3,5,2</span>
                                <h5>参与活动<strong>${index.appResult.appJoinSize}</strong></h5>
                            </div>
                            <div class="col-sm-4">
                                <span class="bar">5,3,9,6,5,9,7,3,5,2</span>
                                <h5>发起讨论<strong>${index.discussMeResult.discussMeSize}</strong></h5>
                            </div>
                        </div>
                        <div class="row m-t-lg">
                            <div class="col-sm-3">
                                <span class="line">5,3,9,6,5,9,7,3,5,2</span>
                                <h5>参加讨论<strong>${index.discussAnswerResult.discussAnswerSize}</strong></h5>
                            </div>
                            <div class="col-sm-3">
                                <span class="bar">5,3,9,6,5,9,7,3,5,2</span>
                                <h5>分享<strong>${index.shareResult.shareSize}</strong></h5>
                            </div>
                            <div class="col-sm-3">
                                <span class="line">5,3,9,6,5,9,7,3,5,2</span>
                                <h5>关注<strong>${index.userInfo.care_count }</strong></h5>
                            </div>
                            <div class="col-sm-3">
                                <span class="bar">5,3,9,6,5,9,7,3,5,2</span>
                                <h5>粉丝<strong>${index.userInfo.fans_count }</strong></h5>
                            </div>
                        </div>
                        <div class="user-button">
                            <div class="row">
                                <div class="col-sm-6">
                                    <button type="button" style="color: deeppink;" class="btn btn-primary btn-sm btn-block"><i class="fa fa-heart"></i> 关注</button>
                                </div>
                                <div class="col-sm-6">
                                    <button type="button" class="btn btn-danger btn-sm btn-block"><i class="fa fa-flag"></i> 举报</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>最新动态</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <%--<a class="dropdown-toggle" data-toggle="dropdown" href="profile.html#">--%>
                            <%--<i class="fa fa-wrench"></i>--%>
                        <%--</a>--%>
                        <%--<ul class="dropdown-menu dropdown-user">--%>
                            <%--<li><a href="profile.html#">选项1</a>--%>
                            <%--</li>--%>
                            <%--<li><a href="profile.html#">选项2</a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                        <%--<a class="close-link">--%>
                            <%--<i class="fa fa-times"></i>--%>
                        <%--</a>--%>
                    </div>
                </div>
                <div class="ibox-content">
                    <div>
                        <%--参与的活动--%>
                            <div class="feed-activity-list">
                                <div class="feed-element">
                                    <a href="profile.html#" class="pull-left">
                                        <img alt="image" class="img-circle" src="../../img/a1.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <c:if test="${index.appResult.appJoinSize == 0}">
                                            <div><strong>${index.userInfo.nickName}</strong>没有参加过任何活动</div>
                                        </c:if>
                                        <c:forEach var="app" items="${index.appResult.appJoined}">
                                            <small class="pull-right text-navy">${share.share_time }</small>
                                            <strong>${index.userInfo.nickName}</strong> 参与了<strong>${app.theme }</strong>主题的活动.
                                            <br>
                                            <div class="actions">
                                                <a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞 </a>
                                            </div>
                                        </c:forEach>
                                        <c:if test="${index.appResult.appJoinSize != 0}">
                                            <a class="btn btn-xs btn-primary" href="">查看TA参与的所有活动</a>
                                        </c:if>

                                    </div>
                                </div>
                            </div>
                        <%--发布的活动--%>
                            <div class="feed-activity-list">
                                <div class="feed-element">
                                    <a href="profile.html#" class="pull-left">
                                        <img alt="image" class="img-circle" src="../../img/a1.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <c:if test="${index.appResult.appSize == 0}">
                                            <div><strong>${index.userInfo.nickName}</strong>没有发起过任何活动</div>
                                        </c:if>
                                        <c:forEach var="app" items="${index.appResult.app}">
                                            <small class="pull-right text-navy">${share.share_time }</small>
                                            <strong>${index.userInfo.nickName}</strong> 发起了<strong>${app.appointment.theme }</strong>主题的活动.
                                            <br>
                                            <div class="actions">
                                                <a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞 </a>
                                            </div>
                                        </c:forEach>
                                        <c:if test="${index.appResult.appSize != 0}">
                                            <a class="btn btn-xs btn-primary" href="">查看TA发布的所有活动</a>
                                        </c:if>

                                    </div>
                                </div>
                            </div>
                        <%--发起的讨论--%>
                            <div class="feed-activity-list">
                                <div class="feed-element">
                                    <a href="profile.html#" class="pull-left">
                                        <img alt="image" class="img-circle" src="../../img/a1.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <c:if test="${index.discussMeResult.discussMeSize == 0}">
                                            <div><strong>${index.userInfo.nickName}</strong>没有发起任何讨论</div>
                                        </c:if>
                                        <c:forEach var="fq" items="${index.discussMeResult.discussMe}">
                                            <small class="pull-right text-navy">${fq.ask_time }</small>
                                            <strong>${index.userInfo.nickName}</strong> 发起了题为<strong>${fq.discuss_title }</strong>的讨论.
                                            <br>
                                            <div class="actions">
                                                <a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞 </a>
                                            </div>
                                        </c:forEach>
                                        <c:if test="${index.discussMeResult.discussMeSize != 0}">
                                            <a class="btn btn-xs btn-primary" href="">查看TA发起的所有讨论</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        <%--参与的讨论--%>
                            <div class="feed-activity-list">
                                <div class="feed-element">
                                    <a href="profile.html#" class="pull-left">
                                        <img alt="image" class="img-circle" src="../../img/a1.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <c:if test="${index.discussAnswerResult.discussAnswerSize == 0}">
                                            <div><strong>${index.userInfo.nickName}</strong>没有参与任何讨论</div>
                                        </c:if>
                                        <c:forEach var="join" items="${index.discussAnswerResult.discussAnswer}">
                                            <small class="pull-right text-navy">${join.answer.answer_time }</small>
                                            <strong>${index.userInfo.nickName}</strong> 回答了 <strong>问题：${join.discuss.discuss_title }</strong>.
                                            <br>
                                            <div class="actions">
                                                <a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞 </a>
                                            </div>
                                        </c:forEach>
                                        <c:if test="${index.discussAnswerResult.discussAnswerSize != 0}">
                                            <a class="btn btn-xs btn-primary" href="">查看TA回答的所有问题</a>
                                        </c:if>

                                    </div>
                                </div>
                            </div>
                        <%--发表的分享--%>
                        <div class="feed-activity-list">
                            <div class="feed-element">
                                <a href="profile.html#" class="pull-left">
                                    <img alt="image" class="img-circle" src="../../img/a1.jpg">
                                </a>
                                <div class="media-body ">
                                    <c:if test="${index.shareResult.shareSize == 0}">
                                        <div><strong>${index.userInfo.nickName}</strong>没有发表过任何分享</div>
                                    </c:if>
                                    <c:forEach var="share" items="${index.shareResult.share}">
                                        <small class="pull-right text-navy">${share.share_time }</small>
                                        <strong>${index.userInfo.nickName}</strong> 发表了题为 <strong>${share.share_title}</strong>的分享.
                                        <br>
                                        <div class="photos">
                                            <img alt="image" class="feed-photo" src="../../img/a1.jpg">
                                        </div>
                                        <div class="actions">
                                            <a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞 </a>
                                        </div>
                                    </c:forEach>
                                    <c:if test="${index.shareResult.shareSize != 0}">
                                        <a class="btn btn-xs btn-primary" href="">查看TA的所有分享</a>
                                    </c:if>

                                </div>
                            </div>
                        </div>

                        <button class="btn btn-primary btn-block m"><i class="fa fa-arrow-down"></i> 显示更多</button>

                    </div>

                </div>
            </div>

        </div>
    </div>
</div>
<script src="../../static/js/jquery.min.js?v=2.1.4"></script>
<script src="../../static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="../../static/js/content.min.js?v=1.0.0"></script>
<script src="../../static/js/jquery.peity.min.js"></script>
<script src="../../static/js/peity-demo.min.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

</body>
</html>
