<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/3/17
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>约伴活动类型列表</title>
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
                    <button type="button" class="btn btn-outline btn-info"data-toggle="modal" data-target="#addAppType">添加活动类型</button>
                    <div class="modal inmodal" id="addAppType" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content animated flipInY">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                    <h5 class="modal-title">新增活动类型</h5>
                                </div>
                                <div class="modal-body">
                                    <div class="ibox-content">
                                        <form class="form-horizontal m-t" id="commentForm">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">类型名称：</label>
                                                <div class="col-sm-8">
                                                    <input id="type_name" name="name" type="text" class="form-control" required="" aria-required="true">
                                                    <div class="tips"></div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-4 col-sm-offset-3">
                                                    <button class="btn btn-primary" type="submit" id="save" onclick="addAppType()">提交</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                    <%--<button type="button" class="btn btn-primary">保存</button>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ibox-content">
                    <table class="table table-striped table-bordered table-hover dataTables-example">
                        <thead>
                        <tr>
                            <th>类型名称</th>
                            <th>关注人数</th>
                            <th>创建时间</th>
                            <th>更新时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                        <tfoot>
                        <tr>
                            <th>类型名称</th>
                            <th>关注人数</th>
                            <th>创建时间</th>
                            <th>更新时间</th>
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
<%--<script type="text/javascript" src="../../static/js/jquery.min.js"></script>--%>
<script type="text/javascript" src="../../static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../static/js/plugins/jeditable/jquery.jeditable.js"></script>
<script type="text/javascript" src="../../static/js/plugins/dataTables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../../static/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="../../static/js/content.min.js?v=1.0.0"></script>
<%--<script src="../../static/js/plugins/validate/jquery.validate.min.js"></script>--%>
<%--<script src="../../static/js/plugins/validate/messages_zh.min.js"></script>--%>
<%--<script src="../../static/js/demo/form-validate-demo.min.js"></script>--%>
<script type="text/javascript" src="../function/appType-function.js"></script>
<script src="../../static/js/plugins/layer/layer.min.js"></script>
<script>
    $(document).ready(function(){$(".dataTables-example").dataTable();var oTable=$("#editable").dataTable();oTable.$("td").editable("http://www.zi-han.net/theme/example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);oTable.fnUpdate(sValue,aPos[0],aPos[1])},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("id"),"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"})});function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"])};
</script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

</body>

</html>
