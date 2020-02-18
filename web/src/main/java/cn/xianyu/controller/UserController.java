package cn.xianyu.controller;

import cn.xianyu.domain.Role;
import cn.xianyu.domain.UserInfo;
import cn.xianyu.service.IUserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;

@Controller
@RequestMapping({"/user"})
public class UserController {
    @Autowired
    private IUserService userService;

    public UserController() {
    }

    @RequestMapping({"/addRoleToUser"})
    @RolesAllowed({"ADMIN"})
    public String addRoleToUser(@RequestParam(name = "userId", required = true) Integer userId, @RequestParam(name = "ids", required = true) String[] roleIds) throws Exception {
        this.userService.addRoleToUser(userId, roleIds);
        return "redirect:findAll";
    }

    @RequestMapping({"/findUserByIdAndAllRole"})
    @RolesAllowed({"ADMIN"})
    public ModelAndView findUserByIdAndAllRole(@RequestParam(name = "id", required = true) Integer userid) throws Exception {
        ModelAndView mv = new ModelAndView();
        UserInfo userInfo = this.userService.findById(userid);
        List<Role> otherRoles = this.userService.findOtherRoles(userid);
        mv.addObject("user", userInfo);
        mv.addObject("roleList", otherRoles);
        mv.setViewName("user-role-add");
        return mv;
    }

    @RequestMapping({"/findById"})
    public ModelAndView findById(Integer id) throws Exception {
        ModelAndView mv = new ModelAndView();
        UserInfo userInfo = this.userService.findById(id);
        mv.addObject("user", userInfo);
        mv.setViewName("user-show");
        return mv;
    }

    @RequestMapping({"/save"})
    @RolesAllowed({"ADMIN"})
    public String save(UserInfo userInfo) throws Exception {
        this.userService.save(userInfo);
        return "redirect:findAll";
    }

    @RequestMapping({"/findAll"})
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page, @RequestParam(name = "size", required = true, defaultValue = "3") Integer size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<UserInfo> userList = this.userService.findAll(page, size);
        PageInfo pageInfo = new PageInfo(userList);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("user-list");
        return mv;
    }
}