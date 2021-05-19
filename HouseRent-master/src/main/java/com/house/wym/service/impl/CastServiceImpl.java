package com.house.wym.service.impl;

import com.house.wym.dao.ForecastMapper;
import com.house.wym.dao.WeatherMapper;
import com.house.wym.entity.Cast;
import com.house.wym.service.CastService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CastServiceImpl  implements CastService {

    @Autowired
    WeatherMapper weatherMapper;

    @Override
    public void addCast(Cast cast) {
        System.out.println(cast.toString());
       weatherMapper.insertWeather(cast);

    }

    @Override
    public List<Cast> getAllWea() {

        return weatherMapper.selectWea();
    }

    @Override
    public List<Cast> selWeaBy(String citycode) {
        return weatherMapper.selWeaBy(citycode);
    }
}
