<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/5/16
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="shortcut icon" href="favicon.ico">
    <script type="text/javascript" src="../../static/js/plugins/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="../../static/js/plugins/echarts/echarts.js"></script>
    <title>数据展示</title>
</head>
<body>
<div id="main" style="width: 650px;height:400px;margin-left: 240px;"></div>
<script type="text/javascript">
    var main = echarts.init(document.getElementById('main'));
    $.ajax({
        url:"app.json",
        data:{
        },
        success:function (data) {
            if(data.code == 0){
                var option = {
                    title : {
                        text: '各类型下约伴活动数及所占比例统计表',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        x : 'center',
                        y : 'bottom',
                        data:data.nameList
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType : {
                                show: true,
                                type: ['pie', 'funnel']
                            },
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    series : [
                        {
                            name:'半径模式',
                            type:'pie',
                            radius : [20, 110],
                            center : ['25%', '50%'],
                            roseType : 'radius',
                            label: {
                                normal: {
                                    show: false
                                },
                                emphasis: {
                                    show: true
                                }
                            },
                            lableLine: {
                                normal: {
                                    show: false
                                },
                                emphasis: {
                                    show: true
                                }
                            },
                            data:data.data
                        },
                        {
                            name:'面积模式',
                            type:'pie',
                            radius : [30, 110],
                            center : ['75%', '50%'],
                            roseType : 'area',
                            data:data.data
                        }
                    ]
                };
                main.setOption(option);
            }
        }
    })

</script>
</body>
</html>
