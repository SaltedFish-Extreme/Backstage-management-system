package cn.xianyu.service;

import cn.xianyu.domain.Role;
import cn.xianyu.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IUserService extends UserDetailsService {
    List<UserInfo> findAll(int page, int size) throws Exception;

    void save(UserInfo userInfo) throws Exception;

    UserInfo findById(Integer id) throws Exception;

    List<Role> findOtherRoles(Integer userId) throws Exception;

    void addRoleToUser(Integer userId, String[] roleIds) throws Exception;
}
