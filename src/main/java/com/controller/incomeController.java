package com.controller;

import com.pojo.dept;
import com.pojo.income;
import com.pojo.manager;
import com.service.incomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/income")
public class incomeController {
    @Autowired
    com.service.incomeService incomeService;
    @RequestMapping("/showDI")
    public String showDA(Model model, Integer pageCur, Integer perPageSize, Integer eid, Integer type, HttpSession session)
    {   eid=Integer.parseInt(session.getAttribute("eid").toString());
        type=Integer.parseInt(session.getAttribute("type").toString());
        System.out.println(eid+"showDA"+type);
        return incomeService.showDI(model,pageCur,perPageSize,eid,type);
    }
    @RequestMapping("/toFix1")
    public String toFix1(Model model,int id)
    {
        System.out.println("hh"+id);
        return  incomeService.fixById(model,id);
    }
    @RequestMapping("/fix")
    public String fix(@ModelAttribute income income, Model model, HttpSession session)
    {
        System.out.println(income.getDid()+"fix1");
        return incomeService.fix(income,model,session);
    }
    @RequestMapping("/delete")
    public String delete(@ModelAttribute income income, Model model, HttpSession session)
    {
        return incomeService.delete(income,model,session);
    }
    @RequestMapping("/toAdd")
    public String toAdd(@ModelAttribute income income, Model model)
    {
        return incomeService.toAdd(income,model);
    }
    @RequestMapping("/ShowAdd")
    public String ShowAdd(income income,Model model,HttpSession session)
    {
        return incomeService.showAdd(income,model,session);
    }
}
