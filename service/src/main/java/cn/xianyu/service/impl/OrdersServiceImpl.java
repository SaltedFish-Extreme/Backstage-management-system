package cn.xianyu.service.impl;

import cn.xianyu.dao.IOrdersDao;
import cn.xianyu.domain.Orders;
import cn.xianyu.service.IOrdersService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrdersServiceImpl implements IOrdersService {
    @Autowired
    private IOrdersDao ordersDao;

    @Override
    public List<Orders> findAll(int page, int size) throws Exception {
        //页码值，每页显示的条数
        PageHelper.startPage(page, size);
        return ordersDao.findAll();
    }

    @Override
    public Orders findById(Integer ordersId) throws Exception {
        return ordersDao.findById(ordersId);
    }
}
