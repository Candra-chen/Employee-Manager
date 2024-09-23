package com.service;

import com.pojo.dept;
import com.pojo.positions;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface positionsService {
    public String showDP(Model model,Integer pageCur);
    String toFix(Model model, int pid);
    String fix(positions positions , Model model, HttpSession session);
    String toAdd(positions positions, Model model);
    String showAdd(positions positions, Model model, HttpSession session);
}
