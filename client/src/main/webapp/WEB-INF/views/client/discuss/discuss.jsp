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
    <link href="static/css/index_style.css" rel="stylesheet">
    <!--引入导航的css样式文件-->
    <link href="static/css/dao_hang_style.css" rel="stylesheet">
    <link href="static/css/ionicons.css" rel="stylesheet">
    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

    <!--bootstrap-->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script src="static/js/jquery-2.2.4.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
	<!-- 钟 -->
    <script type="text/javascript" src="static/js/bootstrap-clockpicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="static/css/bootstrap-clockpicker.min.css">
	<!-- 日期 -->
    <link rel="stylesheet" href="static/css/pikaday.css">
    <!--引入主页的js文件-->
    <script src="static/js/index_js.js"></script>
    <!-- 文本编辑器 -->
    <script type="text/javascript" charset="utf-8" src="./ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="./ueditor.all.min.js"></script>
	<script type="text/javascript" charset="utf-8"	src="./lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript">
	 $(function(){
		 $(".pagination .myPage a").click(function(){
			 var page = $(this).html();
			 $.ajax({
				 url : "page1.do",
				 type : "post",
				 data : {
				     page : page
				 },
				 dataType : "json",
				 success : function(data) {//回调函数
					 $(".zy_tl_main_1_you_content").empty();//清除原有记录
					 $.each(data,function(index,value){
						      var discuss = '<div class="one">'+
								 '<div class="small_tx_div">'+
								 '<a><img class="small_tx" src="head/'+value.head+'" /></a>'+
								 ' </div>'+
								 '<div class="tl_bt">'+
								 '<a href="#"><p>'+value.title+'</p></a>'+
								 '</div>'+
								 '<div  class="tl_bt_hd">'+
								 '<span>'+value.times+'个回答</span><br />'+
								 '<span>'+value.time+'</span>'+
								 ' </div>'+
			                '</div>';
			                $(".zy_tl_main_1_you_content").append(discuss);  //将超链接添加到div中  
					 })
				 }
			 });
			return false;
		 });
	 });
	</script>
    <title>所有讨论</title>
</head>
<body>
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
                         <a class="tx_gr" href="mySpace.do"><img src="head/${userInfo.head}"></a>
                    </div>
                </div>
            </div>

            <!--右边的菜单-->
            <div class="dh_div_right">
                <ul class="ul_first">
                    <li class="li_cai_dan"><a href="index.do"><div class="cai_dan">首页</div></a></li>
                    <li class="li_cai_dan"><a href="allShares.do"><div class="cai_dan">分享</div></a></li>
                    <li class="li_cai_dan"><a href="welcome.do"><div class="cai_dan">欢迎</div></a></li>
                    <li class="li_cai_dan"><a href="allDiscuss.do"><div class="cai_dan" style="background-color:#F47A7A;">职业讨论</div></a></li>
                    <li class="li_cai_dan"><a href="allyueban.do"><div class="cai_dan">约伴</div></a></li>
                    <!-- <li style="width: 30px;"><a>登陆</a></li>
                    <li style="width: 30px;" class="zhu_ce"><a>注册</a></li> -->
                    <li style="width: 90px;"><a>发起活动</a>
                        <ul class="hd">
                            <li><a data-toggle="modal" data-target=".yueban">活动约伴</a></li>
                                <li><a data-toggle="modal" data-target="#myTalk">行业交流</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<div class="zy_tl_main">
    <div class="zy_tl_main_0">
        <strong style="font-size: 20px;color: white;">广场</strong>
    </div>
    <div class="zy_tl_main_1">
        <div class="zy_tl_main_1_zuo">
            <!--检索标准-->
            <a href="discussPageNew.do"><span id="an_shijian" class="${color_1 }">按时间</span></a><br />
            <a href="discussPageTimes.do"><span id="an_redu" class="${color_2}">按热度</span></a>
        </div>
        <div class="zy_tl_main_1_you">
        <div class="zy_tl_main_1_you_content">
        <c:forEach var="discusses1" items="${discusses}">
                <div class="one">
                    <div class="small_tx_div">
                        <a><img class="small_tx" src="head/${discusses1.get(0).head }" /></a>
                    </div>
                    <!--讨论标题-->
                    <div class="tl_bt">
                        <a href="talksDetails.do?id=${discusses1.get(1).id }&user_account=${discusses1.get(1).asker_account}"><p>${discusses1.get(1).discuss_title }</p></a>
                    </div>
                    <div  class="tl_bt_hd">
                        <span>${discusses1.get(1).answer_times }个回答</span><br />
                        <span>${discusses1.get(2) }</span>
                    </div>
                </div>
        </c:forEach>
        </div>
        <div class="one">
         <!-- 导航区域开始 -->
				 <ul class="pagination">
				 		<li class="disabled"><a href="#" aria-label="Previous">
				 		 <span aria-hidden="true">&laquo;</span>
				 		</a></li>
				 		<c:forEach var="x" begin="1" end="${pages}" step="1">
				 			<li class="myPage"><a href="#">${x}</a></li>
				 		</c:forEach>
				 		<li class="page"><a href="#" aria-label="Next"> 
				 		<span aria-hidden="true">&raquo;</span>
				 		</a></li>
				 </ul>
        <!-- 导航区域结束 -->
        </div>
        </div>
        
    </div>
</div>
<footer>
    <div>
        <br />
        <p style="text-align: center;">南京工业职业技术学院计算机与软件学院</p>
    </div>
</footer>
<!--发起讨论活动的模态框-->
<div class="modal fade" id="myTalk" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="talk">职业交流</h4>
            </div>
            <div class="modal-body" style="padding: 0px;">
                <div class="" style="float: left;width:10%;height: 100px;margin-top: 10px;margin-left: 10px;">
                    <span><img src="head/${userInfo.head }" style="width: 60px;height: 60px;border-radius: 30px;" /></span><br />
                    <span style="margin-top: 6px;font-size: smaller;">七百</span>
                    <span style="margin-top: 6px;font-size: smaller;">程序员</span><br />
                    <span style="margin-left: 1px;color: palevioletred;"class="gender ion-female"></span>
                    <span style="margin-left: 1px;font-size: smaller;">24岁</span><br />
                </div>
                <div style="float: left;width: 88%;">
                    <input type="text" id="discuss_title" placeholder="输入问题" class="form-control">
                    <textarea id="question_describe" placeholder="输入问题描述" class="form-control"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary discuss_btn">发起活动</button>
            </div>
        </div>
    </div>
</div>
<!--发起约伴活动的模态框-->
<div class="modal fade yueban" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="height:640px; overflow:scroll;z-index:999;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="yueban">活动约伴</h4>
            </div>
            <div class="modal-body" style="padding: 0px;">
                <div class="" style="float: left;width:15%;height: 100px;margin-top: 10px;margin-left: 10px;">
                    <span><img src="head/${userInfo.head }" style="width: 60px;height: 60px;border-radius: 30px;" /></span><br />
                    <span style="margin-top: 6px;font-size: smaller;">${userInfo.nickName }</span>
                    <span style="margin-top: 6px;font-size: smaller;">${userInfo.job }</span><br />
                    <span style="margin-left: 15px;color: palevioletred;"class="gender ion-female"></span>
                    <span style="margin-left: 1px;font-size: smaller;"><%-- ${userInfo.age } --%></span><br />
                </div>
                <!--活动要求-->
                <div class="huodong_yq" style="float: left;width: 83%;height: 130px;margin-top:5px;">
                <!-- kssj 开始时间 -->
                    <input type="text" placeholder="开始时间" id="datepicker" class="form-control kssj" style="width:300px;float:left;">
                    <!--开始时间更具体 -->
                    <div class="input-group clockpicker" data-placement="left" style="float:left;width:20%;"data-align="top" data-autoclose="true">
   						<input type="text" placeholder="精确时间" class="form-control" id="jqsj"  style="width:90px;">
    					<span class="input-group-addon" style="float:left;height:34px;width:30px;padding-right: 24px;padding-top: 10px;">
        				<span class="glyphicon glyphicon-time"></span>
    					</span>
					</div>
						<script type="text/javascript">
						$('.clockpicker').clockpicker();
						</script>
						<input type="text" id="duration" placeholder="持续时间"class="form-control" style="width: 90px;margin-left: 9px;float: left;">
	                    	<input type="text" id="count"placeholder="人数"class="form-control" style="width: 90px;margin-left: 9px;float:left;">
	                    	<input type="text" id="site"placeholder="地点"class="form-control" style="width: 90px;margin-left: 9px;">
	                    	<div class="btn-group" style="float:left;margin-left:9px;margin-top:5px;">
		                        <button type="button" class="btn btn-success sex_restrict" >男女要求</button>
		                        <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
		                            <span class="caret"></span>
		                            <span class="sr-only">Toggle Dropdown</span>
		                        </button>
		                        <ul class="dropdown-menu sex" role="menu">
		                            <li name="男生"><a href="#">男生</a></li>
		                            <li name="女生"><a href="#">女生</a></li>
		                            <li name="男女不限"><a href="#">男女不限</a></li>
		                        </ul>
	                    	</div>
	                    	 <input type="text" id="theme"placeholder="活动主题"class="form-control" style="width: 180px;margin-top:5px;float: left;margin-left: 9px;">
                </div>
                <div class="wbbjq" style="float: left;width: 100%;padding-left:40px;">
                    <script id="editor" type="text/plain"style="width: 750px; height: 300px;">
			        </script>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary yueban_btn">发起活动</button>
            </div>
        </div>
    </div>
</div>
<%--ueditor脚本开始--%>
<script type="text/javascript">
    var ue = UE.getEditor('editor');

    ue.addListener("contentContent",function(){
        var content =ue.getContent();
    })
    function callback(fid) {
        $('#fids').val($('#fids').val()+fid+',');
    }
    function isFocus(e) {
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e) {
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, [ "disabled" ]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, [ "disabled" ]);
        }
    }

    function getLocalData() {
        alert(UE.getEditor('editor').execCommand("getlocaldata"));
    }

    function clearLocalData() {
        UE.getEditor('editor').execCommand("clearlocaldata");
        alert("已清空草稿箱")
    }
</script>
<%--ueditor脚本结束--%>

<script type="text/javascript">
		//发起一个约伴活动
		var sex_restrict;
		$(".sex li a").click(function(){
			sex_restrict=$(this).parent("li").attr("name");
			$(".sex_restrict").text($(this).parent("li").attr("name"));
		});
		$(".yueban_btn").click(function(){
			$.ajax({
				url:"/One_World/DoYueBan.do",
				type:"post",
				data:{
					theme:$("#theme").val(),
				    content:UE.getEditor('editor').getContent(),
				    site:$("#site").val(),
				    begin_time:$(".kssj").val(),/* 年月日 */
				    more_time:$("#jqsj").val(),/* 小时 分钟 */
				    duration:$("#duration").val(),
					sex_restrict:sex_restrict
				},
				dataType:"text",
				success:function(data){
					 window.location.href="allyueban.do"; 
				}
			});
		});
		//加入一个约伴活动
		var joinOne=$(".joined");
			if(joinOne.length>0){
				$(".joined").next().hide();
			}	
		$(".join").click(function(){
			if(confirm("确定要加入这个活动?")){
				$.ajax({
					url:"/One_World/joinApp.do",
					type:"post",
					data:{
						appointment_id:$(this).next().val()
					},
					success:function(data){
						alert(data);
						 window.location.href="index.do"; 
					}
				});
			}else{
				
			}
				
			});
		//发起一个讨论活动
		$(".discuss_btn").click(function(){
			$.ajax({
				url:"/One_World/DoDiscuss.do",
				type:"post",
				data:{
					discuss_title:$("#discuss_title").val(),
					question_describe:$("#question_describe").val()
				},
				dataType:"text",
				success:function(data){
					 window.location.href="discussPageNew.do"; 
				}
			});
		});
	//关注一个人
		var careOne=$(".attent");
			if(careOne.length>0){
				$(".attent").next().hide();
			}	
		$(".care").click(function(){
			var name = $(this).prev().val();
			if(confirm("确定要关注他?")){
				$.ajax({
					url:"/One_World/careUser.do",
					type:"post",
					data:{
						cared_account:$(this).next().val()
					},
					success:function(data){
						alert(data);
						window.location.href="index.do";
					}
				});
			}else{
				
			}
				
			});
	
		/*钟*/
				$('.clockpicker').clockpicker().find('input').change(function(){
		        // TODO：时间改变
		        console.log(this.value);
		    }
		    );
		$('#demo-input').clockpicker({
		    autoclose: true
		});
		if (something) {
		    // 手动操作（clockpicker初始化之后）
		    $('#demo-input').clockpicker('show') //或者隐藏，删除...
		            .clockpicker('toggleView', 'minutes');
		}
	</script>
<script type="text/javascript">
    alert("重要！");
    /**重要 开始*/
    UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
    UE.Editor.prototype.getActionUrl = function(action) {
        if (action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadimage') {
            return 'http://localhost:8080/upload.action';
        } else if (action == 'uploadvideo') {
            return 'http://a.b.com/video.php';
        } else {
            return this._bkGetActionUrl.call(this, action);
        }}
    /**重要 结束*/
</script>
	<!-- 日期年月日 -->
<script src="js/pikaday.js"></script>
<script>
    var disable = false, picker = new Pikaday({
        field: document.getElementById('datepicker'),
        firstDay: 1,
        minDate: new Date(2000, 0, 1),
        maxDate: new Date(2020, 12, 31),
        yearRange: [2000,2020],

        showDaysInNextAndPreviousMonths: true
    });
</script>
</body>
</html>