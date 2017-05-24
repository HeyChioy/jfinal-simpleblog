<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/22
  Time: 下午5:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="about" class="col-sm-4">
    <div class="boxed bg--secondary boxed--lg boxed--border">
        <h4>关于此评论</h4>
        <ul class="comments__list" v-if="show">
           <li>
               <div class="comment">
                   <div class="comment__avatar">
                       <img v-bind:src="avatar(data.root.email)" v-bind:alt="data.root.nickname">
                   </div>
                   <div class="comment__body">
                       <h5 class="type--fine-print">
                           <a v-bind:href="data.root.site">{{ data.root.nickname }}</a>
                       </h5>
                       <div class="comment__met">
                           <span>{{ date(data.root.createTime) }}</span>
                           <a v-on:click="del(data.root.id)">  删除</a>
                       </div>
                       <div>{{ data.root.content }}</div>
                   </div>
               </div>
               <template v-for="r in data.children">
                   <div class="comment">
                       <div class="comment__avatar">
                           <img v-bind:src="avatar(r.email)" v-bind:alt="r.nickname">
                       </div>
                       <div class="comment__body">
                           <h5 class="type--fine-print">
                               <a v-bind:href="r.site">{{ r.nickname }}</a></h5>
                           <div class="comment__met">
                               <span>{{ date(r.createTime) }}</span>
                               <a v-on:click="del(r.id)">  删除</a>
                           </div>
                           <div>{{ r.content }}</div>
                       </div>
                   </div>
               </template>
           </li>
        </ul>
    </div>
</div>
