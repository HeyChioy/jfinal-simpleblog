<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/13
  Time: 23:13
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE HTML>
<html>
<%@include file="../common/head.jsp" %>
<body>

<%--<%@include file="../common/nav.jsp" %>--%>

<div class="main-container">


    <%@include file="../common/banner.jsp"%>

    <div id="totop-target"></div>

    <%@include file="part.post.jsp" %>

    <%@include file="../comment/comment.jsp" %>

    <%@include file="../common/totop.jsp"%>

    <%@include file="../common/notification.jsp"%>

</div>
<%--<%@include file="../common/paging.jsp" %>--%>
<%@include file="../common/footer.jsp" %>
<%@include file="../common/script.jsp" %>
<% long date = new Date().getTime(); %>
<script src="/assets/js/vue/vue.head.js"></script>
<script src="/assets/js/vue/vue.posts.js?t=<%=date%>"></script>
<script src="/assets/js/vue/vue.comments.js?t=<%=date%>"></script>
<script src="/assets/js/vue/vue.footer.js?t=<%=date%>"></script>
<script src="/assets/js/vue/vue.replies.js?t=<%=date%>"></script>
<script src="/assets/js/vue/vue.notification.js?t=<%=date%>"></script>
<script src="/assets/js/vue/vue.component.totop.js"></script>
<script src="/assets/js/vue/vue.totop.js?t=<%=date%>"></script>
<script src="/assets/js/vue/vue.init.js?t=<%=date%>"></script>
</body>
</html>