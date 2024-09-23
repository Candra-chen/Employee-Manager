package com.service;

import com.pojo.dept;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public interface departmentService {
    String showD( Model model, Integer pageCur);
    String toFix(Model model, int did);
    String fix(dept dept, Model model, HttpSession session);
    String showAdd(dept dept, Model model, HttpSession session);
    String toAdd(dept dept, Model model);
}
