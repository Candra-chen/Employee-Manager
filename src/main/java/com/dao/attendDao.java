package com.dao;

import com.pojo.attends;
import com.pojo.dept;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface attendDao {
    List<Map<String, Object>> ShowDA(int eid);
    List<Map<String, Object>> ShowDA1();
    Map<String, Object> fixById(int aid);
    void Fix(attends attends);
    void delete(int aid);
    void toAdd(attends attends);
    List<Map<String, Object>> selectAllAttendsByPage(Map<String, Object> map);
    List<Map<String, Object>> selectAllAttendsByPage1(Map<String, Object> map);

}
