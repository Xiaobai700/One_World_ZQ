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
    <!-- 重要！不在线引入就会出现各种各样奇葩的问题 -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script type="text/javascript" src="../../static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../../static/js/bootstrap.min.js"></script>

    <!--引入主页的css样式文件-->
    <link href="../../static/css/index_style.css" rel="stylesheet">
    <!--引入导航的css样式文件-->
    <link href="../../static/css/dao_hang_style.css" rel="stylesheet">
    <link href="../../static/css/ionicons.css" rel="stylesheet">
    <%--H+的相关样式--%>
    <link href="../../static/css/font-awesome.min93e3.css" rel="stylesheet">
    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link href="../../static/css/toastr.min.css" rel="stylesheet">
    <link href="../../static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
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
    <title>所有分享</title>
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
                    <input type="text" class="form-control" id="searchText" value="${keys}" style="width:290px;height: 40px;border-radius: 6px;"> <span class="input-group-btn"> <button type="button" onclick="searchForm(3)" class="btn btn-primary">搜索
                                        </button> </span>
                </div>
            </div>
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
                        <%-- <ul class="myMessage">
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
                         </ul>--%>
                    </li>
                    <li class="li_cai_dan"><a href="index.do"><div class="cai_dan">首页</div></a></li>
                    <li class="li_cai_dan"><a href="allShares.do"><div class="cai_dan" style="background-color:#F47A7A;">分享</div></a></li>
                    <li class="li_cai_dan"><a href="welcome.do"><div class="cai_dan">欢迎</div></a></li>
                    <li class="li_cai_dan"><a href="discussPageNew.do"><div class="cai_dan">职业讨论</div></a></li>
                    <li class="li_cai_dan"><a href="allyueban.do"><div class="cai_dan">约伴</div></a></li>
                    <%--<li class="li_cai_dan"><a href="#">消息<span class="label label-danger" id="message">22</span></a></li>--%>
                    <%--<li class="dropdown li_cai_dan" style="width: 40px;">--%>
                        <%--<a class="&lt;%&ndash;dropdown-toggle count-info&ndash;%&gt;" &lt;%&ndash;data-toggle="dropdown"&ndash;%&gt; href="#">--%>
                            <%--<i class="fa fa-bell"></i> <span class="label label-danger" id="size"--%>
                                                             <%--style="line-height: 12px;padding: 1px 5px;position: absolute;;top: -2px;"></span>--%>
                        <%--</a>--%>
                        <%--<ul class="myMessage">--%>
                            <%--<li class="a">--%>
                                <%--<i class="fa fa-envelope fa-fw"></i><span id="underSize"></span>条未读消息--%>
                            <%--</li>--%>
                            <%--<li class="a">--%>
                                <%--<div id="messageDetail" style="text-align: left">--%>
                                <%--</div>--%>
                            <%--</li>--%>
                            <%--<li class="a" onclick="allMessagePage('与我相关','allMessage.do')">--%>
                                <%--<i class="fa fa-envelope fa-fw"></i>查看更多消息--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
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
<!--中部主要部分-->
<div class="fx_main">
    <div class="fx_main_0">
        <div class="fx_guang_chang">
            <strong style="font-size: 20px;color: white;">广场</strong>
        </div>
        <div class="me_share">
            <strong onclick="myShare('进行分享','myShare.do')" style="font-size: 20px;color: white;">我也要分享</strong>
        </div>
    </div>
    <div class="fx_main_dt">
        <div class="fx_left">
            <!--检索标准-->
            <!-- allShares.do -->
            <!-- allSharesLike.do -->
            <a href="allShares.do"><span id="an_shi_jian" class="${color_1 }">按时间</span></a><br />
            <a href="allSharesLike.do"><span id="an_re_du" class="${color_2}">按热度</span></a>
        </div>
        <div class="fx_right1">
            <!--所有分享主页就是很多个分享的缩略图放在一起，分享大图-->
            <c:forEach var="shares1" items="${index.share}">
            <div class="fx_dt" data-target="#${shares1.share.id }">
            	<input type="hidden" value="${shares1.share.id }" id="share_id">
               <img src="${shares1.share.share_thumbnail }" onclick="shareDetail('分享详情','shareDetail.do','${shares1.share.id}')"/>
               <input type="hidden" value="${shares1.share.sharer_account }" id="sharer_account">
            </div>
    		</c:forEach>
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
<script type="text/javascript" src="../../client/js/addAppAndDiscussFunction.js"></script>
<script src="../../static/js/toastr.min.js"></script>
<script src="../../static/js/toast.js"></script>
<script type="text/javascript">
    function myShare(title,url) {
        var editor = url;
        var w = 800;
        var h = 580;
        //layer_show(title,editor,w,h);
        layer.open({
            type: 2,
            area: [w + 'px', h + 'px'],
            fix: false, //不固定
            maxmin: true,
            shadeClose: true,/*点击遮罩层 弹出框消失*/
            shade: 0.4,
            title: title,
            content: editor,
            end: function () {
                // location.reload();
            }
        });
    }

</script>
</body>
</html>