package com.dao;

import com.pojo.dept;
import com.pojo.positions;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface posDao {
    List<positions> showDP();
    void Fix(positions positions);
    positions fixById(int pid);
    void toAdd(positions positions);
    List<positions> selectAllPosByPage(Map<String, Object> map);
}
