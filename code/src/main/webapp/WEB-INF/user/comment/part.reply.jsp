<%--
  Created by IntelliJ IDEA.
  User: seiryuukyuu
  Date: 2017/5/14
  Time: 01:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="comments-form">
    <h4>Leave a comment</h4>
    <div class="row">
        <div id="reply" v-bind:class="{ hidden : isHidden }">
            <div class="col-sm-6">
                <label>Your Name:</label>
                <input v-model="comment.nickname" type="text" name="Name" placeholder="Type name here" required="required">
            </div>
            <div class="col-sm-6">
                <label>Your Site:</label>
                <input v-model="comment.site" type="text" name="Site" placeholder="Type your site here" required="required">
            </div>
            <div class="col-sm-6">
                <label>Email Address:</label>
                <input v-model="comment.email" type="email" name="Email" placeholder="you@mailprovider.com" required="required">
            </div>
            <div class="col-sm-12">
                <label>Comment:</label>
                <textarea v-model="comment.content" rows="4" name="Message" placeholder="Message" required="required"></textarea>
            </div>
            <div class="col-sm-3">
                <hr />
                <button class="btn btn--primary" type="submit" v-on:click="onSubmit"> Submit </button>
            </div>
        </div>
    </div>
    <!--end row-->
</div>
