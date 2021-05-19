package com.house.wym.controller;


import com.house.wym.common.HttpTemplate;
import com.house.wym.entity.Cast;
import com.house.wym.entity.CastData;
import com.house.wym.entity.House;
import com.house.wym.entity.Weather;
import com.house.wym.service.CastService;
import com.house.wym.service.CityService;
import com.house.wym.service.IHouserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

@RestController
public class WeatherController {

    @Autowired
    CastService castService;

    @Autowired
    private IHouserService service;

    @Autowired
    CityService cityService;

    @ResponseBody
    @RequestMapping("getWeather")
    public List<CastData>  getWeather(HttpServletRequest request,String citycode){
        String[] co=citycode.split("=");
        List<CastData> castDatas=new ArrayList<>();
        String cp=null;
        if(co.length>1){
            cp=co[1];
        }else{
            cp=co[0];
        }
        System.out.println(co.length+"wefwe");

        cityService.selByName(cp);
        List<Cast> casts=castService.selWeaBy(cityService.selByName(cp));
        int i=0;

        for(Cast cast:casts){

            castDatas.add(new CastData().setCityName(cp).setDate(cast.getDate()).setTem(cast.getTem()).setWea(cast.getWea()).setXuhao(i++).setWin(cast.getWin())
                    .setWin_speed(cast.getWin_speed()));

        }

        System.out.println("wef3ewferfcr"+citycode);


        System.out.println(casts.toString());

        /*List<House> findHomeInfo = service.findHouseByLike();
        request.getSession().removeAttribute("House");
        request.getSession().setAttribute("House", findHomeInfo);*/

        //Map<String,Object> map=new TreeMap<>();
        //map.put("res",casts);
        request.setAttribute("casts",casts);
        //castService.getAllWea();
        //System.out.println(castService.getAllWea().toString());

        return castDatas;

    }


}
