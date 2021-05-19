package com.house.wym.controller;



import javax.servlet.http.HttpServletRequest;

import com.house.wym.entity.CastData;
import com.house.wym.entity.House;
import com.house.wym.service.CityService;
import com.house.wym.service.IHouserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class HomePageController {
	
	@Autowired
	private IHouserService service;

	@Autowired
	CityService cityService;

	
	@RequestMapping("/toIndexPage")
	public String toIndexPage(HttpServletRequest request) {
		List<House> findHomeInfo = service.findHomeInfo();
		request.getSession().setAttribute("House", findHomeInfo);
		return "index";
	}
	
	@RequestMapping("/findHouseByLike")
	public String findHouseByLike(HttpServletRequest request,String citycode) {
		String[] co=citycode.split("=");

		String cp=null;
		if(co.length>1){
			cp=co[1];
		}else{
			cp=co[0];
		}
		List<House> findHomeInfo = service.findHouseByLike(cityService.selByName(cp));
		System.out.println(citycode+"qweqwe1	2qwd");
		System.out.println(cityService.selByName(citycode)+"dqedw12qdwqd");
		request.getSession().removeAttribute("House");
		request.getSession().setAttribute("House", findHomeInfo);
		System.out.println(findHomeInfo.toString()+"fewfwef");
		return "index";
	}
	
	@RequestMapping("/findHousrOrderByAsc")
	public String findHousrOrderByAsc(HttpServletRequest request) {
		List<House> findHomeInfo = service.findHouseOrderByAsc();
		request.getSession().removeAttribute("House");
		request.getSession().setAttribute("House", findHomeInfo);
		return "index";
	}
	
	@RequestMapping("/findHousrOrderByDesc")
	public String findHousrOrderByDesc(HttpServletRequest request) {
		List<House> findHomeInfo = service.findHouseOrderByDesc();
		request.getSession().removeAttribute("House");
		request.getSession().setAttribute("House", findHomeInfo);
		return "index";
	}
}
