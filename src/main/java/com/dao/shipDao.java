package com.dao;

import com.pojo.ship;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface shipDao {
    List<Map<String, Object>> ShowS1();
    List<Map<String, Object>> ShowS(Integer eid);
    List<Map<String, Object>> selectAllShipByPage1(Map<String, Object> map);
    List<Map<String, Object>> selectAllShipByPage(Map<String, Object> map);
    Map<String, Object> fixById(Integer sid);
    void Fix(ship ship);
    void toAdd(ship ship);
}
