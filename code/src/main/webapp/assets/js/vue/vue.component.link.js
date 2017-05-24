/**
 * Created by seiryuukyuu on 2017/5/16.
 */
;(function () {
    Vue.component("vue-link", {
        props: ["link", "title", "summary", "id", "editable"]
        , template: "<div class='col-sm-4 masonry__item'>\
                <div class='card card-1 boxed boxed--sm boxed--border'>\
                <div class='card__top'>\
                <div style='cursor: pointer' class='card__avatar' ><span><strong>{{ title }}</strong></span></div>\
                </div>\
                \
                <div class='card__body'><p> {{ summary }} </p></div>\
                \
                <div class='card__bottom' v-if='editable'>\
                <ul class='list-inline'>\
                    <li>\
                        <div class='card__action'>\
                            <a style='cursor: pointer' v-on:click='edit(id)'><i class='material-icons' >edit</i></a>\
                        </div>\
                     </li>\
                     <li>\
                        <div class='card__action'>\
                            <a  style='cursor: pointer' v-on:click='del(id)'><i class='material-icons'>delete</i></a>\
                        </div>\
                        </li>\
                </ul>\
                </div>\
                </div>\
                </div>"
        , methods: {
            open: function (link) {
                BLOGUTILS.open(link);
            }
            , edit: function (id) {
                localStorage.setItem("link", id);
                this.$emit("edit");
            }
            , del: function (id) {
                localStorage.setItem("link", id);
                this.$emit("delete");
            }
        }
    });
})();
