<%@page pageEncoding="utf-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            <legend style="font-size:28px;">请假信息</legend>
        </fieldset>
       <div class="layui-col-row">
           <div class="layui-col-md7 layui-col-md-offset2">
               <form class="layui-form" action="">
                   <div class="layui-form-item">
                       <label class="layui-form-label">申请人</label>
                       <div class="layui-form-mid layui-word-aux">${requestScope.record.recordProposer}</div>
                   </div>
                   <div class="layui-form-item">
                       <label class="layui-form-label">申请时间</label>
                       <div class="layui-form-mid layui-word-aux"><fmt:formatDate value="${requestScope.record.recordTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></div>
                   </div>
                   <div class="layui-form-item">
                       <label class="layui-form-label">请假类型</label>
                       <div class="layui-form-mid layui-word-aux">
                           <c:set var="typeId" value="${requestScope.record.typeId}"/>
                           <c:choose>
                               <c:when test="${typeId == 1}">
                                   年假
                               </c:when>
                               <c:when test="${typeId == 2}">
                                   事假
                               </c:when>
                               <c:when test="${typeId == 3}">
                                   病假
                               </c:when>
                           </c:choose>
                       </div>
                   </div>
                   <div class="layui-form-item">
                           <label class="layui-form-label">开始时间</label>
                       <div class="layui-form-mid layui-word-aux"><fmt:formatDate value="${requestScope.record.startTime}" pattern="yyyy-MM-dd"></fmt:formatDate></div>
                   </div>
                   <div class="layui-form-item">
                       <label class="layui-form-label">结束时间</label>
                       <div class="layui-form-mid layui-word-aux"><fmt:formatDate value="${requestScope.record.endTime}" pattern="yyyy-MM-dd"></fmt:formatDate></div>
                   </div>
                   <div class="layui-form-item layui-form-text">
                       <label class="layui-form-label">原因说明</label>
                       <div class="layui-form-mid layui-word-aux">${requestScope.record.recordReason}</div>
                   </div>
               </form>
           </div>
       </div>

        <div class="layui-row">
            <fieldset class="layui-elem-field layui-field-title">
                <legend style="font-size:28px;">审批过程</legend>
            </fieldset>
        </div>
        <div class="layui-row">
            <div class="layui-col-md7 layui-col-md-offset2">
                <table id="history_table"></table>
            </div>
        </div>
    </div>

    <%@include file="components/bottom.jsp"%>
</div>
<script src="/static/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['form','laydate', 'jquery', 'layer', 'table'], function(){
        var form = layui.form;
        var laydate = layui.laydate;
        var $ = layui.jquery;
        var layer = layui.layer;
        var table = layui.table;


        table.render({
            elem: '#history_table',
            url: '/getHistory?record_id='+${requestScope.record.recordId},
            cols: [[ //表头
                {field: 'operationUser', title: '操作人',  fixed: 'left'}
                ,{field: 'operationTime',
                    title: '操作时间',
                    templet: function(d){
                        var date = new Date(d.operationTime);
                        return date.getFullYear()+'年'+(date.getMonth()+1)+"月"+date.getDate()+"日"+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
                    }
                }
                ,{field: 'operationResult', title: '操作内容'}
                ,{field: 'operationReason', title: '操作理由'}
            ]]
        });


    });
</script>
</body>
</html>
