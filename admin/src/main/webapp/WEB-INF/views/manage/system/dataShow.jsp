<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/5/9
  Time: 9:34
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
<div id="main" style="width: 600px;height:400px;margin-left: 240px;"></div>
<script type="text/javascript">
    var main = echarts.init(document.getElementById('main'));
    $.ajax({
        url:"industry.json",
        data:{
        },
        success:function (data) {
            if(data.code == 0){
                var option = {
                    title : {
                        text: '各行业下用户人数及所占比例统计图',
                        x:'center'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b}: {c} ({d}%)"
                    },
                    legend: {
                        orient: 'vertical',
                        x: 'left',
                        data:data.nameList
                    },
                    series: [
                        {
                            name:'行业名称',
                            type:'pie',
                            radius: ['50%', '70%'],
                            avoidLabelOverlap: false,
                            label: {
                                normal: {
                                    show: false,
                                    position: 'center'
                                },
                                emphasis: {
                                    show: true,
                                    textStyle: {
                                        fontSize: '30',
                                        fontWeight: 'bold'
                                    }
                                }
                            },
                            labelLine: {
                                normal: {
                                    show: false
                                }
                            },
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
