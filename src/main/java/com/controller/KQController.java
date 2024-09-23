package com.controller;

import com.pojo.check1;
import com.pojo.positions;
import com.service.KQService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;

@Controller
@RequestMapping("/KQ")
public class KQController {
     @Autowired
    KQService kqService;
    @RequestMapping("toKQ")
    public String showD(Model model,Integer pageCur,Integer perPageSize,Integer eid,Integer type)
    {
        return kqService.toKQ(model,pageCur,perPageSize,eid,type);
    }
    @RequestMapping("/ShowAdd")
    public String ShowAdd(Timestamp t, check1 check1, Model model, HttpSession session,int eid) throws ParseException {
        java.util.Date date = new Date();//获得当前时间
             t = new Timestamp(date.getTime());
        System.out.println(t);
            return kqService.showAdd(t,check1,model,session,eid);
    }

}
