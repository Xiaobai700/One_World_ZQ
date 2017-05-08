<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/3/21
  Time: 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--bootstrap-->
    <script type="text/javascript" src="static/js/jquery.min.js"></script>
    <!-- 重要！不在线引入就会出现各种各样奇葩的问题 -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <script type="text/javascript" src="static/js/bootstrap.min.js"></script>
    <!-- 钟 -->
    <script type="text/javascript" src="static/js/bootstrap-clockpicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="static/css/bootstrap-clockpicker.min.css">
    <!-- 日期 -->
    <link rel="stylesheet" href="../../static/css/pikaday.css">
    <!--引入主页的css样式文件-->
    <link href="../../static/css/index_style.css" rel="stylesheet">
    <!--引入导航的css样式文件-->
    <link href="../../static/css/dao_hang_style.css" rel="stylesheet">
    <link href="../../static/css/ionicons.css" rel="stylesheet">
    <%--H+的相关样式--%>

    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!--引入主页的js文件-->
    <script src="../../static/js/index_js.js"></script>
    <script src="../../static/js/layer/2.1/layer.js"></script>
    <script type="text/javascript" src="../../client/js/addAppAndDiscussFunction.js"></script>
    <script type="text/javascript" charset="utf-8" src="../../static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../../static/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"	src="../../static/ueditor/lang/zh-cn/zh-cn.js"></script>
    <title>新增约伴活动页面</title>
    <style>
        .zqChoose{
            float: left;
            margin-top: 5px;
            margin-left: 7px;
        }
    </style>
</head>
<body>
<div  tabindex="-1" <%--style="height:640px; overflow:scroll;z-index:999;"--%>>
                <div class="" style="float: left;width:15%;height: 100px;margin-top: 10px;margin-left: 10px;">
                    <span><img src="head/${userInfo.head }" style="width: 60px;height: 60px;border-radius: 30px;" /></span><br />
                    <span style="margin-top: 6px;font-size: smaller;">${userInfo.nickName }</span>
                    <span style="margin-top: 6px;font-size: smaller;">${userInfo.job }</span><br />
                    <span style="margin-left: 15px;color: palevioletred;"class="gender ion-female"></span>
                    <span style="margin-left: 1px;font-size: smaller;"> ${userInfo.age } </span><br />
                </div>
                <!--活动要求-->
                <div class="huodong_yq zqChoose" style="width: 83%;height: 130px;">
                    <!-- kssj 开始时间 -->
                    <input type="text" placeholder="开始时间" id="datepicker" class="form-control zqChoose kssj " style="width:300px;">
                    <!--开始时间更具体 -->
                    <div class="input-group zqChoose clockpicker" data-placement="left" style="float:left;width:20%;"data-align="top" data-autoclose="true">
                        <input type="text" placeholder="精确时间" class="form-control" id="jqsj"  style="width:90px;">
                        <span class="input-group-addon" style="float:left;height:34px;width:30px;padding-right: 24px;padding-top: 10px;">
        				<span class="glyphicon glyphicon-time"></span>
    					</span>
                    </div>
                    <script type="text/javascript">
                        $('.clockpicker').clockpicker();
                    </script>
                    <input type="text" id="duration" placeholder="持续时间"class="form-control zqChoose" style="width: 90px;">
                    <%--<input type="text" id="count"placeholder="人数"class="form-control zqChoose" style="width: 90px;">--%>
                    <input type="text" id="site"placeholder="地点"class="form-control zqChoose" style="width: 130px;">
                        <select class="form-control zqChoose" id="sex_restrict" style="width: 150px;">
                            <option value="-1">请选择性别要求</option>
                            <option value="男生">男生</option>
                            <option value="女生">女生</option>
                            <option value="男女不限">男女不限</option>
                        </select>
                        <select class="form-control zqChoose" style="width: 150px;">
                            <option value="-1">请选择活动类型</option>
                            <c:forEach var="appType" items="${appTypes}">
                                <option value=${appType.id}>${appType.typeName}</option>
                            </c:forEach>
                        </select>
                    <%--</div>--%>
                    <input type="text" id="theme"placeholder="活动主题"class="form-control" style="width: 180px;margin-top:5px;float: left;margin-left: 9px;">
                </div>
                <div class="wbbjq" style="float: left;width: 100%;padding-left:40px;">
                    <script id="editor" type="text/plain"style="width: 750px; height: 300px;">
                    </script>
                    <button type="button" onclick="add_app()" class="btn btn-primary yueban_btn">发起活动</button>
                </div>
</div>
<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');

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
<script type=text/javascript>
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
<script src="../../static/js/pikaday.js"></script>
<script>
    var disable = false, icpker = new Pikaday({
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
