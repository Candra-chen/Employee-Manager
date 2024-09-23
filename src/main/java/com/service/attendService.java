package com.service;

import com.pojo.attends;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface attendService {
    String showDA(Model model, Integer pageCur,Integer perPageSize,Integer eid,Integer type);
    String toFix(Model model,Integer aid);
    String showAdd(attends attends, Model model, HttpSession session);
    String toAdd(attends attends, Model model);
    String fix(attends attends, Model model, HttpSession session);
    String delete(int aid, Model model, HttpSession session);
}
