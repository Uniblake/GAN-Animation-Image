package com.example.platform.controller;

import com.example.framework.web.Result;
import com.example.framework.web.ResultHelper;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 夏之阳
 *         创建时间：2018-07-06 09:14
 *         创建说明：接口测试
 */
@RestController
public class TestController {
    @RequestMapping(value = "/test", method = RequestMethod.POST)
    public Result testHandler() {
        return ResultHelper.newSuccessResult("True");
    }
}
