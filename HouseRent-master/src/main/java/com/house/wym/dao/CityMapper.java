package com.house.wym.dao;


import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CityMapper {

    public String selByName(String cityName);
}
