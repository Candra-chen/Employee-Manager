package com.controller;
import com.pojo.manager;
import com.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/manager")
public class Manager_LoginController {
    @Autowired
    ManagerService managerService;
    @RequestMapping("/login")
    public String login(@ModelAttribute manager manager, Model model, HttpSession session)
    {
        return managerService.login(manager,model,session);
    }
    @RequestMapping("/register")
    public String register(@ModelAttribute manager manager, Model model, HttpSession session)
    {
        return managerService.register(manager,model,session);
    }
@RequestMapping("/forget")
public String forget(@ModelAttribute manager manager, Model model, HttpSession session)
{
    return managerService.forget(manager,model,session);
}
    @RequestMapping("/showE")
    public String ShowEmployee(@ModelAttribute manager manager, Model model, HttpSession session, Integer pageCur,Integer perPageSize)
    {
        return managerService.ShowEmployee(manager,model,session,pageCur,perPageSize);
    }
    @RequestMapping("/delete")
    public String delete(@ModelAttribute manager manager, Model model, HttpSession session)
    {
        return managerService.delete(manager,model,session);
    }
    @RequestMapping("/fix")
    public String fix(@ModelAttribute manager manager, Model model,HttpSession session)
    {
        System.out.println(manager.getEid()+"fix1"+manager.getDid());
        return managerService.fix(manager,model,session);
    }
    @RequestMapping("/logout")
    public String LogOut(HttpSession session)
    {   return managerService.LogOut(session);
    }
    @RequestMapping("/ShowE1")
    public String toShowE(Model model,int eid)
    {
        System.out.println("hh"+eid);
        return  managerService.fixById1(model,eid);
    }
    @RequestMapping("/fixPersonal")
    public String fixP(Model model,@ModelAttribute manager manager)
    {
        System.out.println("hh"+manager.getEid());
        return  managerService.fixP(model,manager);
    }
}
