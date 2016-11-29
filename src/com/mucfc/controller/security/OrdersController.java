package com.mucfc.controller.security;


import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mucfc.mapper.BankMapper;
import com.mucfc.mapper.CarMapper;
import com.mucfc.mapper.OrdersMapper;
import com.mucfc.model.Bank;
import com.mucfc.model.Orders;
import com.mucfc.model.UserInfo;

@Controller
@RequestMapping(value = "/security/orders")
public class OrdersController {
	@Autowired
	OrdersMapper ordersMapper;
	@Autowired
	BankMapper bankMapper;
	@Autowired
	CarMapper carMapper;
	/*
	 * 产生订单
	 * 路静
	 * 2016年6月6日11:31:42
	 * */
	@RequestMapping(value = "/orders", method = RequestMethod.POST)
	public String orders(Orders orders,HttpServletRequest req){
		HttpSession session=req.getSession();
		UserInfo userinfo=(UserInfo)session.getAttribute("userinfo");
		String totalprice[]=req.getParameterValues("totalprice");
		String sellerid[]=req.getParameterValues("sellerid");
		String carid[]=req.getParameterValues("carid");
		String merid[]=req.getParameterValues("merid");
		String mernum[]=req.getParameterValues("mernum");
		String ordercode=UUID.randomUUID().toString().replace("-","");
		orders.setOrdercode(ordercode);
		for(int i=0;i<totalprice.length;i++){
			int tempt=Integer.parseInt(totalprice[i]);
			int temps=Integer.parseInt(sellerid[i]);
			int tempc=Integer.parseInt(carid[i]);
			int tempm=Integer.parseInt(merid[i]);
			int tempn=Integer.parseInt(mernum[i]);
			orders.setTotalprice(tempt);
			orders.setSellerid(temps);
			orders.setMerid(tempm);
			orders.setCarid(tempc);
			orders.setMernum(tempn);
			orders.setUserid(userinfo.getId());
			ordersMapper.add(orders);
		}
		return "redirect:/security/orders/toPay/"+ordercode;
	}
	
	@RequestMapping(value = "/toPay/{ordercode}", method = RequestMethod.GET)
	public String toPay(HttpServletRequest req,Model model,
			@PathVariable("ordercode") String ordercode){
		HttpSession session=req.getSession();
		UserInfo userinfo=(UserInfo)session.getAttribute("userinfo");
		List<Bank> list=bankMapper.selectByUserid(userinfo.getId());
		model.addAttribute("banks",list);
		model.addAttribute("userid",userinfo.getId());
		model.addAttribute("ordercode",ordercode);
		List<Orders> orders=ordersMapper.selectByOrdercode(ordercode);
		int totalprice=0;
		for(int i=0;i<orders.size();i++){
			totalprice=totalprice+orders.get(i).getTotalprice();
		}
		model.addAttribute("totalprice", totalprice);
		return "pay";
	}
	
	@RequestMapping(value = "/Pay", method = RequestMethod.POST)
	@ResponseBody
	public String toPay(int payid,String ordercode,HttpServletRequest req,String password){
		Bank pwd=bankMapper.selectByKey(payid);
		if(!pwd.getPassword().equals(password)){
			return "password error";
		}
		List<Orders> orders=ordersMapper.selectByOrdercode(ordercode);
		int totalprice=0;
		for(int i=0;i<orders.size();i++){
			ordersMapper.upadatePayFlag(orders.get(i).getOrderid());
			Bank temp=new Bank();
			temp.setSellerid(orders.get(i).getSellerid());
			temp.setMoney(orders.get(i).getTotalprice());
			bankMapper.updateSellerMoney(temp);
			ordersMapper.upadatePayFlag(orders.get(i).getOrderid());
			carMapper.deleteCar(orders.get(i).getCarid());
			totalprice=totalprice+orders.get(i).getTotalprice();
		}
		Bank temp=new Bank();
		int userid = Integer.parseInt(req.getParameter("userid"));
		temp.setUserid(userid);
		temp.setMoney(-totalprice);
		bankMapper.updateUserMoney(temp);
		return "success";
	}
	
	@RequestMapping(value = "/myorders", method = RequestMethod.GET)
	public String myOrders(Model model,HttpServletRequest req){
		UserInfo userinfo=(UserInfo)req.getSession().getAttribute("userinfo");
		List<Orders> list=ordersMapper.selectByUserid(userinfo.getId());
		model.addAttribute("orders",list);
		return "myOrderList";
	}
	
	@RequestMapping(value = "/payOrder", method = RequestMethod.POST)
	@ResponseBody
	public String payOrder(int payid,HttpServletRequest req,String password){
		Bank pwd=bankMapper.selectByKey(payid);
		if(!pwd.getPassword().equals(password)){
			return "password error";
		}
		String orderid[]=req.getParameterValues("orderid");
		for(int i=0;i<orderid.length;i++){
			int temp=Integer.parseInt(orderid[i]);
			Orders order=ordersMapper.selectByKey(temp);
			Bank sellerbank=new Bank();
			sellerbank.setSellerid(order.getSellerid());
			sellerbank.setMoney(order.getTotalprice());
			bankMapper.updateSellerMoney(sellerbank);
			ordersMapper.upadatePayFlag(order.getOrderid());
			carMapper.deleteCar(order.getCarid());
			
			Bank userbank=new Bank();
			userbank.setBankid(payid);
			userbank.setMoney(-order.getTotalprice());
			bankMapper.updateUserMoney(userbank);
		}
		return "success";
	}
	
	@RequestMapping(value = "/toOrderPay", method = RequestMethod.POST)
	public String toOrderPay(Model model,HttpServletRequest req){
		String orderid[]=req.getParameterValues("orderid");
		String totalprice[]=req.getParameterValues("totalprice");
		String ordercode[]=req.getParameterValues("ordercode");
		HttpSession session=req.getSession();
		UserInfo userinfo=(UserInfo)session.getAttribute("userinfo");
		List<Bank> l=bankMapper.selectByUserid(userinfo.getId());
		model.addAttribute("banks",l);
		List<Integer> list=new ArrayList<Integer>();
		for(int i=0;i<orderid.length;i++){
			list.add(Integer.parseInt(orderid[i]));
		}
		int temp=0;
		for(int i=0;i<totalprice.length;i++){
			temp=temp+Integer.parseInt(totalprice[i]);
		}
		model.addAttribute("orderids",list);
		model.addAttribute("totalprice", temp);
		model.addAttribute("userid", userinfo.getId());
		model.addAttribute("ordercode",ordercode[0]);
		return "orderPay";
	}
}
