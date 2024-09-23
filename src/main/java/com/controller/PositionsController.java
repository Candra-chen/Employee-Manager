package com.controller;

import com.pojo.dept;
import com.pojo.positions;
import com.service.positionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/positions")
public class PositionsController {
    @Autowired
    com.service.positionsService positionsService;
    @RequestMapping("/showDP")
    public String showDP(Model model,Integer pageCur)
    {
        return positionsService.showDP(model,pageCur);
    }
    @RequestMapping("/toFix")
    public String tofix(Model model, int pid)
    {
        return positionsService.toFix(model,pid);
    }
    @RequestMapping("/Fix")
    public String fix(@ModelAttribute positions positions, Model model, HttpSession session)
    {
        return positionsService.fix(positions,model,session);
    }
    @RequestMapping("/toAdd")
    public String toAdd(@ModelAttribute positions positions,Model model)
    {
        return positionsService.toAdd(positions,model);
    }
    @RequestMapping("/ShowAdd")
    public String ShowAdd(positions positions,Model model,HttpSession session)
    {
        return positionsService.showAdd(positions,model,session);
    }

}
