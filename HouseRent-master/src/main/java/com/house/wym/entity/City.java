package com.house.wym.entity;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

@Data
@Setter
@Getter
@Accessors(chain = true)
public class City {
    private int id;
    private long cityCode;
    private String cityName;
}
