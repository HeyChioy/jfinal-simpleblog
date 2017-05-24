<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/13
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
    <div class="masonry masonry-blog-list">
        <hr/>
        <div class="col-xs-8 col-sm-10 col-md-8 col-xs-offset-2 col-sm-offset-1 col-md-offset-2">
            <article id="post">
                <div class="article__title text-center">
                    <h1 class="h2">{{article.title}}</h1>
                    <span>{{date(article.createTime)}}</span>
                </div>
                <div class="article__body" v-html="convert(article.content)"></div>
            </article>
        </div>
    </div>
</div>
