package com.service;

import com.pojo.check1;
import com.pojo.positions;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.ParseException;

public interface KQService {
    String toKQ(Model model,Integer pageCur,Integer perPageSize,Integer eid,Integer type);
    String showAdd(Timestamp t,check1 check1, Model model, HttpSession session,int eid) throws ParseException;
}
