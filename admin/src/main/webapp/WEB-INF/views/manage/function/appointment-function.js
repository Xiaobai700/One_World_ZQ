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
                "sSearch": "手机号，昵称、地域搜索",
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
            "sAjaxSource": "appointment-list.json",//这个是请求的地址
            "fnServerData": retrieveData, // 获取数据的处理函数
            "fnServerParams": function (aoData) {
            },

            "aoColumns": [
                {"mData": "app_type", 'sClass': 'center'},
                {"mData": "site", 'sClass': 'center'},
                {"mData": "sex_restrict", 'sClass': 'center'},
                {"mData": "over_flag", 'sClass': 'center',"mRender": function(data, type, full) {
                    var returnStr = "";
                    if(full["over_flag"] == 0){
                        returnStr += '<span>'+"未结束"+'</span>';
                    }if(full["over_flag"] == 1){
                        returnStr += '<span>'+"已结束"+'</span>';
                    }
                    return returnStr;
                }},
                {"mData": "is_checked", 'sClass': 'center',"mRender": function(data, type, full) {
                    var returnStr = "";
                    if(full["is_checked"] == 0){
                        returnStr += '<span style="color: red;" onClick="checkApp(\''+full["id"]+'\')">'+"审核"+'</span>';
                    }if(full["is_checked"] == 1){
                        returnStr += '<span>'+"已审核"+'</span>';
                    }
                    return returnStr;
                }},
                {"mData": "organizer_account", 'sClass': 'center'},
                {"mData": "publish_time", 'sClass': 'center'},
                {"mData": "id", 'sClass': 'center',"mRender":function (data,type,full) {
                    var returnStr = "";
                    returnStr += '<i class="glyphicon glyphicon-trash" title="删除" onClick="deleteApp(\''+full["id"]+'\')"></i>';
                    return returnStr;
                }}
            ]
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
function checkApp(id) {
    layer.confirm("确定通过这个活动？",function (index) {
        $.ajax({
            url : "check-app.action",
            data : {
               id:id
            },
            type : 'post',
            dataType : 'json',
            async : false,
            success : function(data) {
                if(data.code == 0){
                    layer.close(index);
                    layer.msg("审核成功！",{time:2000});
                    table.fnDraw(true);
                }else {
                    layer.msg(data.msg, {icon: 5, time: 1000});
                }
            },
            error : function(msg) {
            }
        });
    });
}

function deleteApp(id) {
    layer.confirm("你确定要删除这个活动？",function (index) {
    })
}

