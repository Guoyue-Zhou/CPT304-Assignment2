package com.house.wym.entity;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

@Getter
@Setter
@Accessors(chain = true)
@Data
public class CastData {
    private String date;  //当前日期
    //private String date_nl;  //
    //private String wea_c;  //
    private String wea;  //String
    //private String wea_day; //白天天气
    //private String wea_night;  //晚上天气
    private String tem; //白天温度

    private String win;
    private String win_speed;
    private String cityName;
    private int xuhao;
    //private String dayweather;
    //private String daywind;
    //private String week;
    //private String daypower;
    //private String daytemp;
    //private String  nightwind;
    //private String nighttemp;
    //private String nightweather;
    //private String nightpower;

}
