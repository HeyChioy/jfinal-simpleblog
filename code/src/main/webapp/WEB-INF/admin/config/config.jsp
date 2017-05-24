<% long date = new Date().getTime(); %>
<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/1
  Time: 23:29
  To change this template use File | Settings | File Templates.
--%>

<html>
<%@include file="../common/head.jsp" %>
<body>
<%@include file="../common/nav.light.jsp" %>
<div class="main-container">
    <%@include file="part.config.list.jsp" %>
</div>
<%@include file="../common/script.jsp" %>
<script src="/assets/js/vue/vue.component.config.js?t=<%=date%>"></script>
<script src="/assets/js/vue/admin.configs.js?t=<%=date%>"></script>
<script src="/assets/js/vue/admin.nav.js?t=<%=new Date().getTime()%>"></script>
<script src="/assets/js/vue/vue.init.js?t=<%=date%>"></script>
<script src="/assets/js/vue/vue.head.js"></script>
</body>
</html>
