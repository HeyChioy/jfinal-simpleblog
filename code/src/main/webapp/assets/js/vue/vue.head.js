/**
 * Created by seiryuukyuu on 2017/5/22.
 */
;(function () {
    $.post("/config/get",{k:"sitename"},function (data) {
        if(data.data){
            $("title").text(data.data);
        }
    });
})();
