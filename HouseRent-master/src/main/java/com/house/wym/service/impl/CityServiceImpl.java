package com.house.wym.service.impl;

import com.house.wym.dao.CityMapper;
import com.house.wym.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CityServiceImpl implements CityService {
    @Autowired
    CityMapper cityMapper;

    @Override
    public String selByName(String cityName) {
        return cityMapper.selByName(cityName);
    }
}
