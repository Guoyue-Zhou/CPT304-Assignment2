package com.house.wym.dao;


import com.house.wym.entity.Cast;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface WeatherMapper {
    public int  insertWeather(Cast cast);

    public List<Cast> selectWea();


    public List<Cast> selWeaBy(String citycode);


}
