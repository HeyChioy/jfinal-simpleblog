/**
 * Created by seiryuukyuu on 2017/5/13.
 */
;(function () {
    console.log("auto init start...")
    for (var a in BLOG) {
       if(typeof BLOG[a].load == "function"){
           BLOG[a].load();
       }
    }
    console.log("init complete!")
})();
