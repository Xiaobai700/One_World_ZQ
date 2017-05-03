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

    <%--light box--%>
    <link type="text/css" rel="stylesheet" href="../../static/lightbox2/2.8.1/css/lightbox.css">
    <%--H+--%>
    <link href="../../static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="../../static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="../../static/css/animate.min.css" rel="stylesheet">
    <link href="../../static/css/style.min862f.css?v=4.1.0" rel="stylesheet">

    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script type="text/javascript" src="../../static/js/jquery-1.8.3.min.js"></script>
    <%--<script type="text/javascript" src="../../static/js/jquery.min.js?v=2.1.4"></script>--%>
    <script type="text/javascript" src="../../static/js/bootstrap.min.js"></script>
    <%--<script type="text/javascript" src="../../static/js/content.min.js?v=1.0.0"></script>--%>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    <!--引入主页的js文件-->
    <script src="../../static/js/index_js.js"></script>
    <%--layer--%>
    <script type="text/javascript" src="../../static/js/layer/2.1/layer.js"></script>
    <%--<script type="text/javascript" src="../../client/js/addAppAndDiscussFunction.js"></script>--%>
    <title>约伴详情</title>
    <script type="text/javascript">

    </script>
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
                        <a class="tx_gr" href="mySpace.do"><img src="${userHead}"></a>
                    </div>
                </div>
            </div>

            <!--右边的菜单-->
           <%-- <div class="dh_div_right">
                <ul class="ul_first">
                    <li class="li_cai_dan"><a href="index.do"><div class="cai_dan">首页</div></a></li>
                    <li class="li_cai_dan"><a href="allShares.do"><div class="cai_dan">分享</div></a></li>
                    <li class="li_cai_dan"><a href="welcome.do"><div class="cai_dan">欢迎</div></a></li>
                    <li class="li_cai_dan"><a href="discussPageNew.do"><div class="cai_dan">职业讨论</div></a></li>
                    <li class="li_cai_dan"><a href="allyueban.do"><div class="cai_dan">约伴</div></a></li>
                    <!-- <li style="width: 30px;"><a  data-toggle="modal" data-target=".login">登陆</a></li>
                    <li style="width: 30px;" class="zhu_ce"><a data-toggle="modal" data-target=".sign">注册</a></li> -->
                    <li style="width: 90px;"><a>发起活动</a>
                        <ul class="hd">
                            <li><a onclick="addAppPage('发布约伴活动','add-app.html')" >活动约伴</a></li>
                            <li><a onclick="addDiscussPage('发布讨论活动','add-discuss.html')">行业交流</a></li>
                        </ul>
                    </li>
                </ul>
            </div>--%>
            <div class="dh_div_right">
                <ul class="ul_first">
                    <li class="li_cai_dan"><a href="index.do"><div class="cai_dan" style="background-color:#F47A7A;">首页</div></a></li>
                    <li class="li_cai_dan"><a href="allShares.do"><div class="cai_dan">分享</div></a></li>
                    <li class="li_cai_dan"><a href="welcome.do"><div class="cai_dan">欢迎</div></a></li>
                    <li class="li_cai_dan"><a href="discussPageNew.do"><div class="cai_dan">职业讨论</div></a></li>
                    <li class="li_cai_dan"><a href="allyueban.do"><div class="cai_dan">约伴</div></a></li>
                    <%--<li class="li_cai_dan"><a href="#">消息<span class="label label-danger" id="message">22</span></a></li>--%>
                    <li class="dropdown li_cai_dan" style="width: 40px;">
                        <a class="<%--dropdown-toggle count-info--%>" <%--data-toggle="dropdown"--%> href="#">
                            <i class="fa fa-bell"></i> <span class="label label-danger" id="size"
                                                             style="line-height: 12px;padding: 1px 5px;position: absolute;;top: -2px;"></span>
                        </a>
                        <ul class="myMessage">
                            <li class="a">
                                <i class="fa fa-envelope fa-fw"></i><span id="underSize"></span>条未读消息
                            </li>
                            <li class="a">
                                <div id="messageDetail" style="text-align: left">
                                </div>
                            </li>
                            <li class="a" onclick="allMessagePage('与我相关','allMessage.do')">
                                <i class="fa fa-envelope fa-fw"></i>查看更多消息
                            </li>
                        </ul>
                    </li>
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
<div class="yb_xq_main">
    <div class="yb_xq_main_1">
        <div class="main_1_1">
            <div class="one_left">
                <!--活动开始的时间，活动的主题，-->
                <span class="stay">${index.appointment.duration }</span>
                <span class="stay">${index.appointment.begin_time }开始</span>
                <span class="m_or_w">${index.appointment.sex_restrict }</span><br />
                <!--<span>2015.12.6</span>&nbsp;&nbsp;<span>读书</span><br />-->
                <!--地点-->
                <span style="font-size: 20px;color: #8c4810;">${index.appointment.site }</span><br />
                <span><img src="head/${index.find_userInfo.head }" style="width: 80px;height: 80px;border-radius: 40px;" /></span><br />
                <span style="margin-left: 10px;"><strong>由${index.find_userInfo.nickName }发起</strong></span><br />
                <span style="margin-left: 13px;color: palevioletred;"class="gender ion-female"></span>
                <span style="margin-left: 1px;">${index.find_userInfo.age }</span>
            </div>
            <div class="one_right">
                <c:if test="${index.isJoin==true}">
                    <button class="btn btn-primary">您已申请加入活动</button>
                </c:if>
                <c:if test="${index.isJoin==false}">
                    <button class="btn btn-outline btn-primary" onclick="join_app('${index.appointment.id}',${index.find_userInfo.account })">申请加入活动</button>
                </c:if>
            </div>
        </div>
        <!--活动的内容详细，文字和图片-->
        <div class="main_1_2">
        <div class="yue_ban_content">
            ${index.appointment.content }
        </div>
            <div class="yue_ban_img">
                 <!-- <img src="img/fx_6.png " style="width: 200px;height: 170px;" />
                <img src="img/fx_6.png " style="width: 200px;height: 170px;" />  -->
            </div>
        </div>
        <!--成功加入者的头像，鼠标悬停头像显示用户的姓名等（建议）-->
        <c:if test="${index.find_userInfo.account == account }">
            <div class="main_1_3">
                <div class="row">
                    <div class="col-md-10">
                        <span>申请加入的用户(您可以双击未加入用户头像进行审核)</span>
                    </div>
                    <div class="can_yu_tx">
                        <ul>
                            <c:forEach var="joiner" items="${index.wantJoin_userInfos}">
                                <li>
                                    <a>
                                        <img class="chenckJoin" src="head/${joiner.joinUser.head }" />
                                        <input type="hidden" value="${joiner.join.id}">
                                        <input type="hidden" value="${joiner.joinUser.account}">
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>

        <!--成功加入者的头像，鼠标悬停头像显示用户的姓名等（建议）-->
        <div class="main_1_3">
            <div class="row">
                <div class="col-md-10">
                    <span>已成功加入</span>
                </div>
                <div class="can_yu_tx">
                    <ul>
                        <c:forEach var="joiner" items="${index.join_userInfos}">
                            <li><a><img src="head/${joiner.head }" /></a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <!--评论相关，显示评论，写评论的文本框-->
        <div class="main_1_4">
            <h2>评论：</h2>
            <c:if test="${index.commentNumber == 0}">
                <p>目前还木有任何评论，沙发是你的啦！快评论去！</p>
            </c:if>
                <div>
                    <div class="row">
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
                                        <a class="talk"><i class="fa fa-comments"></i>查看对话</a>
                                        <div class="other">
                                            <%--<a><i class="glyphicon glyphicon-thumbs-up"></i>点赞</a>--%>
                                            <%--<a><i class="glyphicon glyphicon-thumbs-down"></i>踩</a>--%>
                                            <a class="reply" account="${comment.userInfo.account}" commentId="${comment.comment.id}"><i class="glyphicon glyphicon-share"></i>回复</a>
                                            <%--<a><i class="glyphicon glyphicon-flag"></i>举报</a>--%>
                                        </div>
                                        <div class="replyDiv"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                    <!--评论框-->
                    <div class="input-group">
                        <input type="text" class="form-control" id="commentContent">
                        <span class="input-group-btn">
                    <button class="btn btn-success" type="button" onclick="commentAPP(${index.find_userInfo.account },'${index.appointment.id}',2)">发表评论</button>
                  </span>
                    </div>
        </div>
</div>
    </div>
</div>
<div id="dv"></div>
<footer>
    <div>
        <br />
        <p style="text-align: center;">南京工业职业技术学院计算机与软件学院</p>
    </div>
</footer>
<%--<script type="text/javascript" src="../../static/lightbox2/2.8.1/js/lightbox-plus-jquery.js"></script>--%>
<script type="text/javascript">
    $(function(){
        //把从文本编辑器中的图片放到和文本内容不一样的位置，让图片处于文本的下方
//    	$(".yue_ban_img").html($(".yue_ban_content img"));
/**
 * 把本来放置内容的元素中的img标签取出来 放至另外uoge新的div之中 再把之前元素中的img标签隐藏
 * 文本和图片分离
 * */
        var imgs = $(".yue_ban_content img");
        $.each(imgs,function (index,value) {
            var src = value.src;
            $(".yue_ban_img").append("<a href="+src+'  data-lightbox=\'example-1\' data-title=\'图片详情\'><img src='+src+"></a>&nbsp;");
        })
        $(".yue_ban_content").find("img").hide();

    })

    $(".social-body").hover(function () {
        $(this).find("div.other").show();
    },function () {
        $(this).find("div.other").hide();
    })

    $(".chenckJoin").dblclick(function () {
        var joinId = $(this).next().val();
        var wantJoinerAccount = $(this).next().next().val();
        layer.confirm('您同意此加入吗？', {
            btn: ['欣然同意','残忍拒绝','我再想想'] //按钮
        }, function(){
            checkJoin(joinId,wantJoinerAccount);
            /*是否加入字段值改成1*/
        }, function(){
            rejectJoin(joinId,wantJoinerAccount);
            /*拒绝就把join表中这条数据删除*/
        });
    });


</script>
<script type="text/javascript" src="../../client/js/addAppAndDiscussFunction.js"></script>
<script src="../../static/js/toastr.min.js"></script>
<script src="../../static/js/toast.js"></script>
<script type="text/javascript">
    $(".reply").toggle(function () {
        var account = $(this).attr("account");
        var commentId = $(this).attr("commentId");
        var replyInput =' <input type="text" class="form-control">'+
            '<button class="btn btn-primary aa" onclick="replyComment('+account+','+commentId+',1)">回复</button>'+
            '<button class="btn btn-default cancel">取消</button>';
        $(this).parent().next().append(replyInput);

        $(".aa").live('click',function () {
            replyComment(account,commentId,3);
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