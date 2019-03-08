<%@page pageEncoding="utf-8" language="java"  isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>申请请假</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="components/header.jsp"%>
    <%@include file="components/left.jsp"%>



    <div class="layui-body">
        <!-- 内容主体区域 -->
        <fieldset class="layui-elem-field layui-field-title">
            <legend style="font-size:28px;">申请请假</legend>
        </fieldset>
       <div class="layui-col-row">
           <div class="layui-col-md7 layui-col-md-offset2">
               <form class="layui-form" action="/addRecord" method="post">
                   <div class="layui-form-item">
                       <label class="layui-form-label">申请人</label>
                       <div class="layui-form-mid layui-word-aux">${sessionScope.user.username}</div>
                       <input type="hidden" name="recordProposer" value="${sessionScope.user.username}">
                   </div>
                   <div class="layui-form-item">
                       <label class="layui-form-label">请假类型</label>
                       <div class="layui-input-block">
                           <select name="typeId" lay-verify="required">
                               <option value="1">年假</option>
                               <option value="2">事假</option>
                               <option value="3">病假</option>
                           </select>
                       </div>
                   </div>
                   <div class="layui-form-item">
                           <label class="layui-form-label">开始时间</label>
                           <div class="layui-input-block">
                               <input lay-verify="required" id="start_date_input" type="text" name="startTime" placeholder="开始时间"  class="layui-input">
                           </div>
                   </div>
                   <div class="layui-form-item">
                       <label class="layui-form-label">结束时间</label>
                       <div class="layui-input-block">
                           <input lay-verify="required" id="end_date_input" type="text" name="endTime" placeholder="结束时间"  class="layui-input">
                       </div>
                   </div>

                   <div class="layui-form-item layui-form-text">
                       <label class="layui-form-label">原因说明</label>
                       <div class="layui-input-block">
                           <textarea lay-verify="required" name="recordReason" placeholder="请输入原因" class="layui-textarea"></textarea>
                       </div>
                   </div>
                   <div class="layui-form-item">
                       <div class="layui-input-block">
                           <button class="layui-btn" lay-submit lay-filter="" >立即提交</button>
                           <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                       </div>
                   </div>
               </form>
           </div>
       </div>


    </div>

    <script type="text/javascript" src="/static/layui/layui.js"></script>
</div>
<script src="../../../static/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['form','laydate', 'jquery', 'layer'], function(){
        var form = layui.form;
        var laydate = layui.laydate;
        var $ = layui.jquery;
        var layer = layui.layer;
        laydate.render({
            elem: "#end_date_input"
        });
        laydate.render({
            elem: "#start_date_input"
        });
        form.on('submit(formDemo)', function(data){
            console.log(data);
            $.ajax({
                url: "/addRecord",
                type: 'post',
                data: data.field,
                success: function(result){
                    console.log(result);
                    if(result.code == 200){
                        layer.msg('申请成功', {time: 1500});
                        setTimeout(function () {
                            location.href = '/myLeave';
                        }, 1500);
                    }
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
