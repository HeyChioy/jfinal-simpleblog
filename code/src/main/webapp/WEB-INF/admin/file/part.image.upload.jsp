<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/24
  Time: 下午3:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="upload">
    <h4>上传图片</h4>
    <form id="uploadForm" class="form" enctype="multipart/form-data">
        <input accept="image/gif, image/jpeg, image/png, image/jpg" id="file" type="file" class="form-control" name="file" v-on:change="upload">
    </form>
    <hr />
    <h4>复制图片代码</h4>
    <div class="row">
        <label for="md" class="col-xs-12">Markdown
            <input type="text" disabled="disabled" v-model="markdown" id="md">
        </label>
    </div>
    <div class="row">
        <label for="html" class="col-xs-12">HTML
            <input type="text" disabled="disabled" v-model="html" id="html">
        </label>
    </div>
</div>
