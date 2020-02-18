package cn.xianyu.service;

import cn.xianyu.domain.Permission;
import cn.xianyu.domain.Role;

import java.util.List;

public interface IRoleService {
    public List<Role> findAll(int page, int size) throws Exception;

    void save(Role role) throws Exception;

    Role findById(Integer roleId) throws Exception;

    List<Permission> findOtherPermissions(Integer roleId) throws Exception;

    void addPermissionToRole(Integer roleId, String[] permissionIds) throws Exception;
}
