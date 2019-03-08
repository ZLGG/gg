<%@page pageEncoding="utf-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>查看我可以批准的请假</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="components/header.jsp"%>
    <%@include file="components/left.jsp"%>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <fieldset class="layui-elem-field layui-field-title">
            <legend style="font-size:28px;">审批请假</legend>
        </fieldset>
        <div class="layui-field-box">
            您当前可以审批的权限是：批准或者拒绝
            <span style="color: #CE0000;font-weight: bold;">
                <c:set var="authority" value="${sessionScope.user.authority}"/>
            <c:choose>
                <c:when test="${authority == 0}">
                    请假申请
                </c:when>
                <c:when test="${authority == 1}">
                    一级请求
                </c:when>
                <c:when test="${authority == 2}">
                    二级请求
                </c:when>
                <c:when test="${authority == 3}">
                    三级请求
                </c:when>
            </c:choose>
            </span>
        </div>

        <div class="layui-row">
            <div class="layui-col-md10 layui-col-md-offset1">
                <table id="record_table" lay-filter="test"></table>
            </div>
        </div>
    </div>

    <%@include file="components/bottom.jsp"%>
</div>
<script src="/static/layui/layui.js"></script>
<%--模版选择器recordHref--%>
<script type="text/html" id="barDemo">
        <a  class="layui-btn layui-btn-primary layui-btn-xs" href="/recordDetail?record_id={{d.recordId}}" target="_blank">详情</a>
        <a lay-event="approve" id="approveBtn" class="layui-btn layui-btn-xs" href="/approve?record_id={{d.recordId}}">批准</a>
        <a lay-event="reject" class="layui-btn layui-btn-danger layui-btn-xs" href="/reject?record_id={{d.recordId}}">拒绝</a>
</script>

<%--拒绝表单--%>
<form class="layui-form" action="http://www.baidu.com" id="form">
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">拒绝理由</label>
        <div class="layui-input-block">
            <textarea name="rejectReason" placeholder="请输入理由" class="layui-textarea"></textarea>
        </div>
    </div>
</form>




<script>
    function dateConvert1(dateNumber){
        var date = new Date(dateNumber.recordTime);
        return date.getFullYear()+'-'+(date.getMonth()+1)+"-"+date.getDate()+"  "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
    }
    function dateConvert2(dateNumber){
        var date = new Date(dateNumber.startTime);
        return date.getFullYear()+'-'+(date.getMonth()+1)+"-"+date.getDate();
    }
    function dateConvert3(dateNumber){
        var date = new Date(dateNumber.endTime);
        return date.getFullYear()+'-'+(date.getMonth()+1)+"-"+date.getDate();
    }

    //JavaScript代码区域
    layui.use(['form','laydate', 'jquery', 'layer', 'table'], function(){
        var form = layui.form;
        var laydate = layui.laydate;
        var $ = layui.jquery;
        var layer = layui.layer;
        var table = layui.table;

        //渲染用户可以审批的列表
        table.render({
            elem: '#record_table',
            url: '/getListUserCanApprove',
            cols: [[ //表头
                {field: 'recordId', title: '请假单ID', width: '10%'},
                {field: 'recordProposer', title: '请假人', width: '10%'},
                {field: 'recordReason', title: '请假理由', width: '20%'},
                {field: 'typeId', title: '请假类型', templet: function(data){
                        switch (data.typeId) {
                            case 1:
                                return '年假';
                            case 2:
                                return '事假';
                            case 3:
                                return '病假';
                        }
                    },
                    width: '10%'
                },
                {field: 'recordTime',
                    title: '申请时间',
                    templet: dateConvert1,
                    width: '13%'
                },
                {field: 'startTime',
                    title: '开始时间',
                    templet: dateConvert2, width: '10%'
                },
                {field: 'endTime',
                    title: '结束时间',
                    templet: dateConvert3, width: '10%'
                },
                {fixed: 'right',  align:'center', toolbar: '#barDemo'}
            ]]

        });

        function ajax(url){
            $.ajax({
                url: url,
                type: 'get',
                success: function (res) {
                    if(res.code == 200){
                        layer.msg(res.message, {time: 1500});
                        setTimeout(function () {
                            location.href = '/check'
                        }, 1500);
                    }else {
                        layer.msg(res.message, {time: 1500});
                    }
                },
                error: function(){
                    layer.msg('服务器繁忙，请稍后再试', {time: 1500});
                }
            });
        }

        table.on('tool(test)', function(obj){
            switch (obj.event) {
                case 'approve':
                    ajax("/approve?record_id="+obj.data.recordId);
                    break;
                case 'reject':
                    var index = layer.open({
                        title: '请填写拒绝理由',
                        area: ['600px', '230px'],
                        type: 1,
                        content: $('#form'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
                        btn: ['确定','关闭窗口'],
                        btn1: function(){
                            //发送一个拒绝的请求
                            $.ajax({
                                url: '/reject?record_id='+obj.data.recordId,
                                type: 'post',
                                data: 'reason='+$('textarea[name=rejectReason]').val(),
                                success: function(res){
                                    layer.msg(res.message,{time:1500});
                                    setTimeout(function () {
                                        location.href = '/check'
                                    },1500)
                                }
                            });
                            //关闭窗口
                            layer.close(index);
                        }
                    });
                    break;
            }
        });
    });
</script>
</body>
</html>
