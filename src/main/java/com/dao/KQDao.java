package com.dao;

import com.pojo.check1;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface KQDao {
    List<Map<String, Object>> toKQ(int eid);
    List<Map<String, Object>> toKQ1();
    void addKQ(check1 check1);
    List<Map<String, Object>> selectAllKQByPage1(Map<String, Object> map);
    List<Map<String, Object>> selectAllKQByPage(Map<String, Object> map);
}
