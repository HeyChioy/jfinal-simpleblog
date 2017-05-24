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
    <%--
      Created by IntelliJ IDEA.
      User: seiryuukyuu
      Date: 2017/5/22
      Time: 下午5:14
      To change this template use File | Settings | File Templates.
    --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <section>
        <div class="container">
            <div class="row">
                <%@include file="part.comment.left.jsp" %>
                <%@include file="part.comment.right.table.jsp" %>
            </div>
            <!--end of row-->
        </div>
        <!--end of container-->
    </section>
</div>
<%@include file="../common/script.jsp" %>
<script src="/assets/js/vue/admin.nav.js?t=<%=new Date().getTime()%>"></script>
<script src="/assets/js/dt.comment.js?t=<%=new Date().getTime()%>"></script>
<script src="/assets/js/vue/vue.head.js"></script>
</div>

</body>
</html>
