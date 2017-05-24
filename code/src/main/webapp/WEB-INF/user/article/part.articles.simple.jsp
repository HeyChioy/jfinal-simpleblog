<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/13
  Time: 23:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section class="space--sm">
    <div class="container">
        <div class="row">
            <div class="col-sm-10 col-md-8 col-sm-offset-1 col-md-offset-2">
                <div id="articles" v-bind:class="{ hidden : isHidden }" class="masonry masonry-blog-list">
                    <hr>
                    <template v-for="article in pager.list">
                        <div class="masonry__container masonry--active">
                            <article class="masonry__item filter-education" data-masonry-filter="Education">
                                <div class="article__title text-center">
                                    <a v-on:click="read(article.id)">
                                        <h2>{{article.title}}</h2>
                                    </a>
                                    <span>{{date(article.createTime)}}</span>
                                </div>
                                <!--end article title-->
                                <div class="article__body">
                                    <a>
                                        <img alt="Image" v-bind:src="getImage(article.content)">
                                    </a>
                                    <div>
                                        {{summary(article.content)}}
                                    </div>
                                    <a v-on:click="read(article.id)">Continue reading »</a>
                                </div>
                            </article>
                        </div>
                    </template>
                </div>
            </div>
        </div>
    </div>
</section>


