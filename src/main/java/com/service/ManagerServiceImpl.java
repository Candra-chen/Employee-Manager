package com.service;

import com.dao.ManagerDao;
import com.dao.indexDao;
import com.pojo.dept;
import com.pojo.manager;
import com.pojo.positions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.awt.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ManagerServiceImpl implements ManagerService{
    @Autowired
    ManagerDao managerDao;
    @Override
    public String login(manager manager, Model model, HttpSession session) {
        manager manager1= managerDao.login(manager);
        if(manager1!=null)
        {  System.out.println("登录成功");
            session.setAttribute("manager",manager1);
            session.setAttribute("eid",manager1.getEid());
            session.setAttribute("type",manager1.getType());
            model.addAttribute("manager1",manager1);
            System.out.println(manager1.getType()+"tyt "+manager1.getPassword()+"ooo"+manager1.getUsername());
            if(manager1.getType()==1)
            return "head";
            else return "employee";
        }
        else
        {   System.out.println("登录失败");
            model.addAttribute("msg","登录失败");
            return "login";
        }
    }

    @Override
    public String forget(manager manager, Model model, HttpSession session) {
          String manager1=managerDao.forget(manager.getUsername());
          session.setAttribute("password",manager1);
          return "forget";
    }

    @Override
    public String register(manager manager, Model model, HttpSession session) {
      managerDao.register(manager);
      model.addAttribute("msg","注册成功");
      model.addAttribute("amsg","添加成功");
      if(session.getAttribute("manager").equals(null))
      return "register";
      else
          return "forward:/manager/showE?manager=${manager}";
    }

    @Override
    public String ShowEmployee(manager manager, Model model, HttpSession session, Integer pageCur,Integer perPageSize) {
        List<Map<String, Object>> managerList=managerDao.ShowEmployee();
        int temp=managerList.size();
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
        map.put("perPageSize", 5);
        System.out.println(5+"perpagesize");
        managerList = managerDao.selectAllManagerByPage(map);
        model.addAttribute("managerList",managerList);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("pageCur", pageCur);
        return "ShowEmployee";
    }

    @Override
    public String delete(manager manager, Model model, HttpSession session) {
       managerDao.delete(manager.getEid());
        return "forward:/manager/showE";
    }

    @Override
    public String fix(manager manager, Model model,HttpSession session) {
        System.out.println("Eid="+manager.getEid());
        System.out.println(manager.getDid()+"34");
         managerDao.fix(manager);
        System.out.println( manager.getDid());
        session.setAttribute("msge","修改成功");
        return "forward:/homes/toFix";
    }

    @Override
    public String LogOut(HttpSession session) {
        session.setAttribute("manager",null);
        return "login";
    }
    @Override
    public String fixById1(Model model, int eid) {
      manager manager=managerDao.fixById1(eid);
        System.out.println(eid+"personal");
      model.addAttribute("manager1",manager);
        return "personal";
    }

    @Override
    public String fixP(Model model, manager manager) {
        managerDao.fixP(manager);
        return "forward:/manager/ShowE1?eid="+manager.getEid();
    }

}
