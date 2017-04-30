<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/4/26
  Time: 9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WebSocket/SockJS Echo Sample (Adapted from Tomcat's echo sample)</title>
    <script type="text/javascript" src="../static/js/jquery.min.js?v=2.1.4"></script>
</head>
<script type="text/javascript">
    var ws;
    function hello(){
        ws = new WebSocket("ws://localhost:8080/hello");
        ws.onopen = function(evn){
            console.log("就是这个信息："+evn.toString());
        };
        /*负责接收后台信息*/
        ws.onmessage = function(evn){
            console.log(evn.data);
            var dv = document.getElementById("dv");
            dv.innerHTML+=evn.data;
        };
        ws.onclose = function(){
            console.log("关闭");
        };

    };
    function subsend(){
        var msg = document.getElementById("msg").value;
        /*这个信息发送到后端 但是如果我要发送的信息不是前端页面输入的呢*/
        ws.send(msg);
        document.getElementById("msg").value = "";
    }
</script>
<body>
<h2>Hello World!</h2>
<div id="dv" />
<input type="button" value="连接" onclick="hello()" />
<input type="text" id ="msg" /><input type="button" onclick="subsend()" value="发送" />
</body>
</html>
