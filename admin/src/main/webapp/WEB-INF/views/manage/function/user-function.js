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
                "sSearch": "昵称、现住地、账号搜索",
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
            "sAjaxSource": "user-list.json",//这个是请求的地址
            "fnServerData": retrieveData, // 获取数据的处理函数
            "fnServerParams": function (aoData) {
            },

            "aoColumns": [
                {"mData": "nickName", 'sClass': 'center'},
                {"mData": "account", 'sClass': 'center'},
                {"mData": "sex", 'sClass': 'center',"mRender":function (data,type,full) {
                    var returnStr = "";
                    if(full["sex"] == 'gender ion-male'){
                        returnStr += '<span>男</span>';
                    }else if(full["sex"] == 'gender ion-female'){
                        returnStr += '<span>女</span>';
                    }
                    return returnStr;
                }},
                {"mData": "age", 'sClass': 'center'},
                {"mData": "location", 'sClass': 'center'},
                {"mData": "job", 'sClass': 'center'},
                {"mData": "account", 'sClass': 'center',"mRender":function (data,type,full) {
                    var returnStr = "";
                    if(full["disabled"] == 0){
                        returnStr +='<span style="color: red;" onclick="disableUserOrNot(\'' + full["account"] + '\')">禁用</span>';
                    }else {
                        returnStr +='<span style="color: #00b7ee;" onclick="disableUserOrNot(\'' + full["account"] + '\')">解禁</span>';
                    }
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
/*禁用用户*/
function disableUserOrNot(account) {
    $.ajax({
        url : "disableUserOrNot.action",
        data : {
            account:account
        },//这个是把datatable的一些基本数据传给后台,比如起始位置,每页显示的行数
        type : 'post',
        dataType : 'json',
        async : false,
        success : function(data) {
            if(data.code == 0){
                layer.msg(data.msg,{time:2000});
                table.fnDraw(true);
            }else {
                layer.msg(data.msg, {icon: 5, time: 1000});
            }
        },
        error : function(msg) {
        }
    });
}
