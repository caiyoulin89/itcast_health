package com.itheima.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.itheima.constant.MessageConstant;
import com.itheima.entity.Result;
import com.itheima.pojo.CheckItem;
import com.itheima.service.CheckItemService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/checkitem")
public class CheckItemController {

    @Reference
    private CheckItemService checkItemService;

    /**
     * 新增检查项
     * @param checkItem
     * @return
     */
    @RequestMapping("/add")
    public Result add(@RequestBody CheckItem checkItem){
        try {
            System.out.println("CheckItemController的add");
            checkItemService.add(checkItem);
        }catch (Exception e){
            e.printStackTrace();
            return  new Result(false, MessageConstant.ADD_CHECKITEM_FAIL);
        }

        return  new Result(true, MessageConstant.ADD_CHECKITEM_SUCCESS);
    }

}
