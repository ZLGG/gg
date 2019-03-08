<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/13
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>登录</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css" type="text/css"/>
    <style>
        body{
            background-color: #f1f1f1;
        }
        .center{
            width:600px;
            height: 330px;
            position: absolute;
            top:50%;
            left: 50%;
            margin-top: -250px;
            margin-left: -300px;
            background: white;
            padding:20px;
        }
        .p5{
            margin-left:5px;
        }
    </style>
</head>
<body>
<div class="center">
    <h1>登录</h1>
    <hr>
    <form class="layui-form" action="" method="post" style="margin-top:30px;">
        <div class="layui-form-item">
            <div class="layui-input-block p5">
                <input type="text" name="username" required  lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block p5">
                <input type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block p5">
                <button class="layui-btn" lay-submit lay-filter="*" style='width:100%;' onclick="/login">登录</button>
            </div>
        </div>
    </form>
</div>




<script type="text/javascript" src="/static/layui/layui.js"></script>
<%--<script>
    //Demo
    layui.use(['form','layer','jquery'], function(){
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.jquery;
        form.on('submit(*)', function(data){
            $.ajax({
                url: "/login",
                data: data.field,
                type: 'post',
                success: function(result){
                    console.log(result);
                    if(result.code == 400){
                        layer.msg(result.message, {time: 1000});
                    }else{
                        layer.msg(result.message, {time: 1000});
                        setTimeout(function () {
                            window.location.href = "/index";
                        }, 1000)
                    }
                },
                error: function (result) {
                    console.log(result);
                }
            });
            console.log(data);
           // return false;
        });
    });
</script>--%>


</body>
</html>
