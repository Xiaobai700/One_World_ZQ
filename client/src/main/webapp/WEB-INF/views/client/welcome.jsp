<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--引入欢迎页面的css样式文件-->
    <link href="../static/css/index_style.css" rel="stylesheet">
    <!--引入导航的css样式文件-->
    <link href="../static/css/dao_hang_style.css" rel="stylesheet">

    <!--bootstrap-->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script src="../static/js/jquery-2.2.4.min.js"></script>
    <script src="../static/js/bootstrap.min.js"></script>

    <!--引入主页的js文件-->
    <script src="../static/js/index_js.js"></script>
    <script src="../static/js/layer/2.1/layer.js"></script>
    <title>欢迎页面</title>
</head>
<body style="background-color: white;">
<header>
    <!--通栏导航部分-->
    <nav>
        <div class="dh_div_1">
            <div class="dh_div_left">
                <!--同行Logo-->
                <div class="dh_div_logo">
                    <img src="img/logo.png">
                </div>
            </div>

            <!--右边的菜单-->
            <div class="dh_div_right">
                <ul class="ul_first">
                    <li class="li_cai_dan"><a href="index.do"><div class="cai_dan">首页</div></a></li>
                    <li class="li_cai_dan"><a href="allShares.do"><div class="cai_dan">分享</div></a></li>
                    <li class="li_cai_dan"><a href="welcome.do"><div class="cai_dan" style="background-color:#F47A7A;">欢迎</div></a></li>
                    <li class="li_cai_dan"><a href="discussPageNew.do"><div class="cai_dan">职业讨论</div></a></li>
                    <li class="li_cai_dan"><a href="allyueban.do"><div class="cai_dan">约伴</div></a></li>
                    <li style="width: 30px;"><a data-toggle="modal" data-target=".login">登陆</a></li>
                    <li style="width: 30px;" class="zhu_ce"><a data-toggle="modal" data-target=".sign">注册</a></li>
                    <li style="width: 90px;"><a>发起活动</a>
                        <ul class="hd">
                            <li><a>活动约伴</a></li>
                            <li><a>行业交流</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<div class="main">
    <div class="wel_main_1">
        <div class="row">
            <div class="col-md-4 wel_tp">
                <img src="img/pic_iphone.png">
            </div>
            <div class="col-md-8 wel_right">
                <ul class="media-list">
                    <li class="media">
                        <a class="media-left" href="#">
                            <img src="img/logo7.jpg" alt="logo">
                        </a>
                        <div class="media-body">
                            <h3 class="media-heading">同行网</h3>
                            <h4>国内首个集约伴，职业交流为一体的网站</h4>
                            <div style="width: 370px;">
                                <p style="width: 370px;color:darkgray;">同行网是个社交同行交流APP,旨在为孤单一人和对职场有困惑的年轻人搭建一个约伴交流平台</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="wel_main_3">
        <div class="jia_ru">
            <span><img src="img/1.jpg" /></span>
            <span class="title_words">正在进行的讨论</span>
            <span><img src="img/2.jpg" /></span>
        </div>
        <!--按热度显示的讨论信息-->
        <div class="row" style="background-color: #F4F3F1;margin-top: 30px;margin-left: 15px;">
            <div class="col-md-4">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 img-content">
                            <div class="img-circle"></div>
                            <img src="img/yb_2.jpg" class="img-circle img1" />
                            <img src="img/fx_11.jpg" class="img-circle"/>
                            <img src="img/tx_7.jpeg" class="img-circle"/>
                            <img src="img/fx_11.jpg" class="img-circle"/>
                            <img src="img/fx_12.png" class="img-circle"/>
                            <img src="img/fx_9.jpg" class="img-circle"/>
                            <div class="mycircle img-circle">
                                大专生的职业道路应该怎么走？
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 img-content">
                            <div class="img-circle"></div>
                            <img src="img/tx_12.jpg" class="img-circle img1" />
                            <img src="img/tx_7.jpeg" class="img-circle"/>
                            <img src="img/tx_8.jpg" class="img-circle"/>
                            <img src="img/tx_9.jpg" class="img-circle"/>
                            <img src="img/tx_10.jpeg" class="img-circle"/>
                            <img src="img/tx_11.jpg" class="img-circle"/>
                            <div class="mycircle img-circle">
                                职业规划应该选兴趣还是选未来应该如何选择？
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 img-content">
                            <div class="img-circle"></div>
                            <img src="img/tx_1.jpg" class="img-circle img1" />
                            <img src="img/tx_2.jpg" class="img-circle"/>
                            <img src="img/tx_3.jpg" class="img-circle"/>
                            <img src="img/tx_4.jpg" class="img-circle"/>
                            <img src="img/tx_5.jpg" class="img-circle"/>
                            <img src="img/tx_6.jpg" class="img-circle"/>
                            <div class="mycircle img-circle">
                                会计的职业规划是怎样的？
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!---->

        <!---->
    </div>
    <div class="wel_main_2">
        <!--你要来加入吗？-->
        <div class="jia_ru">
            <span><img src="img/1.jpg" /></span>
            <span class="title_words">他们在约伴</span>
            <span><img src="img/2.jpg" /></span>
        </div>
        <div class="container_x">
            <div class="t_3d">
                <a href="#" class="back"><img src="img/fx_5.jpg" /></a>
                <a href="#" class="front"><img src="img/fx_6.png"/></a>

            </div>

            <div class="t_3d">
                <div class="t_zi">
                    <div class="wel_zi_1">九月去欧洲有同行的吗？</div>
                    <hr style="width: 185px;color: slategray;margin-top: 10px;margin-bottom: 10px;" />
                    <div class="wel_zi_2">张磊 &nbsp; 24岁</div>
                </div>
            </div>

            <div class="t_3d">
                <a href="#" class="back"><img src="img/fx_7.png" /></a>
                <a href="#" class="front"><img src="img/fx_9.jpg" /></a>

            </div>

            <div class="t_3d">
                <div class="t_zi">
                    <div class="wel_zi_1">中午吃饭求拼桌！</div>
                    <hr style="width: 185px;color: slategray;margin-top: 10px;margin-bottom: 10px;" />
                    <div class="wel_zi_2">七百 &nbsp; 24岁</div>
                </div>
            </div>

        </div>
    </div>
</div>
<footer style="background-color: #E5E5E5;">
    <div>
        <ul>
            <li>联系作者:1053373312@qq.com</li>
            <li class="feedBack" onclick="feedBackPage('反馈信息','feedBack.html')">反馈</li>
        </ul>
    </div>
</footer>
<!-- 登陆的模态框 -->
<div class="modal fade login" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="login">登陆</h4>
            </div>
            <!--  <form action="/One_World/userLogin.do" method="post"> -->
            <div class="modal-body">
                <input type="text" class="form-control" id="account" name="account" placeholder="输入账号">&nbsp;
                <input type="password" class="form-control" id="password" name="password"placeholder="输入密码">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="submit" class="btn btn-primary dl">登陆</button>
            </div>
            <!--      </form> -->
        </div>
    </div>
</div>
<!--注册的模态框-->
<div class="modal fade sign" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="sign">注册</h4>
            </div>
            <div class="modal-body">
                <input type="text" class="form-control" id="zc_account" placeholder="输入账号，您的手机号">&nbsp;
                <input type="password" class="form-control" id="zc_password"placeholder="输入密码，6位">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary zc">注册</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    //登陆
    $(".dl").click(function(){
        $.ajax({
            url:"userLogin.action",
            type:"post",
            data:{
                account:$("#account").val(),
                password:$("#password").val()
            },
            success:function(data){
                var dataObj=eval("("+data+")");
                if(dataObj.code == 1){
                    layer.msg(dataObj.msg,{time:2000});
                    window.location.href="index.do";
                }else{
                    layer.msg(dataObj.msg,{time:6000});
//                    window.location.href="welcome.do";
                }
            },
            error:function(data){

            }
        });
    });
    //注册
    $(".zc").click(function(){
        $.ajax({
            url:"userRegist.action",
            type:"post",
            dataType:"json",
            data:{
                account:$("#zc_account").val(),
                password:$("#zc_password").val()
            },
            success:function(data){
                if(data.code == 2){
                    layer.msg("注册成功直接登陆",{time:3000});
                    window.location.href="index.do";
                }else{
                    layer.msg(data.msg);
                }
            },
            error:function(data){
                layer.msg("注册失败");
                window.location.href="welcome.do";
            }
        });
    });
</script>
</body>
</html>