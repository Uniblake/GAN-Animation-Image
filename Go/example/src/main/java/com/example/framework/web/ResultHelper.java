package com.example.framework.web;

import com.example.framework.core.exception.AppRuntimeException;

/**
 * @author 夏之阳
 * 创建时间：2016-03-14 15:23
 * 创建说明：Result生成helper
 */

public class ResultHelper {
    /*--成功的返回--*/

    /**
     * 只生成返回值
     * @param value 返回的value
     * @return 生成的返回值
     */
    public static Result newSuccessResult(Object value){
        return newSuccessResult(value,"");
    }

    /**
     * 生成返回值和消息内容
     * @param value 返回的value
     * @param message 返回的message
     * @return 生成的返回值
     */
    public static Result newSuccessResult(Object value,String message){
        Result result=new Result();
        result.setSuccess(true);
        result.setValue(value);
        result.setMessage(message);
        result.setState(ResultState.SUCCESS);
        return result;
    }
    /*--失败的的返回--*/

    /**
     * 包含消息
     * @param message 消息
     * @return 生成的返回值
     */
    public static Result newFailureResult(String message){
        Result result=new Result();
        result.setSuccess(false);
        result.setValue(null);
        result.setMessage(message);
        result.setState(ResultState.FAILURE);
        return result;
    }

    /*--异常的返回--*/
    public static Result newExceptionResult(String message,Throwable e){
        Result result=new Result();
        result.setSuccess(false);
        result.setValue(null);
        result.setMessage(message);
        if(e instanceof AppRuntimeException){
            result.setState(ResultState.KNOWN_ERROR);
        }else {
            result.setState(ResultState.UNKNOWN_ERROR);
        }
        return result;
    }
}
