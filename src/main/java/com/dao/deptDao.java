package com.dao;

import com.pojo.dept;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface deptDao {
   List<dept> showD();
   dept fixById(int did);
   void Fix(dept dept);
   void toAdd(dept dept);
   List<dept> selectAllDeptByPage(Map<String, Object> map);

}
