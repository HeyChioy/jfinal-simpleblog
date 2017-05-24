<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/24
  Time: 下午3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="../common/head.jsp" %>
<body>
<%@include file="../common/nav.light.jsp" %>
<div class="main-container">
    <div class="bg--secondary space--sm">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="boxed bg--secondary boxed--lg boxed--border">
                        <%@include file="part.image.upload.jsp"%>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="boxed boxed--lg boxed--border">
                        <%@include file="part.image.list.jsp" %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../common/script.jsp" %>
<script src="/assets/js/vue/admin.nav.js"></script>
<script src="/assets/js/vue/vue.head.js"></script>
<script src="/assets/js/vue/vue.images.js?t=<%=new Date().getTime()%>"></script>
</body>
</html>


