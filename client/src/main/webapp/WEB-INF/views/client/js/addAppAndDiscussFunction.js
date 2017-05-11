/**
 * Created by Master ZQ on 2017/3/24.
 */
// window.location.reload();
$(function () {
    toastr.options = {
        "closeButton": false, //是否显示关闭按钮
        "debug": false, //是否使用debug模式
        "positionClass": "toast-top-center",//弹出窗的位置
        "showDuration": "300",//显示的动画时间
        "hideDuration": "1000",//消失的动画时间
        "timeOut": "5000", //展现时间
        "extendedTimeOut": "1000",//加长展示时间
        "showEasing": "swing",//显示时的动画缓冲方式
        "hideEasing": "linear",//消失时的动画缓冲方式
        "showMethod": "fadeIn",//显示时的动画方式
        "hideMethod": "fadeOut" //消失时的动画方式
    };
});



/**关于websocket*/
var account = $("#account").val();
if(account !=""){
    var ws ;
    var url = "ws://localhost:8080/hello?"+account;
// ws = new WebSocket("ws://localhost:8080/hello?"+account);
    if ('WebSocket' in window) {
        ws = new WebSocket(url);
    } else if ('MozWebSocket' in window) {
        ws = new MozWebSocket(url);
    } else {
        alert('WebSocket is not supported by this browser.');
    }
    ws.onopen = function(evn){
        console.log("就是这个信息："+evn.toString());
    };
    var messageNumber = 0;
    ws.onmessage = function(evn){
        var dv = document.getElementById("dv");
        var size = document.getElementById("size");
        var underSize = document.getElementById("underSize");
        var messageDetail = document.getElementById("messageDetail");
        var informMessage = document.getElementById("informMessage");
        var systemMessage = document.getElementById("systemMessage");

        // if(evn.data != undefined){
        //         dv.innerHTML+=evn.data;
        //     }else {
        var message = JSON.parse(evn.data);
        console.log("这是全部信息message"+message);
        console.log("这是message.message"+message.message);
        console.log("这是message.systemMessage"+message.systemMessage);
        if(Array.isArray(message.message)){
            messageNumber = message.messageSize;
            // messageDetail.innerHTML = '<i class="fa fa-envelope fa-fw"></i>'+messageNumber+'条未读消息';
            $.each(message.message,function () {
               informMessage.innerHTML +="<div class='oneMessage'>"+this.content+"</div>";
            });
            size.innerHTML = message.messageSize;
            // underSize.innerHTML = messageNumber;
            $.each(message.systemMessage,function () {
                systemMessage.innerHTML +="<div class='oneMessage'>"+this.content+"</div>";
            });
        }else {
            toastr.info(message.message.content);
            messageNumber += 1;
            size.innerHTML = "";
            size.innerHTML += messageNumber;
            underSize.innerHTML ="";
            underSize.innerHTML += messageNumber;
            messageDetail.innerHTML+= "<span class='small' style='color: #5BC4C8;;'>"+message.message.sendTime+"</span><br />"+message.message.content+"<br />";
        }

        // }
        /*统一的接收格式*/
        /*var message = JSON.parse(evn.data);
         dv.innerHTML+=message.content;*/

    };
    ws.onclose = function(){
        console.log("关闭");
    };
}
/**
 * 相关功能代码*/

/*发起一个约伴活动*/
function add_app() {
    var reg = /^\+?[1-9][0-9]*$/;
    var sex_restrict = $("#sex_restrict").val();
    var theme = $("#theme").val();
    var content = UE.getEditor('editor').getContent();
    var site = $("#site").val();
    var begin_time = $(".kssj").val();
    var more_time = $("#jqsj").val();
    var duration = $("#duration").val();
    var count = $("#count").val();
    var app_type = $("#app_type").val();
    if(sex_restrict == -1){
        layer.msg("请选择性别限制！");
    }else if(theme.trim() == ""){
        layer.msg("请填写活动主题！");
    }else if(content.trim() == ""){
        layer.msg("请填写活动内容！");
    }else if(site.trim() == ""){
        layer.msg("请填写活动地点！");
    }else if(begin_time == ""){
        layer.msg("请选择活动开始时间！");
    }else if(duration.trim() == ""){
        layer.msg("请填写活动持续时间！");
    }else if(!reg.test(duration)){
        layer.msg("活动持续的时间只能是整数");
    }else if(app_type == -1){
       layer.msg("请选择活动类型");
    }else {
        $.ajax({
            url: "add-app.action",
            type: "post",
            data: {
                theme:theme ,
                content:content,
                site: site,
                begin_time: begin_time, /* 年月日 */
                more_time: more_time, /* 小时 分钟 */
                duration: duration,
                sex_restrict: sex_restrict,
                app_type:app_type
            },
            dataType: "text",
            success: function (data) {
                /*增加成功之后，父页面跳转至所有活动页面*/
                parent.location.href = "allyueban.do";
            }
        });
    }

}
/*发起一个讨论*/
function add_discuss() {
    var industry_id = $("#industry").val();
    var discuss_title = $("#discuss_title").val();
    var des = $("#question_describe").val();
    if(industry_id == -1){
        layer.msg("请选择问题所属的行业");
    }else if(discuss_title.trim() == ""){
        layer.msg("标题不可为空！");
    }else if(des.trim() == ""){
        layer.msg("问题描述不可为空！");
    }else {
        $.ajax({
            url:"add-discuss.action",
            type:"post",
            data:{
                title:discuss_title,
                description:des,
                industry_id:industry_id
            },
            dataType:"text",
            success:function(data){
                /* 增加一个讨论时候跳转至按时间排序的讨论页面 */
                parent.location.href="discussPageNew.do";
            }
        });
    }
}
/*加入约伴活动*/
function join_app(id,user_account) {
    layer.confirm("确定要加入吗？",function (index) {
        if($("#account").val() == ""){
            layer.msg("你还未登陆,请先登陆!");
            // window.location.href="welcome.do";
        }else {
            $.ajax({
                url:"joinApp.action",
                type:"post",
                data:{
                    appointment_id:id
                },
                success:function(data){
                    var dataObj=eval("("+data+")");
                    if(dataObj.code == 0){
                        layer.msg("申请成功等待对方审核！");
                        ws.send(user_account+','+2+','+id);
                        window.location.reload();
                    }
                }
            });
        }

    });
}
/*活动发起者同意对方加入活动*/
function checkJoin(id,user_account,appId) {
    $.ajax({
        url:"checkJoin.action",
        type:"post",
        data:{
            id:id
        },
        success:function(data){
            if(data.code == 0){
                layer.msg('对方加入成功！', {icon: 1});
                /*把关注的目标用户的账号发给服务器*/
                ws.send(user_account+','+3+','+1+','+appId);
                /*在发送消息之后刷新页面*/
                window.location.reload();
            }
        }
    });
}
/*活动发起者拒绝对方加入活动 即把这条加入信息从表中删除*/
function rejectJoin(id,user_account,appId) {
    $.ajax({
        url:"rejectJoin.action",
        type:"post",
        data:{
            id:id
        },
        success:function(data){
            layer.msg(data.msg);
            if(data.code == 0){
                layer.msg('成功拒绝！', {icon: 1});
                /*把关注的目标用户的账号发给服务器*/
                ws.send(user_account+','+3+','+0+','+appId);
                /*在发送消息之后刷新页面*/
                window.location.reload();
            }
        }
    });
}
/*关注某用户*/
function careUser(user_account,careType) {
    var msg = "";
    switch (careType){
        case 1:
            msg+="确定要关注TA吗？";
            break;
        case 0:
            msg+="你真的不关注他了？"
            break
    }
    layer.confirm(msg,function (index) {
        if($("#account").val() == "") {
            layer.msg("你还未登陆,请先登陆!");
        }else {
            $.ajax({
                url:"careUser.action",
                type:"post",
                data:{
                    user_account:user_account
                },
                success:function(data){
                    layer.msg(data.msg);
                    if(data.code == 0){
                        /*把关注的目标用户的账号发给服务器*/
                        ws.send(user_account+','+1);
                        /*在发送消息之后刷新页面*/
                        window.location.reload();
                    }else {
                        /*取消关注的时候就不发消息给用户了*/
                        window.location.reload();
                    }
                }
            });
        }

    });
}
/*回答问题*/
function answerDiscuss(account,discussId,label) {
var answerContent = $("#my_reply").val();
    if($("#account").val() == "") {
        layer.msg("你还未登陆,请先登陆!");
    }else {
        layer.confirm("确定回答？",function (index) {
            if(answerContent.trim() == ""){
                layer.msg("回答内容不可为空哦！")
            }else {
                $.ajax({
                    url:"answerDiscuss.action",
                    type:"post",
                    data:{
                        discussId:discussId,
                        answerContent:answerContent
                    },
                    success:function(data){
                        layer.msg(data.msg);
                        if(data.code == 0){
                            $("#my_reply").val("");
                            /*把 目标用户的账号 消息的类型  评论的类型 帖子的id 发给服务器*/
                            ws.send(account+','+5+','+label+','+discussId);
                            window.location.reload();
                        }
                    }
                });
            }
        })
    }
}
/*修改个人信息*/
var currentShowCity=0;
var shi = "";
var sheng = $(".sheng").val();
$("#province").change(function(){
    $("#province option").each(function(i,o){
        if($(this).attr("selected"))
        {
            $(".citys").hide();//所有的城市隐藏
            $(".citys").eq(i).show();//与省对应的城市显示
            //再加一个循环
            var obj = $(".citys").eq(i);
            /*  shi = $(".citys").eq(i).val();  */
            for(var i=0;i<obj.length;i++){
                $(".citys option").addClass("shi");
            }
            $(".shi").click(function(){
                shi = $(this).text();
            });
            currentShowCity=i;
        }
    });
});
$("#province").change();
$("#province option").click(function(){
    sheng = $(this).text();
});
function updateMyInfo() {
    var sex = $('input[name="sex"]').val();
    var nickName = $("#nickName").val();
    var hobby = $("#hobby").val();
    var signature = $("#signature").val();
    var job = $("#job-select").val();
    var birth = $("#datepicker").val();
    if(sex == ""){
        layer.msg("请选择你的性别");
    }else if(nickName.trim() == ""){
        layer.msg("昵称不可为空！");
    }else if(signature.trim() == ""){
        signature += "这个人很懒，他啥也没写。";
    }else if(job == -1){
        layer.msg("请选择你所在的行业");
    }else if(birth == ""){
        layer.msg("请填写你的生日");
    }else {
        $.ajax({
            url:"modifyUser.do",
            type:"post",
            data:{
                nickName:nickName,
                sheng:sheng,
                shi:shi,
                hobby:hobby,
                signature:signature,
                job:job,
                sex:sex,
                birth:birth
            },
            dataType:"text",
            success:function(data){
                var dataObj=eval("("+data+")");
//                        alert(dataObj.returnMsg);
                if(dataObj.code == 0){
                    layer.msg("信息修改成功！");
//                            window.location.href="mySpace.do";
                    window.location.reload();
                }else{
                }

            },
            error:function(){
                alert("错误");
            }
        });
    }
}

/**关于评论 对问题的回复的评论1 对约伴活动的评论2 对分享的评论3
 * ******************************************************************/
/*对回答的评论*/
function commentAnswer(account,targetId,label,discussId) {
    /*account是目标用户的账号 为了给TA发送信息*/
    var content = $("#commentContent").val();
    if($("#account").val() == "") {
        layer.msg("你还未登陆,请先登陆!");
    }else {
        if(content.trim() == ""){
            layer.msg("评论内容不可为空哦！");
        }else {
            $.ajax({
                url:"commentInvitation.action",
                type:"post",
                data:{
                    targetId:targetId,
                    label:label,
                    content:content
                },
                success:function(data){
                    // var dataObj=eval("("+data+")");
                    layer.msg(data.msg);
                    if(data.code == 0){
                        $("#commentContent").val("");
                        /*把 目标用户的账号 消息的类型  评论的类型 帖子的id 发给服务器*/
                        ws.send(account+','+5+','+label+','+discussId);
                        /*此处如果也main更新的语句放置发送提示之前 则消息提示不了*/
                        window.location.reload();
                    }
                }
            });
        }
    }
}
/*对帖子的评论*/
function commentAPP(account,targetId,label) {
    /*account是目标用户的账号 为了给TA发送信息*/
    var content = $("#commentContent").val();
    if($("#account").val() == "") {
        layer.msg("你还未登陆,请先登陆!");
    }else {
            if(content.trim() == ""){
                layer.msg("评论内容不可为空哦！");
            }else {
                $.ajax({
                    url:"commentInvitation.action",
                    type:"post",
                    data:{
                        targetId:targetId,
                        label:label,
                        content:content
                    },
                    success:function(data){
                        // var dataObj=eval("("+data+")");
                        layer.msg(data.msg);
                        if(data.code == 0){
                            $("#commentContent").val("");
                            /*把 目标用户的账号 消息的类型  评论的类型 帖子的id 发给服务器*/
                            ws.send(account+','+5+','+label+','+targetId);
                            /*此处如果也main更新的语句放置发送提示之前 则消息提示不了*/
                            window.location.reload();
                        }
                    }
                });
            }
    }

}

/**关于对帖子的点赞
 * */
function likeInvitation(account,invitationId,type,targetLikeId) {
    if($("#account").val() == ""){
        layer.msg("您还未登陆，先去登陆吧");
    }else {
        $.ajax({
            url:"likeInvitation.action",
            type:"post",
            data:{
                invitationId:invitationId,
                type:type
            },
            success:function(data){
                if(data.code == 0){
                    ws.send(account+','+4+','+targetLikeId+','+type);
                    /*此处如果也main更新的语句放置发送提示之前 则消息提示不了*/
                    window.location.reload();
                }else if(data.code == 1){
                    window.location.reload();
                }
            }
        });
    }
}

/**关于举报
 * */
function report(account,targetId,targetType,discussId) {
    var reportTypes = null;
    $("input[name='reportType']:checkbox").each(function(){
        if($(this).prop("checked")){
            if (reportTypes == null){
                reportTypes = $(this).val();
            }else{
                reportTypes += ','+ $(this).val();
            }
        }
    });
    if($("#account").val() == ""){
        layer.msg("您还未登陆，先去登陆吧");
    }else {
        if(reportTypes == null){
            layer.msg("同学，举报总要有理由的！");
        }else {
            $.ajax({
                url:"report.action",
                type:"post",
                data:{
                    targetType:targetType,
                    targetId:targetId,
                    reportType:reportTypes
                },
                success:function(data){
                    if(data.code == 0){
                        layer.msg("举报成功！");
                        ws.send(account+','+6+','+discussId+','+targetType);
                        /*此处如果也main更新的语句放置发送提示之前 则消息提示不了*/
                        parent.location.reload();
                    }
                }
            });
        }
    }
}

/**
 * 关于回复 对评论的回复*/
function replyComment(account,commentId,replyType,parentId) {
    var reply = $(".replyDiv").find("input").val();
    if ($("#account").val() == "") {
        layer.msg("您还未登陆，先去登陆吧");
    } else {
        if (reply == null) {
            layer.msg("同学，你没写内容！");
        } else {
            $.ajax({
                url: "reply.action",
                type: "post",
                data: {
                    replyedAccount:account,
                    replyType:replyType,
                    commentId:commentId,
                    replyContent:reply
                },
                success: function (data) {
                    if (data.code == 0) {
                        layer.msg("回复成功！");
                        ws.send(account + ',' +7+','+replyType+','+commentId+','+parentId);
                        /*此处如果也main更新的语句放置发送提示之前 则消息提示不了*/
                        window.location.reload();
                    }
                }
            });
        }
    }
}
function cancelReply() {
    $(".replyDiv").html("");
}





/***********弹出层
 * ******************************************************************************************/
/*发布约伴活动*/
function addAppPage(title,url) {
    var editor = url;
    var w = 900;
    var h = 600;
    //layer_show(title,editor,w,h);
    layer.open({
        type: 2,
        area: [w + 'px', h + 'px'],
        fix: false, //不固定
        maxmin: true,
        shadeClose: true,/*点击遮罩层 弹出框消失*/
        shade: 0.4,
        title: title,
        content: editor,
        end: function () {
            // location.reload();
        }
    });
}
/*发布讨论活动弹出层*/
function addDiscussPage(title,url) {
    var editor = url;
    var w = 400;
    var h = 300;
    //layer_show(title,editor,w,h);
    layer.open({
        type: 2,
        area: [w + 'px', h + 'px'],
        fix: false, //不固定
        maxmin: true,
        shade: 0.4,
        title: title,
        content: editor,
        end: function () {
        }
    });
}
/*所有消息的弹出层*/
function allMessagePage(title,url) {
    /*把所有未读消息设为已读*/
    $.ajax({
        url: "updateMessage.action",
        type: "post",
        data: {
        },
        success: function (data) {
        }
    });
    var editor = url;
    var w = 700;
    var h = 500;
    var myAccount = $("#account").val();
    if(myAccount != ""){
        layer.open({
            type: 2,
            area: [w + 'px', h + 'px'],
            fix: false, //不固定
            maxmin: true,
            shade: 0.4,
            title: title,
            content: editor,
            end: function () {
            }
        });
    }else {
        layer.msg("您还未登陆，请先登录！");
    }

    //layer_show(title,editor,w,h);
}
/*分享详情弹出框*/
function shareDetail(title,url,id) {
    var editor = url+'?id='+id;
    var w = 600;
    var h = 500;
    layer.open({
        type: 2,
        area: [w + 'px', h + 'px'],
        fix: false, //不固定
        maxmin: true,
        shade: 0.4,
        title: title,
        content: editor,
        end: function () {
        }
    });
}
/*回答的评论弹出层*/
function invitationCommentsPage(title,url,id,label,objectAccount,discussId) {
    var editor = url+'?targetId='+id+'&label='+label+'&objectAccount='+objectAccount+'&discussId='+discussId;
    var w = 700;
    var h = 500;
    //layer_show(title,editor,w,h);
    layer.open({
        type: 2,
        area: [w + 'px', h + 'px'],
        fix: false, //不固定
        maxmin: true,
        shade: 0.4,
        title: title,
        content: editor,
        end: function () {
        }
    });
}
/*举报类型弹出层*/
function reportPage(title,url,account,targetId,targetType,discussId) {
    var editor = url+'?account='+account+'&targetId='+targetId+'&targetType='+targetType+'&discussId='+discussId;
    var w = 400;
    var h = 300;
    //layer_show(title,editor,w,h);
    layer.open({
        type: 2,
        area: [w + 'px', h + 'px'],
        fix: false, //不固定
        maxmin: true,
        shade: 0.4,
        title: title,
        content: editor,
        end: function () {
        }
    });
}
/*反馈弹出层*/
function feedBackPage(title,url) {
    var editor = url;
    var w = 400;
    var h = 300;
    //layer_show(title,editor,w,h);
    layer.open({
        type: 2,
        area: [w + 'px', h + 'px'],
        fix: false, //不固定
        maxmin: true,
        shade: 0.4,
        title: title,
        content: editor,
        end: function () {
        }
    });
}

/*查看回复*/
function getReply(title,url,commentId,replyType,patentId) {
    var editor = url+'?commentId='+commentId+'&replyType='+replyType+'&parentId='+patentId;
    var w = 600;
    var h = 400;
    //layer_show(title,editor,w,h);
    layer.open({
        type: 2,
        area: [w + 'px', h + 'px'],
        fix: false, //不固定
        maxmin: true,
        shade: 0.4,
        title: title,
        content: editor,
        end: function () {
        }
    });
}

/*搜索框 搜索*/
//1:对讨论的搜索
//2:对约伴活动的搜索
//3:对分享的搜索
//4:对用户的搜索
function searchForm(searchType) {
    var searchText = $("#searchText").val();
    window.location.href='search.do?searchType='+searchType+'&keys='+searchText;


}
