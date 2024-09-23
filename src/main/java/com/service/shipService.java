package com.service;

import com.pojo.ship;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface shipService {
    String showDS(Model model, Integer pageCur, Integer perPageSize, Integer eid, Integer type);
    String showAdd(ship ship, Model model, HttpSession session);
    String toFix(Model model, Integer sid);
    String fix(ship ship, Model model, HttpSession session);
    String toAdd(ship ship, Model model);
}
