package com.mucfc.controller.security;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mucfc.mapper.CarMapper;
import com.mucfc.model.Car;
import com.mucfc.model.UserInfo;

@Controller
@RequestMapping(value = "/security/car")
public class CarController {
	@Autowired
	CarMapper carMapper;
	/*
	 * 加入购物车
	 * 路静
	 * 2016年6月4日20:45:45
	 * */
	@RequestMapping(value = "/addToCar", method = RequestMethod.POST)
	public String addToCar(Car car,HttpServletRequest req){
		HttpSession session=req.getSession();
		UserInfo userinfo=(UserInfo)session.getAttribute("userinfo");
		Date date=new Date();
		car.setCreatedate(date);
		car.setUserid(userinfo.getId());
		carMapper.add(car);
		return "redirect:/security/car/toCart";
	}
	
	/*
	 * 去到购物车
	 * 路静
	 * 2016年6月5日01:23:11
	 * */
	@RequestMapping(value = "/toCart", method = RequestMethod.GET)
	public String toCart(HttpServletRequest req,Model model){
		HttpSession session=req.getSession();
		UserInfo userinfo=(UserInfo)session.getAttribute("userinfo");
		List<Car> list=carMapper.selectByUserid(userinfo.getId());
		for(int i=0;i<list.size();i++){
			Car temp=list.get(i);
			list.get(i).setTotalprice(temp.getMernum()*temp.getMerprice());
		}
		model.addAttribute("cars", list);
		return "cart";
	}
	
	/*
	 * 去到核算
	 * 路静
	 * 2016年6月5日22:48:14
	 * */
	@RequestMapping(value = "/toCheckOut", method = RequestMethod.GET)
	public String toCheckOut(HttpServletRequest req,Model model){
		HttpSession session=req.getSession();
		UserInfo userinfo=(UserInfo)session.getAttribute("userinfo");
		List<Car> list=carMapper.selectByUserid(userinfo.getId());
		for(int i=0;i<list.size();i++){
			Car temp=list.get(i);
			list.get(i).setTotalprice(temp.getMernum()*temp.getMerprice());
		}
		model.addAttribute("cars", list);
		return "checkout";
	}
	/*
	 * 删除购物车的商品
	 * 路静
	 * 2016年6月5日22:48:14
	 * */
	@RequestMapping(value = "/deleteCar", method = RequestMethod.GET)
	public String deleteCar(HttpServletRequest req,Model model,int id){
		carMapper.deleteCar(id);
		return "redirect:/security/car/toCart";
	}
}
