package com.service;

import com.pojo.dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class departmentServiceImpl implements departmentService{
    @Autowired
    com.dao.deptDao deptDao;
   @Override
    public String showD(Model model, Integer pageCur) {
        List<dept>deptList=deptDao.showD();
        int temp=deptList.size();
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
       deptList = deptDao.selectAllDeptByPage(map);
       model.addAttribute("deptList",deptList);
       model.addAttribute("totalPage", totalPage);
       model.addAttribute("pageCur", pageCur);
       return "dept";
    }

    @Override
    public String toFix(Model model,int did) {
        dept dept=deptDao.fixById(did);
        model.addAttribute("dept",dept);
        return "fixDept";
    }

    @Override
    public String fix(dept dept, Model model,HttpSession session) {
        deptDao.Fix(dept);
        session.setAttribute("msge","修改成功");
        System.out.println("部门修改成功"+dept.getDid());
        return "forward:/dept/toFix";
    }

    @Override
    public String showAdd(dept dept, Model model, HttpSession session) {
        return "AddDept";
    }

    @Override
    public String toAdd(dept dept, Model model) {
        deptDao.toAdd(dept);
        return "forward:/dept/showDE";
    }
}
