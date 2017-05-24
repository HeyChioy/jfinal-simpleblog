/**
 * Created by seiryuukyuu on 2017/5/24.
 */
;(function () {
    const images = new Vue({
        el: "#images",
        data: {
            images: [],
            files: []
        }
        , methods: {
            load: function () {
                const me = this;
                me.images = [];
                $.post("/file/list", "", function (data) {
                    for (var i in data.data) {
                        if (data.data[i].type === "IMAGE") {
                            me.images.push(data.data[i]);
                        } else {
                            me.files.push(data.data[i]);
                        }
                    }
                });
            }
            , del: function (idx) {
                const me = this;
                const url = "/file/delete/" + me.images[idx].id;
                $.post(url, "", function (data) {
                    if (data.code === 200) {
                        me.images.splice(idx, 1);
                    }
                });
            }
            , makeLink: function (img) {
                upload.makeLink(img);
            }
        }
    });
    const upload = new Vue({
        el: "#upload",
        data: {
            markdown: "",
            html: ""
        }
        , methods: {
            upload: function () {
                if (!$("#file").val()) {
                    return;
                }
                const me = this;
                BLOGUTILS.upload(new FormData($("#uploadForm")[0]), function (data) {
                    const img = data.data[0];
                    images.load();
                    me.makeLink(img);
                    $("#file").val("");
                });
            }
            , makeLink: function (img) {
                const me = this;
                if (img) {
                    me.markdown = "![title](link)".replace("title", img.title).replace("link", img.src);
                    me.html = "<img alt='title' src='link' />".replace("title", img.title).replace("link", img.src);
                } else {
                    me.markdown = "";
                    me.html = "";
                }
                BLOGUTILS.scrollTo("#images");
            }
        }
    });
    images.load();
    window.BLOG = window.BLOG || {};
    window.BLOG.images = images;
})();
