package cn.xianyu.dao;

import cn.xianyu.domain.Product;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IProductDao {
    //根据id查询产品
    @Select("select * from product where id = #{id}")
    public Product findById(Integer id) throws Exception;

    //查询所有产品信息
    @Select("select * from product")
    public List<Product> findAll() throws Exception;

    @Insert("insert into product(productName,cityName,departureTime,productPrice,productDesc,productStatus) " +
            "values(#{productName},#{cityName},#{departureTime},#{productPrice},#{productDesc},#{productStatus})")
    void save(Product product);
}
