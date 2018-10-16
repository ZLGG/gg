<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/16
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>非法操作</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css" type="text/css"/>
</head>
<body>

<script src="/static/layui/layui.js" type="text/javascript"></script>
<script type="text/javascript">
    layui.use(['layer'], function(){
        var layer = layui.layer;
        layer.msg('非法请求', {time: 1500});
        setTimeout(function () {
            location.href = '/';
        }, 1500)
    });
</script>

</body>
</html>
