package com.house.wym.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


@Data
@Getter
@Setter
@Accessors(chain = true)
public class Holiday {
    private int id;
    private String name;

    private String target;
    private Date date;
    private int restDay;
}
