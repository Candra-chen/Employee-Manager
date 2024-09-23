package com.controller;

import com.pojo.attends;
import com.pojo.dept;
import com.pojo.manager;
import com.service.attendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/attend")
public class attendController {
    @Autowired
    com.service.attendService attendService;
    @RequestMapping("/showDA")
    public String showDA(Model model, Integer pageCur,Integer perPageSize,Integer eid,Integer type,HttpSession session)
    {   eid=Integer.parseInt(session.getAttribute("eid").toString());
        type=Integer.parseInt(session.getAttribute("type").toString());
        System.out.println(eid+"showDA"+type);
        return attendService.showDA(model,pageCur,perPageSize,eid,type);
    }
    @RequestMapping("/toFix")
    public String tofix(Model model, Integer aid)
    {
        return attendService.toFix(model,aid);
    }
    @RequestMapping("/Fix")
    public String fix(@ModelAttribute attends attends, Model model, HttpSession session)
    {
        return attendService.fix(attends,model,session);
    }
    @RequestMapping("/toAdd")
    public String toAdd(@ModelAttribute attends attends,Model model)
    {
        return attendService.toAdd(attends,model);
    }
    @RequestMapping("/ShowAdd")
    public String ShowAdd(attends attends,Model model,HttpSession session)
    {
        return attendService.showAdd(attends,model,session);
    }
    @RequestMapping("/delete")
    public String delete(int aid, Model model, HttpSession session)
    {
        return attendService.delete(aid,model,session);
    }
}
