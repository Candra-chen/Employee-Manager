package com.service;

import com.pojo.dept;
import com.pojo.manager;
import com.pojo.positions;
import org.springframework.ui.Model;

public interface indexService {
    public String toLogin(Model model);
    public String toRegister(Model model, dept dept, positions positions);
    public String forget(Model model);
    String fixById(Model model, int eid);
    String indexh();
}
