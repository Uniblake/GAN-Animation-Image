package com.example.framework.core.exception;

/**
 * @author 夏之阳
 * 创建时间：2016-03-14 15:27
 * 创建说明：项目异常基类
 */

public class AppRuntimeException extends RuntimeException {
    public AppRuntimeException(String message) {
        super(message);
    }

    public AppRuntimeException(String message, Throwable cause) {
        super(message, cause);
    }

    public AppRuntimeException(Throwable cause) {
        super(cause);
    }
}
