<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE HTML>
<html>
<%@include file="../common/head.jsp" %>
<body class="basic-gradient-light">
<%@include file="../common/nav.jsp" %>
<div class="main-container">

    <%@include file="../common/banner.jsp"%>
    <div id="totop-target"></div>
    <%@include file="part.articles.simple.jsp"%>
</div>
<%@include file="../common/totop.jsp"%>
<%@include file="../common/paging.jsp" %>
<%@include file="../common/footer.jsp" %>
<%@include file="../common/notification.jsp"%>
<%@include file="../common/script.jsp" %>
<% long date = new Date().getTime(); %>
<script src="/assets/js/vue/vue.head.js?t=<%=date%>"></script>
<script src="/assets/js/vue/vue.nav.js?t=<%=date%>"></script>
<script src="/assets/js/vue/vue.articles.js?t=<%=date%>"></script>
<script src="/assets/js/vue/vue.component.totop.js?t=<%=date%>"></script>
<script src="/assets/js/vue/vue.totop.js?t=<%=date%>"></script>
<script src="/assets/js/vue/vue.paging.js?t=<%=date%>"></script>
<script src="/assets/js/vue/vue.footer.js?t=<%=date%>"></script>
<script src="/assets/js/vue/vue.notification.js?t=<%=date%>"></script>
<script src="/assets/js/vue/vue.init.js?t=<%=date%>"></script>
</body>
</html>