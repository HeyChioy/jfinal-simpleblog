/**
 * Created by seiryuukyuu on 2017/5/13.
 */
;(function () {
    const convertor = new showdown.Converter();
    window.BLOGUTILS = {
        rawText: function (html) {
            return this.convert(html).trim().replace(/<[^>]+>/g, " ").replace(/[ \n]{3,}/g, "\n");
        },

        contentSumamry: function (content, bound) {
            bound = bound || 30;
            var t = this.rawText(content).trim();
            const text = t.split("\n").join(" ");
            const final = text.substr(0, bound) + (bound < text.length ? "..." : "");
            // console.log("final:" + final);
            return final;
        },

        getImage: function (content) {
            const images = $(content).find("img");
            const array = {};
            for (var i = 0; i < images.length; i++) {
                array[$(images[i]).attr("src")] = "";
            }
            return Object.keys(array);
        },
        date: function (str) {
            const a = new Date(str).toDateString();
            return a.substr(a.indexOf(" ") + 1);
        },
        convert: function (markdown) {
            return convertor.makeHtml(markdown);
        }
        , scrollTo: function (selector) {
            if (!$(selector).length) {
                throw "找不到滚动对象:" + selector;
            }
            $('html, body').animate({
                scrollTop: $(selector).offset().top
            }, 500);
            console.info("scroll to : " + selector);
        }
        , avatar: function (email) {
            const avatar = "https://www.gravatar.com/avatar/" + md5(email);
            console.info("email:" + email, "\navatar:" + avatar);
            return avatar;
        }
        , newPage: function (url) {
            window.open(url);
        }
        , setObject: function (key, obj) {
            localStorage.setItem(key, JSON.stringify(obj));
        }
        , getObject: function (key) {
            return JSON.parse(localStorage.getItem(key));
        }
        , removeObject: function (key) {
            localStorage.removeItem(key);
        }
        , useObject: function (key) {
            const obj = this.getObject(key);
            this.removeObject(key);
            return obj;
        }
        , upload: function(formData, cbk){
            $.ajax({
                url: '/file/upload',
                type: 'POST',
                cache: false,
                data: formData,
                processData: false,
                contentType: false
            }).done(function(res) {
                cbk(res);
            }).fail(function(res) {
                cbk(res);
            });
        }
    };
})();
