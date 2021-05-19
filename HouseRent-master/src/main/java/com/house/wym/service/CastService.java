package com.house.wym.service;

import com.house.wym.entity.Cast;

import java.util.List;

public interface CastService {

    public void addCast(Cast cast);

    public List<Cast> getAllWea();

    public List<Cast> selWeaBy(String citycode);
}
