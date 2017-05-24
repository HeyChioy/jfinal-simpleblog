<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/24
  Time: 下午2:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="images" class="masonry">
    <div class="masonry__container">
        <template v-for="(image, idx) in images">
            <div class="col-sm-6 masonry__item">
                <a v-bind:href="image.src" data-lightbox="true">
                    <img v-bind:src="image.src" v-bind:alt="image.title" class="file-image">
                </a>
                <a v-on:click="makeLink(image)" style="cursor:pointer; color: #00acd6;"> 获取链接</a>
                <a v-on:click="del(idx)" style="cursor:pointer; color: red;">删除</a>
            </div>
        </template>
    </div>
</div>
