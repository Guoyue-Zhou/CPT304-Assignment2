package com.house.wym.entity;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.util.List;

@Data
@Getter
@Setter
@Accessors(chain = true)
public class Weather {
    //private String province;
    private String city;
    //private String adcode;
    //private String reportime;
    //private String weather;  //天气
    //private double temperature; //温度
   // private String winddirection; //风向
    //private String  windpower;  //风力
    //private String  humidity;  //湿度
    private List<Cast> data;
    private String cityid;
    private String update_time;
    private String countryEn;
    private String county;


}
