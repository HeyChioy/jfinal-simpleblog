package cn.chioy.simpleblog.util;

/**
 * Created by seiryuukyuu on 2017/4/27.
 */
public class Result {
    private int code;
    private String msg;
    private Object data;

    public Result(int code) {
        this.code = code;
        autoSetMsg();
    }

    public Result(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }


    public Result(int code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    private void autoSetMsg() {
        if (this.code == Constant.ResultCode.SUCCESS) {
            this.msg = Constant.Strings.SUC_MSG;
        } else if (this.code == Constant.ResultCode.ERROR) {
            this.msg = Constant.Strings.ERR_MSG;
        } else if (this.code == Constant.ResultCode.MISSING) {
            this.msg = Constant.Strings.MIS_PRM;
        }
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
