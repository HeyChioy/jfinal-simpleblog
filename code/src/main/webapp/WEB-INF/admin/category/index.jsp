<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/1
  Time: 23:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="../common/head.jsp" %>
<body>
<%@include file="../common/nav.light.jsp" %>
<div class="main-container">
<%@include file="part.category.list.jsp"%>
</div>
<%@include file="../common/script.jsp" %>
</div>
<script src="/assets/js/vue/admin.nav.js?t=<%=new Date().getTime()%>"></script>
<script src="/assets/js/vue/admin.component.category.js?t=<%=new Date().getTime()%>"></script>
<script src="/assets/js/vue/admin.category.js?t=<%=new Date().getTime()%>"></script>
<script src="/assets/js/vue/vue.head.js"></script>
</body>
</html>
