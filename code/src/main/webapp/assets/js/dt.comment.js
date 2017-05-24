/**
 * Created by seiryuukyuu on 2017/5/23.
 */
;(function () {
    const datatable = $("#datatable").DataTable({
        ajax: {
            url: "/comment/listAll",
            dataSrc: "data",
            order: [[0, "desc"]]
        }
        , columnDefs: [
            {
                targets: 0, title: "ID", data: "id", render: function (data, type, row, meta) {
                return data;
            }
            }
            , {
                targets: 1, title: "NickName", data: "nickname", render: function (data, type, row, meta) {
                    var link = "<a href='site' target='_blank'>" + data + "</a>";
                    return link.replace("site", row.site);
                }
            }
            , {
                targets: 2, title: "Article", data: "title", render: function (data, type, row, meta) {
                    var link = "<a href='/article/read/ID' target='_blank'>《" + data + "》</a>";
                    return link.replace("ID", row.article);
                }
            }
            , {
                targets: 3, title: "Content", data: "content", render: function (data, type, row, meta) {
                    return data;
                }
            }
            , {
                targets: 4, title: "Options", data: "", render: function (data, type, row, meta) {
                    return "<div class='btn btn-group'>" +
                        "<a class='btn btn-xs  btn--sm' onclick='loadAbout(" + row.id + ")'>" +
                        "<span class='btn__text'>About</span>" +
                        "</a>" +
                        "<a class='btn btn-xs  btn--sm' onclick='delComment(" + row.id + ")'>" +
                        "<span class='btn__text'>DEL</span>" +
                        "</a>" +
                        "</div>";
                }
            }
        ]
    });

    const about = new Vue({
        el: "#about",
        data: {
            data: {root: {content: "暂无数据"}, children: []}
            , show: false
        },
        methods: {
            del: function (id) {
                const me = this;
                $.ajax({
                    url: "/comment/realDelete/" + id,
                    method: "DELETE",
                    success: function (data) {
                        me.data = {root: {content: "暂无数据"}, children: []};
                        me.show = false;
                        datatable.ajax.reload();
                    }
                });
            }
            , avatar: function (email) {
                return BLOGUTILS.avatar(email);
            }
            , date: function (str) {
                return BLOGUTILS.date(str);
            }
        }
    });

    window.loadAbout = function loadAbout(cmtId) {
        $.post("/comment/listAbout/" + cmtId, "", function (data) {
            about.data = data.data;
            about.show = true;
        });
    };

    window.delComment = function del(cmtId) {
        $.ajax({
            url: "/comment/delete/" + cmtId,
            method: "DELETE",
            success: function (data) {
                console.log(datatable);
                datatable.ajax.reload();
            }
        });
    };

})();
