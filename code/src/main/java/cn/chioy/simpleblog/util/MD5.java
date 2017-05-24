package cn.chioy.simpleblog.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by seiryuukyuu on 2017/5/24.
 */
public class MD5 {
    private MD5() {
    }

    static String getMD5(String str) {
        String reStr;
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            byte[] bytes = md5.digest(str.getBytes());
            StringBuffer stringBuffer = new StringBuffer();
            for (byte b : bytes){
                int bt = b&0xff;
                if (bt < 16){
                    stringBuffer.append(0);
                }
                stringBuffer.append(Integer.toHexString(bt));
            }
            reStr = stringBuffer.toString();
        } catch (NoSuchAlgorithmException e) {
           throw new RuntimeException("MD5 转换失败！");
        }
        return reStr;
    }

    public static String getMD5U(String str) {
        return getMD5(str).toUpperCase();
    }

    public static String getMD5L(String str) {
        return getMD5(str).toLowerCase();
    }
}
