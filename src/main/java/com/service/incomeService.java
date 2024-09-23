package com.service;

import com.pojo.income;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface incomeService {
    String showDI(Model model, Integer pageCur, Integer perPageSize, Integer eid, Integer type);
    String fixById(Model model, int id);
    String fix(income income, Model model, HttpSession session);
    String delete(income income, Model model, HttpSession session);
    String toAdd(income income, Model model);
    String showAdd(income income, Model model, HttpSession session);
}
