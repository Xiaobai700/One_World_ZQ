<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/5/11
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>同行网 - 注册</title>
<link href="../static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="../static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

<link href="../static/css/animate.min.css" rel="stylesheet">
<link href="../static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
<!--[if lt IE 9]>
<meta http-equiv="refresh" content="0;ie.html" />
<![endif]-->
<script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name"><img src="../img/logo.png"></h1>
        </div>
        <h3>欢迎注册</h3>

        <%--<form class="m-t" role="form" action="http://www.zi-han.net/theme/hplus/index.html">--%>
        <div class="form-group">
            <input type="text" class="form-control" id="account" placeholder="用户名" required="">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" id="password" placeholder="密码" required="">
        </div>
        <button class="btn btn-primary block full-width m-b" onclick="regist()">注册</button>


        <p class="text-muted text-center"></p>

        <%--</form>--%>
    </div>
</div>
<script src="../static/js/jquery.min.js?v=2.1.4"></script>
<script src="../static/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<script type="text/javascript" src="../static/js/layer/2.1/layer.js"></script>
<script type="text/javascript">
    function regist() {
        var account = $("#account").val();
        var password = $("#password").val();
        if(account.trim == ""){
            layer.msg("账号不可为空！");
        }else if(password.trim == ""){
            layer.msg("密码不可为空！");
        }else {
            $.ajax({
                url:"userRegist.action",
                type:"post",
                dataType : 'json',
                data:{
                    account:account,
                    password:password
                },
                success:function(data){
                    if(data.code == 2){
                        layer.msg("注册成功直接登陆");
                        window.location.href="index.do";
                    }else{
                        layer.msg(data.msg);
                    }
                },
                error:function(data){
                    layer.msg("注册失败");
                    window.location.href="register.do";
                }
            });
        }
    }
</script>
</body>
<!-- Mirrored from www.zi-han.net/theme/hplus/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:18:23 GMT -->
</html>