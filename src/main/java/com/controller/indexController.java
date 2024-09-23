package com.controller;

import com.pojo.dept;
import com.pojo.manager;
import com.pojo.positions;
import com.service.indexService;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.jws.WebParam;

@Controller
@RequestMapping("/homes")
public class indexController {
    @Autowired
    private indexService indexService;
    @RequestMapping("/toLogin")
    public String toLogin(Model model) {
        return indexService.toLogin(model);
    }
    @RequestMapping("/toRegister")
    public String toRegister(Model model, dept dept, positions positions)
    {
        return indexService.toRegister(model,dept,positions);
    }
    @RequestMapping("/forget")
    public String forget(Model model)
    {
        return indexService.forget(model);
    }
    @RequestMapping("/toFix")
    public String toFix(Model model,int eid)
    {
        System.out.println("hh"+eid);
        return  indexService.fixById(model,eid);
    }
    @RequestMapping("/toFix1")
    public String toFix1(Model model,int eid)
    {
        System.out.println("hh"+eid);
        return  indexService.fixById(model,eid);
    }

    @RequestMapping("/indexh")
    public String indexh()
    {
        return  indexService.indexh();
    }
}
