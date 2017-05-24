<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/18
  Time: 下午9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="../common/head.jsp"%>
<body>

<form id="upload" enctype="multipart/form-data">
    <input id="file" type="file" name="file"/>
    <button id="up" type="button">upload</button>
</form>

<%@include file="../common/script.jsp"%>
<script>
    $("#up").click(function () {
        $.ajax({
            type: "POST",
            data: new FormData($("#upload")[0]),
            url: "/file/upload",
            processData: false,
            contentType: false
        }).done(function(data){
            console.log(data);
        }).fail(function (data) {
            console.log(data);
        });
    });
</script>
</body>
</html>
