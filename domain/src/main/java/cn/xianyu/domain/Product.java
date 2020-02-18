package cn.xianyu.domain;

import cn.xianyu.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

//产品
public class Product {
    private Integer id;//序号
    private String productName;//名称
    private String cityName;//出发城市
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date DepartureTime;//出发时间
    private String DepartureTimeStr;
    private Double ProductPrice;//产品价格
    private String productDesc;//产品描述
    private Integer productStatus;//状态: 0关闭/1开启
    private String productStatusStr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public Date getDepartureTime() {
        return DepartureTime;
    }

    public void setDepartureTime(Date departureTime) {
        DepartureTime = departureTime;
    }

    public String getDepartureTimeStr() {
        if (DepartureTime != null) {
            DepartureTimeStr = DateUtils.date2String(DepartureTime, "yyyy-MM-dd HH:mm:ss");
        }
        return DepartureTimeStr;
    }

    public void setDepartureTimeStr(String departureTimeStr) {
        DepartureTimeStr = departureTimeStr;
    }

    public double getProductPrice() {
        return ProductPrice;
    }

    public void setProductPrice(double productPrice) {
        ProductPrice = productPrice;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public Integer getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(Integer productStatus) {
        this.productStatus = productStatus;
    }

    public String getProductStatusStr() {
        if (productStatus != null) {
            //状态: 0关闭/1开启
            if (productStatus == 0)
                productStatusStr = "关闭";
            if (productStatus == 1)
                productStatusStr = "开启";
        }
        return productStatusStr;
    }

    public void setProductStatusStr(String productStatusStr) {
        this.productStatusStr = productStatusStr;
    }

}
