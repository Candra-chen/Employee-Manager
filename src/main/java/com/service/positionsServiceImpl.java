package com.service;

import com.dao.ManagerDao;
import com.dao.posDao;
import com.pojo.dept;
import com.pojo.positions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class positionsServiceImpl implements positionsService{
    @Autowired
    com.dao.posDao posDao;
    @Override
    public String showDP(Model model,Integer pageCur) {
        List<positions> posList=posDao.showDP();
        //111
        int temp=posList.size();
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
        posList = posDao.selectAllPosByPage(map);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("pageCur", pageCur);
        model.addAttribute("posList",posList);
        return "positions";
    }
    @Override
    public String toFix(Model model, int pid) {
        positions positions=posDao.fixById(pid);
        model.addAttribute("pos",positions);
        return "fixPos";
    }

    @Override
    public String fix(positions positions, Model model, HttpSession session) {
        posDao.Fix(positions);
        session.setAttribute("msge","修改成功");
        System.out.println("职务修改成功"+positions.getPid());
        return "forward:/positions/toFix";
    }
    @Override
    public String showAdd(positions positions, Model model, HttpSession session) {
        return "AddPos";
    }

    @Override
    public String toAdd(positions positions, Model model) {
       posDao.toAdd(positions);
        return "forward:/positions/showDP";
    }
}
