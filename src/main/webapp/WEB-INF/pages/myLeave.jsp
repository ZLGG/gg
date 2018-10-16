<%@page pageEncoding="utf-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>查看我的请假</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="components/header.jsp"%>
    <%@include file="components/left.jsp"%>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <fieldset class="layui-elem-field layui-field-title">
            <legend style="font-size:28px;">我的请假列表</legend>
        </fieldset>

        <div class="layui-row">

                <table id="record_table" lay-filter="test"></table>

        </div>
    </div>

    <%@include file="components/bottom.jsp"%>
</div>
<script src="/static/layui/layui.js"></script>
<%--模版选择器--%>
<script type="text/html" id="barDemo">
        {{# if(d.statusId==0){ }}
                <a class="layui-btn layui-btn-xs" href="javascript:;" lay-event="edit">编辑</a>
        {{# } }}
        {{# if(d.statusId==5){ }}
            <a class="layui-btn layui-btn-xs" href="javascript:;" lay-event="repeat">重新申请</a>
        {{# } }}
        <a  class="layui-btn layui-btn-primary layui-btn-xs" href="/recordDetail?record_id={{d.recordId}}" target="_blank">详情</a>
</script>

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
            url: '/getMyLeave',
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
                {
                    field: 'statusId',
                    title: '状态',
                    templet: function(data) {
                        switch (data.statusId) {
                            case 0:
                                return '申请中';
                            case 1:
                                return '一级审批中';
                            case 2:
                                return '二级审批中';
                            case 3:
                                return '三级审批中';
                            case 4:
                                return '全部通过';
                            case 5:
                                return '未通过，待重新申请'
                        }
                    }
                },
                {fixed: 'right',  align:'center', toolbar: '#barDemo'}
            ]]

        });

        //毫秒转日期
        function num(str){
            var date = new Date(str);
            return date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate();
        }

        //监听右侧的工具栏
        table.on('tool(test)', function(obj){
            if(obj.event == 'repeat'){
               index = layer.open({
                    title: '重新提交申请',
                    type: 1,
                    content: $('#repeatForm'),
                    area: ['780px','460px'],
                    success: function(layero, index){//成功的时候填充表单
                        //渲染action地址
                        // $('#form').attr('action','/submitAgain');

                        $('option').each(function(){
                            if($(this).attr('value') == obj.data.typeId){
                                $(this).attr('selected','selected');
                            }
                        });
                        $('#recordIdInput').val(obj.data.recordId);
                        $('#start_date_input').val(num(obj.data.startTime));
                        $('#end_date_input').val(num(obj.data.endTime));
                        laydate.render({
                            elem: "#end_date_input"
                        });
                        laydate.render({
                            elem: "#start_date_input"
                        });
                        $('textarea[name=recordReason]').val(obj.data.recordReason);
                        form.render();
                    }
                });
            }
            if(obj.event == 'edit'){
                index = layer.open({
                    title: '编辑',
                    type: 1,
                    content: $('#repeatForm'),
                    area: ['780px','460px'],
                    success: function(layero, index){//成功的时候填充表单
                        //重新渲染这个按钮
                        $('#submitBtn').get(0).innerHTML = '提交';
                        //渲染action地址
                        // $('#form').attr('action','/editAgain');

                        $('option').each(function(){
                            if($(this).attr('value') == obj.data.typeId){
                                $(this).attr('selected','selected');
                            }
                        });
                        $('#recordIdInput').val(obj.data.recordId);
                        $('#start_date_input').val(num(obj.data.startTime));
                        $('#end_date_input').val(num(obj.data.endTime));
                        laydate.render({
                            elem: "#end_date_input"
                        });
                        laydate.render({
                            elem: "#start_date_input"
                        });
                        $('textarea[name=recordReason]').val(obj.data.recordReason);
                        form.render();
                    },
                    cancel: function(){
                        $('#submitBtn').get(0).innerHTML = '重新提交';
                    }
                });
            }


        })

        //监听表单的提交事件
        form.on('submit(formBtn)', function(){
            $.ajax({
                url: '/submitAgain',
                data: $('#form').serialize(),
                method: 'post',
                success: function (res) {
                    if(res.code == 200){
                        layer.msg(res.message, {time:1500})
                        setTimeout(function () {
                            layer.close(index);
                            location.href = '/myLeave'
                        }, 1500)
                    }else {
                        layer.msg(res.message)
                    }
                }
            })
            return false;
        })
    });
</script>

<div style="display: none;" class="layui-col-row" id="repeatForm">
    <div class="layui-col-md7 layui-col-md-offset2">
        <form class="layui-form" method="post" id="form">
            <div class="layui-form-item">
                <label class="layui-form-label">申请人</label>
                <div class="layui-form-mid layui-word-aux">${sessionScope.user.username}</div>
                <input type="hidden" name="recordProposer" value="${sessionScope.user.username}">
                <input name="recordId" id="recordIdInput" type="hidden">
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
                    <input date lay-verify="required" id="start_date_input" type="text" name="startTime" placeholder="开始时间"  class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">结束时间</label>
                <div class="layui-input-block">
                    <input date lay-verify="required" id="end_date_input" type="text" name="endTime" placeholder="结束时间"  class="layui-input">
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
                    <button id="submitBtn" class="layui-btn" lay-submit lay-filter="formBtn">重新提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>

</html>
