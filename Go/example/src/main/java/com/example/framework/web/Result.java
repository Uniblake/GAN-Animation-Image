package com.example.framework.web;

/**
 * @author 夏之阳
 * 创建时间：2016-03-14 15:20
 * 创建说明：网络通信返回结果的封装
 */

public class Result {
    /**
     * 是否成功
     */
    private boolean success;
    /**
     * 返回结果
     */
    private Object value;
    /**
     * 状态
     */
    private int state;
    /**
     * 消息
     */
    private String message;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
