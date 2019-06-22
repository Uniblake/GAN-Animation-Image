package com.example.framework.core.exception;

import com.example.framework.web.Result;
import com.example.framework.web.ResultHelper;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author 夏之阳
 * 创建时间：2016-03-14 15:29
 * 创建说明：异常处理
 */

@ControllerAdvice
public class AppExceptionHandler {
    @ResponseBody
    @ExceptionHandler(AppRuntimeException.class)
    public Result handleKnownException(HttpServletRequest request,AppRuntimeException ex){
        return ResultHelper.newExceptionResult(String.format("程序内部错误: %s", ex.getMessage()), ex);
    }
    @ResponseBody
    @ExceptionHandler(Exception.class)
    public Result handleUnknownException(HttpServletRequest request,Throwable ex){
        return ResultHelper.newExceptionResult(String.format("未知错误: %s", ex.getMessage()),ex);
    }
}
