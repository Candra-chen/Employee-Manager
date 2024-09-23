package com.dao;

import com.pojo.income;
import com.pojo.manager;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
@Mapper
public interface incomeDao {
    List<Map<String, Object>> ShowDI1();
    List<Map<String, Object>> ShowDI(Integer eid);
    List<Map<String, Object>> selectAllInComeByPage1(Map<String, Object> map);
    List<Map<String, Object>> selectAllInComeByPage(Map<String, Object> map);
    income fixById1(int id);
    void fix(income income);
    void delete(int id);
    void toAdd(income income);
}
