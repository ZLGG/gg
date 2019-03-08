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
    <div class="header_btn">
        <a href="#" class="search"></a>
        <a href="#" class="user"></a>
        <div class="buycar"><i></i>购物车
            <!--悬浮购物车div  start -->
            <div class="minicar">
                <div class="minicar-body">
                    <div class="minicar-header">
                        <span>我的购物车</span>
                        <span>数量</span>
                        <span>价格</span>
                    </div>
                    <div class="minicar-cont">
                        <!--<p>您的购物车里没有任何商品</p>-->
                        <ul>
                            <li>
												<span>
													<a href="#">
														<img src="temp/hot_product/p1.jpg">
														<span>如新日间防御美颜乳</span>
													</a>
												</span>
                                <span>1</span>
                                <span>￥450.00</span>
                            </li>
                            <li>
												<span>

													<a href="#">
													<img src="temp/hot_product/p2.jpg">
													<span>如新活颜微晶焕肤霜</span>
													</a>
												</span>
                                <span>1</span>
                                <span>￥210.00</span>
                            </li>
                        </ul>
                    </div>
                    <div class="minicar-total">
                        <span>共2件商品</span>
                        <span>合计<span>￥660</span></span>
                    </div>
                    <div class="minicar-btns">
                        <a href="javascript:;">去结算</a>
                        <!-------无商品时按钮样式-------->
                        <!--<a href="javascript:;" class="btn-unable">去结算</a>-->
                    </div>
                </div>
            </div>
            <!--悬浮购物车div  end -->
        </div>

    </div>
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
<script>
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
</script>


</body>
</html>
