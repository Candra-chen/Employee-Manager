package com.service;

import com.dao.incomeDao;
import com.dao.shipDao;
import com.pojo.positions;
import com.pojo.ship;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class shipServiceImpl  implements shipService{
    @Autowired
    com.dao.shipDao shipDao;
    @Override
    public String showDS(Model model, Integer pageCur, Integer perPageSize, Integer eid, Integer type) {
        System.out.println("ship");
        List<Map<String, Object>> shipList=shipDao.ShowS1();
        System.out.println("ship");
        if(type==2)shipList=shipDao.ShowS(eid);
        int temp=shipList.size();
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
        map.put("eid",eid);
        System.out.println(type);
        map.put("type",type);
        System.out.println(eid+"eid1");
        System.out.println(5+"perpagesize");
        shipList = shipDao.selectAllShipByPage1(map);
        if(type==2)shipList = shipDao. selectAllShipByPage(map);
        model.addAttribute("shipList",shipList);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("pageCur", pageCur);
        model.addAttribute("eid",eid);
        model.addAttribute("type",type);
        return "ship";
    }

    @Override
    public String showAdd(ship ship, Model model, HttpSession session) {
        return "AddShip";
    }

    @Override
    public String toFix(Model model, Integer sid) {
        System.out.println(sid+"toFix1");
        Map<String, Object> ship=shipDao.fixById(sid);
        System.out.println(sid+"toFix2");
        model.addAttribute("ship",ship);
        System.out.println("aidaid4");
        return "fixShip";
    }

    @Override
    public String fix(ship ship, Model model, HttpSession session) {
        shipDao.Fix(ship);
        System.out.println(ship.getSid()+"1111");
        session.setAttribute("msge","修改成功");
        return "forward:/ship/toFix?sid="+ship.getSid();
    }

    @Override
    public String toAdd(ship ship, Model model) {
        shipDao.toAdd(ship);
        return "forward:/ship/showS";
    }
}
