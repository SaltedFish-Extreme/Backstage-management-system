package cn.xianyu.controller;

import cn.xianyu.domain.Product;
import cn.xianyu.service.IProductService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private IProductService productService;

    //产品添加
    @RequestMapping("/save")
    @RolesAllowed("ADMIN")
    public String save(Product product) throws Exception {
        productService.save(product);
        return "redirect:findAll";
    }

    //查询全部产品
    @RequestMapping("/findAll")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page, @RequestParam(name = "size", required = true, defaultValue = "3") Integer size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Product> productList = productService.findAll(page, size);
        //pageInfo就是一个分页Bean
        PageInfo pageInfo = new PageInfo(productList);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("product-page-list");
        return mv;
    }
}
