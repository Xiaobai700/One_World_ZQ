<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/5/1
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>所有消息</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link href="../../static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <%--<link href="../../static/css/plugins/iCheck/custom.css" rel="stylesheet">--%>
    <link href="../../static/css/animate.min.css" rel="stylesheet">
    <link href="../../static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <script type="text/javascript" src="../../static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../../static/js/layer/2.1/layer.js"></script>
</head>
<body>
<input type="hidden" value="${account}" id="account">
<div class="col-sm-9 animated fadeInRight">
    <div class="mail-box-header">
        <h2>
            我的消息 (${index.total})
        </h2>
        <div class="mail-tools tooltip-demo m-t-md">
            <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" title="刷新消息列表"><i class="fa fa-refresh"></i> 刷新</button>
            <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="删除消息" onclick="batchDeleteMessage()"><i class="fa fa-trash-o"></i>
            </button>

        </div>
    </div>
    <div class="mail-box">
        <table class="table table-hover table-mail" width="100%">
            <tbody>
            <%--未读消息--%>
            <c:forEach var="unRead" items="${index.unRead}">
                <tr class="unread">
                    <td class="check-mail">
                        <input name="choice"type="checkbox" class="i-checks" value="${unRead.message.id}">
                    </td>
                    <c:if test="${unRead.message.type == 1}">
                        <td class="mail-ontact">通知类消息
                        </td>
                    </c:if>
                    <c:if test="${unRead.message.type == 0}">
                        <td class="mail-ontact">系统消息
                        </td>
                    </c:if>
                    <td class="mail-subject"><a href="mail_detail.html">${unRead.message.content}</a>
                    </td>
                    <td class="">${unRead.unReadTime}</td>
                    <td class=""><span class="glyphicon glyphicon-trash" onclick="deleteMessage('${unRead.message.id}')"></span></td>
                </tr>
            </c:forEach>


            <%--已读消息--%>
            <c:forEach var="read" items="${index.read}">
                <tr class="read">
                    <td class="check-mail">
                        <input name="choice" type="checkbox" class="i-checks" value="${read.message.id}">
                    </td>
                    <c:if test="${read.message.type == 1}">
                        <td class="mail-ontact">通知类消息
                        </td>
                    </c:if>
                    <c:if test="${read.message.type == 0}">
                        <td class="mail-ontact">系统消息
                        </td>
                    </c:if>
                    <td class="mail-subject"><a href="mail_detail.html">${read.message.content}</a>
                    </td>
                    <td class="text-right mail-date">${read.readTime}</td>
                    <td class=""><span class="glyphicon glyphicon-trash" onclick="deleteMessage('${read.message.id}')"></span></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript">
    function deleteMessage(id) {
        if($("#account").val() == "") {
            layer.msg("你还未登陆,请先登陆!");
        }else {
            layer.confirm("你确定要删除吗？",function () {
                $.ajax({
                    url:"deleteMessage.action",
                    type:"post",
                    data:{
                        id:id
                    },
                    success:function(data){
                        layer.msg(data.msg,{time :2000});
                        if(data.code == 0){
                            window.location.reload();
                        }
                    }
                });
            });
        }
    }
    function batchDeleteMessage() {
        var ids = null;
        $("input[name='choice']:checkbox").each(function(){
            if($(this).prop("checked")){
                if (ids == null){
                    ids = $(this).val();
                }else{
                    ids += ','+ $(this).val();
                }
            }
        });
        if($("#account").val() == "") {
            layer.msg("你还未登陆,请先登陆!");
        }else {
            if(ids == null){
                layer.msg("至少选择一条数据！");
            }
            layer.confirm("你确定要全部删除吗？",function () {
                $.ajax({
                    url:"batchDeleteMessage.action",
                    type:"post",
                    data:{
                        idString:ids
                    },
                    success:function(data){
                        layer.msg(data.msg,{time :2000});
                        if(data.code == 0){
                            window.location.reload();
                        }
                    }
                });
            });
        }

    }
</script>
</body>
</html>
