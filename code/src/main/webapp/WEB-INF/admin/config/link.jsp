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
    <%@include file="part.links.editor.jsp"%>
    <%@include file="part.links.list.jsp" %>
    <%@include file="../common/notification.jsp"%>
</div>
<%@include file="../common/script.jsp" %>
<script src="/assets/js/vue/vue.component.link.js?t=<%=new Date().getTime()%>"></script>
<script src="/assets/js/vue/admin.links.js?t=<%=new Date().getTime()%>"></script>
<script src="/assets/js/vue/vue.notification.js?t=<%=new Date().getTime()%>"></script>
<script src="/assets/js/vue/admin.nav.js?t=<%=new Date().getTime()%>"></script>
<script src="/assets/js/vue/vue.init.js?t=<%=new Date().getTime()%>"></script>
<script src="/assets/js/vue/vue.head.js"></script>
</body>
</html>

