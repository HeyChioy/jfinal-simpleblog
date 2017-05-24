<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/14
  Time: 01:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="comments" id="comments" v-bind:class="{ hidden : isHidden }">
    <h3>{{ total() }} Comments</h3>
    <ul class="comments__list">
        <template v-for="(cmt, idx) in comments">
            <li>
                <div class="comment" v-bind:id="makeId(cmt.comment.email , cmt.comment.id)">
                    <div class="comment__avatar">
                        <img v-bind:src="avatar(cmt.comment.email)" v-bind:alt="cmt.comment.nickname">
                    </div>
                    <div class="comment__body">
                        <h5 class="type--fine-print">
                            <a v-bind:href="cmt.comment.site">{{ cmt.comment.nickname }}</a>
                        </h5>
                        <div class="comment__met">
                            <span>{{ date(cmt.comment.createTime) }}</span>
                            <a v-on:click="reply(idx, cmt.comment.nickname)">  回复 TA</a>
                        </div>
                        <div>{{ cmt.comment.content }}</div>
                    </div>
                </div>
                <template v-if="hasReplies(cmt)">
                    <template v-for="r in cmt.replies">
                        <div class="comment" v-bind:id="makeId(r.email,r.id)">
                            <div class="comment__avatar">
                                <img v-bind:src="avatar(r.email)" v-bind:alt="r.nickname">
                            </div>
                            <div class="comment__body">
                                <h5 class="type--fine-print">
                                    <a v-bind:href="r.site">{{ r.nickname }}</a></h5>
                                <div class="comment__met">
                                    <span>{{ date(r.createTime) }}</span>
                                    <a v-on:click="reply(idx, r.nickname)">  回复 TA</a>
                                </div>
                                <div>{{ r.content }}</div>
                            </div>
                        </div>
                    </template>
                </template>
            </li>
        </template>
    </ul>
</div>
