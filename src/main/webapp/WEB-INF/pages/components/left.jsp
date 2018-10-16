<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/14
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;">请假</a>
                <dl class="layui-nav-child">
                    <dd><a href="/index">申请请假</a></dd>
                    <dd><a href="/myLeave">我的请假</a></dd>
                    <dd><a href="/check">审批请假</a></dd>
                    <%--<dd><a href="/gotoGetAll">所有请假单(测试用)</a></dd>--%>
                </dl>
            </li>

        </ul>
    </div>
</div>
