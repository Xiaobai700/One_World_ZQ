<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/5/1
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
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
    <%--<script src="static/js/jquery-2.2.4.min.js"></script>--%>
    <%--<script src="static/js/index_js.js"></script>--%>
    <%--<script src="static/js/bootstrap.min.js"></script>--%>
    <%--light box--%>
    <link type="text/css" rel="stylesheet" href="../../static/lightbox2/2.8.1/css/lightbox.css">
    <%--H+--%>
    <link href="../../static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="../../static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="../../static/css/animate.min.css" rel="stylesheet">
    <link href="../../static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <script src="../../static/js/jquery-1.8.3.min.js"></script>

    <%--<script type="text/javascript" src="../../static/js/jquery.min.js?v=2.1.4"></script>--%>
    <script type="text/javascript" src="../../static/js/bootstrap.min.js?v=3.3.6"></script>
    <script type="text/javascript" src="../../static/js/content.min.js?v=1.0.0"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    <!--引入主页的js文件-->
    <script src="../../static/js/index_js.js"></script>
    <%--layer--%>
    <script type="text/javascript" src="../../static/js/layer/2.1/layer.js"></script>
    <title>约伴详情</title>
    <script type="text/javascript">

    </script>
</head>
<body>
<div class="mail-box">
    <table class="table table-hover table-mail">
        <tbody>
        <tr class="unread">
            <td class="check-mail">
                <input type="checkbox" class="i-checks">
            </td>
            <td class="mail-ontact"><a href="mail_detail.html">支付宝</a>
            </td>
            <td class="mail-subject"><a href="mail_detail.html">支付宝提醒</a>
            </td>
            <td class=""><i class="fa fa-paperclip"></i>
            </td>
            <td class="text-right mail-date">昨天 10:20</td>
        </tr>
        <tr class="unread">
            <td class="check-mail">
                <input type="checkbox" class="i-checks" checked>
            </td>
            <td class="mail-ontact"><a href="mail_detail.html">Amaze UI</a>
            </td>
            <td class="mail-subject"><a href="mail_detail.html">Amaze UI Beta2 发布</a>
            </td>
            <td class=""></td>
            <td class="text-right mail-date">上午10:57</td>
        </tr>
        <tr class="read">
            <td class="check-mail">
                <input type="checkbox" class="i-checks">
            </td>
            <td class="mail-ontact"><a href="mail_detail.html">WordPress</a> <span class="label label-warning pull-right">验证邮件</span>
            </td>
            <td class="mail-subject"><a href="mail_detail.html">wp-user-frontend-pro v2.1.9</a>
            </td>
            <td class=""></td>
            <td class="text-right mail-date">上午9:21</td>
        </tr>
        <tr class="read">
            <td class="check-mail">
                <input type="checkbox" class="i-checks">
            </td>
            <td class="mail-ontact"><a href="mail_detail.html">淘宝网</a>
            </td>
            <td class="mail-subject"><a href="mail_detail.html">史上最全！淘宝双11红包疯抢攻略！</a>
            </td>
            <td class=""></td>
            <td class="text-right mail-date">中午12:24</td>
        </tr>
        <tr class="read">
            <td class="check-mail">
                <input type="checkbox" class="i-checks">
            </td>
            <td class="mail-ontact"><a href="mail_detail.html">淘宝网</a> <span class="label label-danger pull-right">AD</span>
            </td>
            <td class="mail-subject"><a href="mail_detail.html">亲，双11来啦！帮你挑货，还送你4999元红包！仅此一次！</a>
            </td>
            <td class=""><i class="fa fa-paperclip"></i>
            </td>
            <td class="text-right mail-date">上午6:48</td>
        </tr>
        <tr class="read">
            <td class="check-mail">
                <input type="checkbox" class="i-checks">
            </td>
            <td class="mail-ontact"><a href="mail_detail.html">支付宝</a>
            </td>
            <td class="mail-subject"><a href="mail_detail.html">支付宝提醒</a>
            </td>
            <td class=""><i class="fa fa-paperclip"></i>
            </td>
            <td class="text-right mail-date">昨天 10:20</td>
        </tr>
        <tr class="read">
            <td class="check-mail">
                <input type="checkbox" class="i-checks">
            </td>
            <td class="mail-ontact"><a href="mail_detail.html">Amaze UI</a>
            </td>
            <td class="mail-subject"><a href="mail_detail.html">Amaze UI Beta2 发布</a>
            </td>
            <td class=""></td>
            <td class="text-right mail-date">上午10:57</td>
        </tr>
        <tr class="read">
            <td class="check-mail">
                <input type="checkbox" class="i-checks">
            </td>
            <td class="mail-ontact"><a href="mail_detail.html">WordPress</a> <span class="label label-warning pull-right">验证邮件</span>
            </td>
            <td class="mail-subject"><a href="mail_detail.html">wp-user-frontend-pro v2.1.9</a>
            </td>
            <td class=""></td>
            <td class="text-right mail-date">上午9:21</td>
        </tr>
        <tr class="read">
            <td class="check-mail">
                <input type="checkbox" class="i-checks">
            </td>
            <td class="mail-ontact"><a href="mail_detail.html">淘宝网</a>
            </td>
            <td class="mail-subject"><a href="mail_detail.html">史上最全！淘宝双11红包疯抢攻略！</a>
            </td>
            <td class=""></td>
            <td class="text-right mail-date">中午12:24</td>
        </tr>
        <tr class="read">
            <td class="check-mail">
                <input type="checkbox" class="i-checks">
            </td>
            <td class="mail-ontact"><a href="mail_detail.html">淘宝网</a> <span class="label label-danger pull-right">AD</span>
            </td>
            <td class="mail-subject"><a href="mail_detail.html">亲，双11来啦！帮你挑货，还送你4999元红包！仅此一次！</a>
            </td>
            <td class=""><i class="fa fa-paperclip"></i>
            </td>
            <td class="text-right mail-date">上午6:48</td>
        </tr>
        <tr class="read">
            <td class="check-mail">
                <input type="checkbox" class="i-checks">
            </td>
            <td class="mail-ontact"><a href="mail_detail.html">支付宝</a>
            </td>
            <td class="mail-subject"><a href="mail_detail.html">支付宝提醒</a>
            </td>
            <td class=""><i class="fa fa-paperclip"></i>
            </td>
            <td class="text-right mail-date">昨天 10:20</td>
        </tr>
        <tr class="read">
            <td class="check-mail">
                <input type="checkbox" class="i-checks">
            </td>
            <td class="mail-ontact"><a href="mail_detail.html">Amaze UI</a>
            </td>
            <td class="mail-subject"><a href="mail_detail.html">Amaze UI Beta2 发布</a>
            </td>
            <td class=""></td>
            <td class="text-right mail-date">上午10:57</td>
        </tr>
        <tr class="read">
            <td class="check-mail">
                <input type="checkbox" class="i-checks">
            </td>
            <td class="mail-ontact"><a href="mail_detail.html">WordPress</a> <span class="label label-warning pull-right">验证邮件</span>
            </td>
            <td class="mail-subject"><a href="mail_detail.html">wp-user-frontend-pro v2.1.9</a>
            </td>
            <td class=""></td>
            <td class="text-right mail-date">上午9:21</td>
        </tr>
        <tr class="read">
            <td class="check-mail">
                <input type="checkbox" class="i-checks">
            </td>
            <td class="mail-ontact"><a href="mail_detail.html">淘宝网</a>
            </td>
            <td class="mail-subject"><a href="mail_detail.html">史上最全！淘宝双11红包疯抢攻略！</a>
            </td>
            <td class=""></td>
            <td class="text-right mail-date">中午12:24</td>
        </tr>
        <tr class="read">
            <td class="check-mail">
                <input type="checkbox" class="i-checks">
            </td>
            <td class="mail-ontact"><a href="mail_detail.html">淘宝网</a> <span class="label label-danger pull-right">AD</span>
            </td>
            <td class="mail-subject"><a href="mail_detail.html">亲，双11来啦！帮你挑货，还送你4999元红包！仅此一次！</a>
            </td>
            <td class=""><i class="fa fa-paperclip"></i>
            </td>
            <td class="text-right mail-date">上午6:48</td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>