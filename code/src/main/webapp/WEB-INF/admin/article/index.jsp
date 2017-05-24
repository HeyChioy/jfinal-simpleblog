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
    <%@include file="part.searchbox.jsp"%>
    <div id="totop-target"></div>
    <%@include file="part.article.list.jsp" %>
    <%@include file="../../user/common/paging.jsp"%>
    <%@include file="../common/notification.jsp"%>
</div>
<%@include file="../common/script.jsp" %>
<script src="/assets/js/vue/admin.nav.js?t=<%=new Date().getTime()%>"></script>
<script src="/assets/js/vue/vue.articles.js?t=<%=new Date().getTime()%>"></script>
<script src="/assets/js/vue/vue.paging.js?t=<%=new Date().getTime()%>"></script>
<script src="/assets/js/vue/vue.notification.js?t=<%=new Date().getTime()%>"></script>
<script src="/assets/js/vue/admin.search.js?t=<%=new Date().getTime()%>"></script>
<script src="/assets/js/vue/vue.init.js?t=<%=new Date().getTime()%>"></script>
<script src="/assets/js/vue/vue.head.js"></script>
</div>

</body>
</html>
