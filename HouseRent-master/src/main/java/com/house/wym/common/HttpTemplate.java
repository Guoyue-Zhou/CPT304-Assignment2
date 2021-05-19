package com.house.wym.common;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.house.wym.entity.Cast;
import com.house.wym.entity.Weather;
import com.house.wym.service.CastService;
import com.house.wym.service.impl.CastServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;
import java.util.List;


public class HttpTemplate {

    @Autowired
    RestTemplate restTemplate;

    public  void get() {
        ResponseEntity<String> responseEntity = restTemplate.getForEntity("http://timor.tech/api/holiday/year/2020", String.class);
        System.out.println(responseEntity.getBody().toString());


    }


        public static List<Cast> httpGet(String citycode){
        String key="&extensions=all&key=ac58f417bcab3180f0cd2d4e3772f4fc";
        String ur="https://restapi.amap.com/v3/weather/weatherInfo?city=";
        String url=ur+citycode+key;
        String u="https://tianqiapi.com/api?version=v5&appid=38459287&appsecret=Ibk1X8Hc &cityid=";
        String ul=u+citycode;
        RestTemplate restTemplate=new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        headers.add("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36");
        HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
        String result=restTemplate.exchange(ul, HttpMethod.GET,entity,String.class).getBody();
        //把接送字符串解析成json对象进行操作
        JSONObject jb = JSONObject.parseObject(result);



        //System.out.println(jb.get("forecasts"));
        //System.out.println(jb.toString());
        //System.out.println(jb.get("lives").toString());
        // System.out.println(jb.getJSONObject("lives").toString());
        List<Object> jsonArray = jb.getJSONArray("data");

        String s=JSONObject.toJSONString(jsonArray);

        List<Cast> weather=JSONObject.parseArray(s,Cast.class);
        //把json数组转为json字符串
        //String jsonString = JSONObject.toJSONString(jsonArray);
        //System.out.println(jsonString+"efewf");
        //又把json字符串转为java集合得到我们需要的数据
        // List<Cast> weathers = JSONObject.parseArray(jsonString, Cast.class);
        //System.out.println(weather.toString());
        //取“value”的键值，value里面是个json数组
        System.out.println("cewcw"+jb.size());
        return weather;
    }

        public static String httpPost(String url,String name){
            RestTemplate restTemplate=new RestTemplate();
            return restTemplate.postForEntity(url,name,String.class).getBody();
        }

        public static void main(String[] args){
            List<Cast> casts=httpGet("101010100");
            CastService castService=new CastServiceImpl();
            for(Cast cast:casts){
                castService.addCast(cast);
            }
            //System.out.println(HttpTemplate.httpGet("https://restapi.amap.com/v3/weather/weatherInfo?city=110101&key=ac58f417bcab3180f0cd2d4e3772f4fc"));
            //System.out.println(HttpTemplate.httpPost("http://timor.tech/api/holiday/year/2020","ming"));
        }


}
