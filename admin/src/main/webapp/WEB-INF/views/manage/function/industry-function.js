/**
 * Created by Master ZQ on 2017/3/20.
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
                "sSearch": "名称搜索",
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
            "sAjaxSource": "industry-list.json",//这个是请求的地址
            "fnServerData": retrieveData, // 获取数据的处理函数
            "fnServerParams": function (aoData) {
            },

            "aoColumns": [
                {"mData": "industry_name", 'sClass': 'center'},
                {"mData": "industry_userNum", 'sClass': 'center'},
                {"mData": "create_time", 'sClass': 'center'},
                {"mData": "update_time", 'sClass': 'center'},
                {"mData": "id", 'sClass': 'center',"mRender": function(data, type, full) {
                    var returnStr = "";
                    returnStr += '<i class="glyphicon glyphicon-trash" title="删除" onClick="deleteIndustry(\''+full["id"]+'\')"></i>';
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
var flag = false;
if($("#industry_name").val() == ""){
    var e = "<i class='fa fa-times-circle' style='color: red'></i><span style='color: red;'>必填</span>";
    $(".tips").html(e);
}
getChange();
function getChange() {
    $("input").change(function () {
        $(".tips").html("");//先清空
        $("#save").attr("disabled",false);//按钮可点击
        var reg = /^[\u4e00-\u9fa5]+$/i;
        var industry_name = $("#industry_name").val();
        if(industry_name == ""){
            var e = "<i class='fa fa-times-circle'style='color: red'></i><span style='color: red;'>必填</span>";
            $(".tips").html(e);
        }else {
            if(reg.test(industry_name)){
                flag = true;
            }else {
                var e = "<i class='fa fa-times-circle'style='color: red;'></i><span style='color: red;'>行业名称必须是汉字</span>";
                $(".tips").html(e);
                //设置按钮不可点击
                $("#save").attr("disabled",true);
                flag = false;
            }
        }
    });
}
function addIndustry() {
    if(flag){
        $.ajax({
            url : "add-industry.action",
            data : {
                industry_name:$("#industry_name").val()
            },//这个是把datatable的一些基本数据传给后台,比如起始位置,每页显示的行数
            type : 'post',
            dataType : 'json',
            async : false,
            success : function(data) {
                if(data.code == 0){
                    layer.msg("新增行业成功！",{time:2000});
                    table.fnDraw(true);
                }else {
                    layer.msg(data.msg, {icon: 5, time: 1000});
                }
            },
            error : function(msg) {
            }
        });
    }

}
function deleteIndustry(id) {
    layer.confirm('确认要删除吗？',function(index){
        $.ajax({
            url : "delete-industry.action",
            data : {
               id:id
            },
            type : 'post',
            dataType : 'json',
            async : false,
            success : function(data) {
                if(data.code == 0){
                    layer.close(index);
                    layer.msg("删除行业成功！",{time:2000});
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

