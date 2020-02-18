package cn.xianyu.dao;

import cn.xianyu.domain.People;
import org.apache.ibatis.annotations.Select;

public interface IPeopleDao {
    @Select("select * from people where id = #{id}")
    public People findById(String id) throws Exception;
}
