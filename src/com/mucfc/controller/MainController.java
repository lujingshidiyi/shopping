package com.mucfc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mucfc.mapper.BankMapper;
import com.mucfc.mapper.MerInfoMapper;
import com.mucfc.mapper.OrdersMapper;
import com.mucfc.mapper.UserInfoMapper;
import com.mucfc.model.Bank;
import com.mucfc.model.MerInfo;
import com.mucfc.model.Orders;
import com.mucfc.model.UserInfo;

@Controller
@RequestMapping(value = "")
public class MainController {
	@Autowired
	MerInfoMapper merInfomapper;
	@Autowired
	UserInfoMapper userInfoMapper;
	@Autowired
	OrdersMapper ordersMapper;
	@Autowired
	BankMapper bankmapper;
	
	/*
	 * 项目主页
	 * 路静
	 * 2016年6月4日17:39:12
	 * */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String toIndex(Model model){
		List<MerInfo> list=merInfomapper.selectAll();
		model.addAttribute("merlist", list);
		return "index";
	}

	/*
	 * 去到登录页面
	 * 路静
	 * 2016年6月4日17:40:12
	 */
	@RequestMapping(value = "/toLogin", method = RequestMethod.GET)
	public String toLogin(){
		
		return "login";
	}
	
	/*
	 * 购物者登录后台
	 * 路静
	 * 2016年6月4日17:40:51
	 * */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String Login(UserInfo userinfo,HttpSession session,
			HttpServletRequest req,Model model){
		session=req.getSession();
		List<MerInfo> list=merInfomapper.selectAll();
		model.addAttribute("merlist", list);
		UserInfo temp=userInfoMapper.loginCheck(userinfo);
		if(null!=temp){//如果查到了登录者，将登录者信息加到session中
			session.setAttribute("userinfo", temp);
			if(temp.getRole()==3){
				return "index";
			}
			if(temp.getRole()==2){
				return "redirect";
			}
		}
		return "error";
	}
	
	/*
	 * 注销
	 * 2016年6月7日17:34:50
	 * 路静
	 * */
	@RequestMapping(value = "/exit", method = RequestMethod.GET)
	public String exit(HttpServletRequest req){
		HttpSession session=req.getSession();
		session.removeAttribute("userinfo");
		return "login";
	}
	/**
	 * 商家登录
	 * @param model
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/security/orderlist", method = RequestMethod.GET)
	public String orderlist(Model model,HttpServletRequest req){
		UserInfo userinfo=(UserInfo)req.getSession().getAttribute("userinfo");
		List<Orders> list=ordersMapper.selectBySellerid();
		model.addAttribute("orders",list);
		return "orderList";
	}
	/**
	 * 已付款订单
	 * @param model
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/security/orderlist/yes", method = RequestMethod.GET)
	public String orderlistyes(Model model,HttpServletRequest req){
		UserInfo userinfo=(UserInfo)req.getSession().getAttribute("userinfo");
		List<Orders> list=ordersMapper.selectyes();
		model.addAttribute("orders",list);
		return "orderList";
	}
	/**
	 * 未付款订单
	 * @param model
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/security/orderlist/no", method = RequestMethod.GET)
	public String orderlistno(Model model,HttpServletRequest req){
		UserInfo userinfo=(UserInfo)req.getSession().getAttribute("userinfo");
		List<Orders> list=ordersMapper.selectno();
		model.addAttribute("orders",list);
		return "orderList";
	}
	
	/*
	 * 注册
	 * 2016年6月13日08:27:28
	 * 路静
	 * */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public String register(UserInfo userinfo,String bankname,String bankcode){
		userInfoMapper.add(userinfo);
	int select = userInfoMapper.select(userinfo.getUname());
		Bank bank=new Bank();
		bank.setBankcode(bankcode);
		bank.setBankname(bankname);
		bank.setUserid(select);
		bank.setMoney(10000);
		bank.setPassword("123456");
		bankmapper.add(bank);
		return "success";
	}
}
