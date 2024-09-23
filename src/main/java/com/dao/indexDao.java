package com.dao;

import com.pojo.dept;
import com.pojo.manager;
import com.pojo.positions;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
@Mapper
public interface indexDao {
   List<dept> view1();
   List<positions> view2();
   Map<String,Object> fixById(int eid);
}
