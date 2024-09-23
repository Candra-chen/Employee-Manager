package com.service;

import com.dao.attendDao;
import com.dao.deptDao;
import com.dao.indexDao;
import com.pojo.attends;
import com.pojo.dept;
import com.pojo.positions;
import com.sun.deploy.security.SelectableSecurityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class attendServiceImpl implements attendService{
    @Autowired
    com.dao.attendDao attendDao;
    @Autowired
    com.dao.indexDao indexDao;
    @Override
    public String showDA(Model model, Integer pageCur,Integer perPageSize,Integer eid,Integer type) {
        List<Map<String, Object>> attendList=attendDao.ShowDA1();
        if(type==2)
            attendList=attendDao.ShowDA(eid);
//        model.addAttribute("attendList",attendList);
        int temp=attendList.size();
        System.out.println(temp+"showDa报错");
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
        System.out.println(eid+"eid1");
        System.out.println(5+"perpagesize");
        attendList = attendDao. selectAllAttendsByPage1(map);
        if(type==2)
        attendList = attendDao. selectAllAttendsByPage(map);
        model.addAttribute("attendList",attendList);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("pageCur", pageCur);
        model.addAttribute("eid",eid);
        model.addAttribute("type",type);
        return "attends";
    }

    @Override
    public String toFix(Model model, Integer aid) {
        System.out.println(aid+"toFix1");
        Map<String, Object> attends=attendDao.fixById(aid);
        System.out.println(aid+"toFix2");
        List<positions> positionsList=indexDao.view2();
        System.out.println(positionsList.get(0).getPname());
        System.out.println(aid+"toFix3");
        model.addAttribute("attends",attends);
        model.addAttribute("positionsList",positionsList);
        System.out.println("aidaid4");
        return "fixAttend";
    }

    @Override
    public String showAdd(attends attends, Model model, HttpSession session) {
        System.out.println("showAdd");
        List<positions>positionsList=indexDao.view2();
        System.out.println(positionsList.get(0).getPname());
        model.addAttribute("positionList",positionsList);
        return "Addattends";
    }

    @Override
    public String toAdd(attends attends, Model model) {
        System.out.println("toAdd"+attends.getStartd());
        long miliseconds = System.currentTimeMillis();
        Date date = new Date(miliseconds);
        System.out.println(date+"toAdd");
        if(attends.getStartd().before(date)&&attends.getEndd().after(date))
            attends.setStaut("正在进行中");
        else if(attends.getStartd().before(date)&&attends.getEndd().before(date))
            attends.setStaut("已经结束");
        else if(attends.getEndd().after(date)&&attends.getEndd().after(date))
            attends.setStaut("还没开始");
        attendDao.toAdd(attends);
        return "forward:/attend/showDA";
    }

    @Override
    public String fix(attends attends, Model model, HttpSession session) {
        long miliseconds = System.currentTimeMillis();
        Date date = new Date(miliseconds);
        if(attends.getStartd().before(date)&&attends.getEndd().after(date))
            attends.setStaut("正在进行中");
        else if(attends.getStartd().before(date)&&attends.getEndd().before(date))
            attends.setStaut("已经结束");
        else if(attends.getEndd().after(date)&&attends.getEndd().after(date))
            attends.setStaut("还没开始");
        attendDao.Fix(attends);
        session.setAttribute("msge","修改成功");
        System.out.println("部门修改成功"+attends.getPid());
        return "forward:/attend/toFix";
    }

    @Override
    public String delete(int aid, Model model, HttpSession session) {
        System.out.println(Integer.parseInt(session.getAttribute("eid").toString())+Integer.parseInt(session.getAttribute("type").toString()));
        attendDao.delete(aid);
        return "forward:/attend/showDA?eid="+Integer.parseInt(session.getAttribute("eid").toString())+"&type="+Integer.parseInt(session.getAttribute("type").toString());
    }
}
