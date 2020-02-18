package cn.xianyu.controller;

import cn.xianyu.domain.Permission;
import cn.xianyu.service.IPermissionService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;

@Controller
@RequestMapping({"/permission"})
public class PermissionController {
    @Autowired
    private IPermissionService permissionService;

    public PermissionController() {
    }

    @RequestMapping({"/save"})
    @RolesAllowed({"ADMIN"})
    public String save(Permission permission) throws Exception {
        this.permissionService.save(permission);
        return "redirect:findAll";
    }

    @RequestMapping({"/findAll"})
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page, @RequestParam(name = "size", required = true, defaultValue = "3") Integer size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Permission> permissionList = this.permissionService.findAll(page, size);
        PageInfo pageInfo = new PageInfo(permissionList);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("permission-list");
        return mv;
    }
}
