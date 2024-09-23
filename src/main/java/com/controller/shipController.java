package com.controller;

import com.pojo.attends;
import com.pojo.ship;
import com.service.shipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/ship")
public class shipController {
    @Autowired
    com.service.shipService shipService;
    @RequestMapping("/showS")
    public String showDA(Model model, Integer pageCur, Integer perPageSize, HttpSession session)
    { Integer  eid=Integer.parseInt(session.getAttribute("eid").toString());
      Integer  type=Integer.parseInt(session.getAttribute("type").toString());
        System.out.println(eid+"showDA"+type);
        return shipService.showDS(model,pageCur,perPageSize,eid,type);
    }
    @RequestMapping("/ShowAdd")
    public String ShowAdd(ship ship, Model model, HttpSession session)
    {
        return shipService.showAdd(ship,model,session);
    }
    @RequestMapping("/toFix")
    public String tofix(Model model, Integer sid)
    {
        return shipService.toFix(model,sid);
    }
    @RequestMapping("/Fix")
    public String fix(@ModelAttribute ship ship, Model model, HttpSession session)
    {
        return shipService.fix(ship,model,session);
    }
    @RequestMapping("/toAdd")
    public String toAdd(@ModelAttribute ship ship,Model model)
    {
        return shipService.toAdd(ship,model);
    }

}
