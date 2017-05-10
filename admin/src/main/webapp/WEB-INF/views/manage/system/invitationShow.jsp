<%--
  Created by IntelliJ IDEA.
  User: Master ZQ
  Date: 2017/5/9
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="../../static/js/plugins/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="../../static/js/plugins/echarts/echarts.js"></script>
    <title>各类帖子数量及所占比例统计图</title>
</head>
<body>
<div id="main" style="width: 600px;height:400px;margin-left: 240px;"></div>
<script type="text/javascript">
    var main = echarts.init(document.getElementById('main'));
    $.ajax({
        url:"invitation.json",
        data:{
        },
        success:function (data) {
            if(data.code == 0){
                var option = {
                    title : {
                        text: '各类帖子数量及所占比例统计图',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                        data: data.nameList
                    },
                    series : [
                        {
                            name: '帖子类型',
                            type: 'pie',
                            radius : '55%',
                            center: ['50%', '60%'],
                            data:data.data,
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
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
