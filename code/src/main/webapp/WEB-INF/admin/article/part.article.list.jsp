<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/16
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="tabs-container text-center">
    <div class="tab__content">
        <section>
            <div class="container">
                <div class="row">
                    <div class="masonry">
                        <div id="articles" class="masonry__container">
                            <template v-for="article in pager.list">
                                <div class='col-sm-4 masonry__item'>
                                    <div class='card card-1 boxed boxed--sm boxed--border'
                                         class='card__avatar'>
                                        <div style='cursor: pointer' v-on:click="read(article.id)"
                                        class='card__top' >
                                            <div >
                                                <span><strong>{{ article.title }}</strong></span></div>
                                        </div>
                                        <div style='cursor: pointer' v-on:click="read(article.id)" class='card__body'>
                                            <p> {{ summary(article.content) }} </p>
                                        </div>
                                        <div class='card__bottom'>
                                            <ul class='list-inline'>
                                                <li>
                                                    <div class='card__action'>
                                                        <a style='cursor: pointer' v-on:click='edit(article.id)'>
                                                            <i class='material-icons'>edit</i></a></div>
                                                </li>
                                                <li>
                                                    <div class='card__action'>
                                                        <a style='cursor: pointer' v-on:click='del(article.id, article.status)'>
                                                            <i class='material-icons'>delete</i></a></div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </template>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
