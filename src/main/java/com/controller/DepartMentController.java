package com.controller;

import com.pojo.dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/dept")
public class DepartMentController {
    @Autowired
    com.service.departmentService departmentService;
    @RequestMapping("/showDE")
    public String showD(Model model, Integer pageCur)
    {
        return departmentService.showD(model,pageCur);
    }
    @RequestMapping("/toFix")
    public String tofix(Model model,int did)
    {
        return departmentService.toFix(model,did);
    }
    @RequestMapping("/Fix")
    public String fix(@ModelAttribute dept dept ,Model model,HttpSession session)
    {
        return departmentService.fix(dept,model,session);
    }
    @RequestMapping("/toAdd")
    public String toAdd(@ModelAttribute dept dept,Model model)
    {
       return departmentService.toAdd(dept,model);
    }
    @RequestMapping("/ShowAdd")
    public String ShowAdd(dept dept,Model model,HttpSession session)
    {
        return departmentService.showAdd(dept,model,session);
    }

}
