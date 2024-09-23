package com.service;

import com.pojo.dept;
import com.pojo.manager;
import com.pojo.positions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class indexServiceImpl implements indexService{
    @Autowired
    com.dao.indexDao indexDao;
    @Override
    public String toLogin(Model model) {

            model.addAttribute("manager", new manager());
            return "login";
    }

    @Override
    public String toRegister(Model model, dept dept, positions positions) {
//        model.addAttribute("rmanager",new manager());
        List<dept>deptList =indexDao.view1();
       List<positions> positionsList=indexDao.view2();
//        System.out.println(deptList.indexOf("did"));
       model.addAttribute("deptList",deptList);
       model.addAttribute("positionsList",positionsList);
        return "register";
    }

    @Override
    public String forget(Model model) {
        return "forget";
    }

    @Override
    public String fixById(Model model, int eid) {
        System.out.println("fixById1"+eid);
        Map<String,Object> manager=indexDao.fixById(eid);
        System.out.println("fixById2");
        List<dept>deptList =indexDao.view1();
        List<positions> positionsList=indexDao.view2();
//        System.out.println();
        System.out.println(manager.get("indate"));
        model.addAttribute("deptList",deptList);
        model.addAttribute("positionsList",positionsList);
        model.addAttribute("fixManager",manager);
        model.addAttribute("eid",eid);
        return "fix";
    }

    @Override
    public String indexh() {
        return "employee";
    }


}
