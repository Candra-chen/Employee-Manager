package com.service;

import com.dao.incomeDao;
import com.pojo.income;
import com.pojo.manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class incomeServiceImpl implements  incomeService{
    @Autowired
    com.dao.incomeDao incomeDao;
    @Override
    public String showDI(Model model, Integer pageCur, Integer perPageSize, Integer eid, Integer type) {
        List<Map<String, Object>> incomeList=incomeDao.ShowDI1();
        if(type==2)
            incomeList=incomeDao.ShowDI(eid);
//        model.addAttribute("attendList",attendList);
        int temp=incomeList.size();
        System.out.println(temp+"showDI报错");
        model.addAttribute("totalCount", temp);
        int totalPage = 0;
        if (temp == 0) {
            totalPage = 0;
        } else {
            totalPage = (int) Math.ceil((double) temp / 5);
        }
        if (pageCur == null) {
            pageCur = 1;
        }
        if ((pageCur - 1) * 5> temp) {
            pageCur = pageCur - 1;
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("startIndex", (pageCur - 1) * 5);
        map.put("perPageSize",5);
        map.put("eid",eid);
        System.out.println(type);
        map.put("type",type);
        System.out.println(eid+"id1");
        System.out.println(5+"perpagesize");
        incomeList = incomeDao. selectAllInComeByPage1(map);
        if(type==2)
            incomeList = incomeDao. selectAllInComeByPage(map);
        model.addAttribute("incomeList",incomeList);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("pageCur", pageCur);
        model.addAttribute("eid",eid);
        model.addAttribute("type",type);
        return "income";
    }

    @Override
    public String fixById(Model model, int id) {
        income income=incomeDao.fixById1(id);
        System.out.println(id+"personal");
        model.addAttribute("income",income);
        return "fixincome";
    }
    @Override
    public String fix(income income, Model model, HttpSession session) {
        System.out.println("Eid="+income.getEid());
        incomeDao.fix(income);
        session.setAttribute("msge","修改成功");
        return "forward:/income/toFix1";
    }

    @Override
    public String delete(income income, Model model, HttpSession session) {
        incomeDao.delete(income.getId());
        return "forward:/income/showDI";
    }

    @Override
    public String toAdd(income income, Model model) {
        System.out.println(income.getIreason()+111111);
        incomeDao.toAdd(income);
        return "forward:/income/showDI";
    }

    @Override
    public String showAdd(income income, Model model, HttpSession session) {
        return "AddIncome";
    }
}
