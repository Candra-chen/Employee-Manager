package com.service;

import com.pojo.manager;
import com.sun.net.httpserver.HttpPrincipal;
import com.sun.xml.internal.ws.resources.HttpserverMessages;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface ManagerService {
    String login(manager manager, Model model, HttpSession session);
    String forget(manager manager, Model model, HttpSession session);
    String register(manager manager, Model model, HttpSession session);
    String ShowEmployee(manager manager, Model model, HttpSession session, Integer pageCur,Integer perPageSize);
    String delete(manager manager, Model model, HttpSession session);
    String fix(manager manager, Model model,HttpSession session);
    String LogOut(HttpSession session);
    String fixById1(Model model, int eid);
    String fixP(Model model, manager manager);
}
