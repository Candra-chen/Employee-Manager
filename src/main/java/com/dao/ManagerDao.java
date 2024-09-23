package com.dao;

import com.pojo.dept;
import com.pojo.manager;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface ManagerDao {
     manager login(manager manager);
     String forget(String username);
      void register(manager manager);
    List<Map<String, Object>>ShowEmployee();
       void delete(int eid);
       void fix(manager manager);
    List<Map<String, Object>>selectAllManagerByPage(Map<String, Object> map);
    manager fixById1(int eid);
    void fixP(manager manager);
}
