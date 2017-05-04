/**
 * Created by Master ZQ on 2017/3/11.
 */
var table=""
jQuery(function () {
    $(document).ready(function () {
        table = $("table").dataTable({
            "oLanguage": {
                "sProcessing": "正在加载数据...",
                "sLoadingRecords": "正在加载数据...",
                "sLengthMenu": "显示_MENU_条 ",
                "sZeroRecords": "没有您要搜索的内容",
                "sInfo": "显示 _START_ 到 _END_ ，共 _TOTAL_ 条",
                "sInfoFiltered": "(共 _MAX_ 条)",
                "sInfoEmpty": "记录数为0",
                "sInfoPostFix": "",
                "sSearch": "",
                "sUrl": "",
                "oPaginate": {
                    "sFirst": "第一页",
                    "sPrevious": " 上一页 ",
                    "sNext": " 下一页 ",
                    "sLast": " 最后一页 "
                }
            },
            "sErrMode": "throw",
            "bDestroy": true,
            "bSort": false,
            "bStateSave": true,
            "bProcessing": false, // 是否显示取数据时的那个等待提示
            "bServerSide": true,//这个用来指明是通过服务端来取数据
            "sAjaxSource": "report-list.json",//这个是请求的地址
            "fnServerData": retrieveData, // 获取数据的处理函数
            "fnServerParams": function (aoData) {
                aoData.push(
                    {"name": "reportType", "value": $('#reportType option:selected').val()},
                    {"name": "currentState", "value": $('#currentState option:selected').val()}
                )
            },

            "aoColumns": [
                {"mData": "targetType", 'sClass': 'center',"mRender":function (data,type,full) {
                    var returnStr = "";
                    if(full["targetType"] == 2){
                        returnStr += '<span>举报用户</span>';
                    }else if(full["targetType"] == 1){
                        returnStr += '<span>举报回答</span>';
                    }
                    return returnStr;
                }},
                {"mData": "reportType", 'sClass': 'center',"mRender":function (data,type,full) {
                var returnStr = "";
                    var reportTypes = full["reportType"].split(',');
                    var message = "";
                    $.each(reportTypes,function (index,value) {
                        switch (parseInt(value)){
                            case 1:
                                message += '色情低俗'+',';
                                break;
                            case 2:
                                message += '政治敏感'+',';
                                break;
                            case 3:
                                message += '违法'+',';
                                break;
                            case 4:
                                message += '广告'+',';
                                break;
                            case 5:
                                message += '病毒木马'+',';
                                break;
                            case 6:
                                message += '其他'+',';
                                break;
                        }
                    })
                    /*去掉最后一个逗号*/
                    message = message.substring(0,message.length-1);
                    returnStr += '<span>'+message+'</span>';
                    return returnStr;
                }},
                {"mData": "updateTime", 'sClass': 'center'},
                {"mData": "currentState", 'sClass': 'center',"mRender":function (data,type,full) {
                    var returnStr = "";
                    if(full["currentState"] == 0){
                        returnStr += '<span>未处理</span>';
                    }else if(full["currentState"] == 1){
                        returnStr += '<span>已处理</span>';
                    }
                    return returnStr;
                }},
                {"mData": "id", 'sClass': 'center',"mRender": function(data, type, full) {
                    var returnStr="";
                    if(full["currentState"] == 0){
                        if(full["targetType"] == 2){
                            returnStr += '<a title="删除此举报" onClick="processReport(\'' + full["targetId"] + '\',\''+full["targetType"]+'\',\''+full["id"]+'\',1)" href="javascript:;" >删除此举报</a>'+" ";
                            returnStr += '<a title="禁用用户" onClick="processReport(\'' + full["targetId"] + '\',\''+full["targetType"]+'\',\''+full["id"]+'\',3)" href="javascript:;" >禁用用户</a>'+" ";
                        }else {
                            returnStr += '<a title="删除此举报" onClick="processReport(\'' + full["targetId"] + '\',\''+full["targetType"]+'\',\''+full["id"]+'\',1)" >删除此举报</a>'+" ";
                            returnStr += '<a title="禁用用户" onClick="processReport(\'' + full["targetId"] + '\',\''+full["targetType"]+'\',\''+full["id"]+'\',3)" href="javascript:;" >禁用用户</a>'+" ";
                            returnStr += '<a title="删除记录" onClick="processReport(\'' + full["targetId"] + '\',\''+full["targetType"]+'\',\''+full["id"]+'\',2)" href="javascript:;" >删除记录</a>'+" ";
                            returnStr += '<a  title="删除记录并禁用用户" onClick="processReport(\'' + full["targetId"] + '\',\''+full["targetType"]+'\',\''+full["id"]+'\',4)" href="javascript:;" >删除记录并禁用用户</a>';
                        }
                    }else if(full["currentState"] == 1){
                        if (full["status"] == 1){
                            returnStr += '<span style="color: grey;">删除此举报</span>'+" ";
                        }else if (full["status"] == 2){
                            returnStr += '<span style="color: grey;">删除记录</span>'+" ";
                        }else if (full["status"] == 3){
                            returnStr += '<span style="color: grey;">禁用用户</span>';
                        }else if (full["status"] == 4){
                            returnStr += '<span style="color: grey;">删除记录并禁用用户</span>'+" ";
                        }
                    }
                    return returnStr;
                }}
            ]
        });
        $("#reportType").change(function () {
            var reportType = $('#reportType option:selected').val();
            if (reportType != null && reportType != "") {
                table.fnDraw();
            }
        });
        $("#currentState").change(function () {
            var currentState = $('#currentState option:selected').val();
            if (currentState != null && currentState != "") {
                table.fnDraw();
            }
        });
    });
});
function retrieveData(sSource111, aoData111, fnCallback111) {
    $.ajax({
        url: sSource111,//这个就是请求地址对应sAjaxSource
        data: {"aoData": JSON.stringify(aoData111)},//这个是把datatable的一些基本数据传给后台,比如起始位置,每页显示的行数
        type: 'post',
        dataType: 'json',
        async: false,
        success: function (result) {
            fnCallback111(result);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的
        },
        error: function (msg) {
        }
    });
}

function processReport(targetId,targetType,reportId,processType) {
    $.ajax({
        url : "process-report.action",
        data : {
            targetId:targetId,
            targetType:parseInt(targetType),
            reportId:reportId,
            processType:processType
        },//这个是把datatable的一些基本数据传给后台,比如起始位置,每页显示的行数
        type : 'post',
        dataType : 'json',
        async : false,
        success : function(data) {
            if(data.code == 0){
                layer.msg(data.msg,{time:2000});
                table.fnDraw(true);
                // window.location.reload();
            }else {
                layer.msg(data.msg, {icon: 5, time: 1000});
            }
        },
        error : function(msg) {
        }
    });
}
