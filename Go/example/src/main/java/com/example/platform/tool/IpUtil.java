package com.example.platform.tool;

import javax.servlet.http.HttpServletRequest;

/**
 * @author 夏之阳
 *         创建时间：2018-07-11 15:43
 *         创建说明：获取IP地址
 */
public class IpUtil {
    /**
     * 获得ip地址
     * @param request http请求
     * @return ip地址
     */
    public static String getIpAddr(HttpServletRequest request) {
        String remoteAddr = request.getRemoteAddr();
        String forwarded = request.getHeader("X-Forwarded-For");
        String realIp = request.getHeader("X-Real-IP");

        String ip = null;
        if (realIp == null) {
            if (forwarded == null) {
                ip = remoteAddr;
            } else {
                ip = remoteAddr + "/" + forwarded.split(",")[0];
            }
        } else {
            if (realIp.equals(forwarded)) {
                ip = realIp;
            } else {
                if(forwarded != null){
                    forwarded = forwarded.split(",")[0];
                }
                ip = realIp + "/" + forwarded;
            }
        }
        return ip;
    }
}
