<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/3/10
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>用户列表</title>
    <meta name="keywords" content="同行网管理后台">
    <meta name="description" content="同行网欢迎大家加入！">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="../../static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="../../static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="../../static/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="../../static/css/animate.min.css" rel="stylesheet">
    <link href="../../static/css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>基本 <small>分类，查找</small></h5>

                </div>
                <div class="ibox-content">
                    <table id="table" class="table table-border table-bordered table-bg">
                        <thead>
                        <tr>
                            <th>用户昵称</th>
                            <th>用户积分</th>
                            <th>用户性别</th>
                            <th>用户年龄</th>
                            <th>用户住址</th>
                            <th>用户职业</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                        <tfoot>
                        <tr>
                            <th>用户昵称</th>
                            <th>用户积分</th>
                            <th>用户性别</th>
                            <th>用户年龄</th>
                            <th>用户住址</th>
                            <th>用户职业</th>
                            <th>操作</th>
                        </tr>
                        </tfoot>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../../static/js/plugins/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../../static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../static/js/plugins/jeditable/jquery.jeditable.js"></script>
<script type="text/javascript" src="../../static/js/plugins/dataTables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../../static/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="../../static/js/content.min.js?v=1.0.0"></script>
<script type="text/javascript" src="../function/user-function.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

</body>
</html>
