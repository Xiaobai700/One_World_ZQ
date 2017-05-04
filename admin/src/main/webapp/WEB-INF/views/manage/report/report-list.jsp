<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/3/10
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>举报列表</title>
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
                    <select class="form-control" id="reportType" style="width: 450px;">
                        <option value="-1">请选择</option>
                        <option value="1">色情低俗</option>
                        <option value="2">政治敏感</option>
                        <option value="3">违法</option>
                        <option value="4">广告</option>
                        <option value="5">病毒木马</option>
                        <option value="6">其他</option>
                    </select>
                    <select class="form-control" id="currentState" style="width: 200px;">
                        <option value="-1">请选择</option>
                        <option value="0">未处理</option>
                        <option value="1">已处理</option>
                    </select>
                </div>
                <div class="ibox-content">

                    <table class="table table-striped table-bordered table-hover dataTables-example">
                        <thead>
                        <tr>
                            <th>举报类型</th>
                            <th>举报理由</th>
                            <th>举报时间</th>
                            <th>状态</th><!--已处理还是未处理-->
                            <th>操作</th><!--如果是已处理就显示什么操作  未处理就显示处理方式的链接-->
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                        <tfoot>
                        <tr>
                            <th>举报类型</th>
                            <th>举报理由</th>
                            <th>举报时间</th>
                            <th>状态</th><!--已处理还是未处理-->
                            <th>操作</th><!--如果是已处理就显示什么操作  未处理就显示处理方式的链接-->
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
<script type="text/javascript" src="../../static/js/plugins/layer/layer/2.1/layer.js"></script>
<script src="../function/report-function.js"></script>
<script>
    $(document).ready(function(){$(".dataTables-example").dataTable();var oTable=$("#editable").dataTable();oTable.$("td").editable("http://www.zi-han.net/theme/example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);oTable.fnUpdate(sValue,aPos[0],aPos[1])},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("id"),"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"})});function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"])};
</script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

</body>
</html>
