<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/5/10
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script type="text/javascript" src="../static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../../static/js/layer/2.1/layer.js"></script>
    <title>反馈</title>
</head>
<body>
<div style="text-align: center;">
    <h2>感谢您的反馈，我们非常需要！</h2>
    <textarea class="form-control" id="content"></textarea>
    <button class="btn-info" onclick="sendFeedBack()">发送</button>
</div>
<script type="text/javascript">
    function sendFeedBack() {
        var content = $("#commentContent").val();
        if(content.trim() == ""){
            layer.msg("请填写内容！");
        }else {
            $.ajax({
                url: "feedBack.action",
                type: "post",
                data: {
                    feedBackContent:content
                },
                success: function (data) {
                    if (data.code == 0) {
                        layer.msg("反馈成功！");
                        window.location.reload();
                    }
                }
            });
        }
    }
</script>
</body>
</html>
