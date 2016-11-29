package com.mucfc.controller.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mucfc.mapper.MerInfoMapper;
import com.mucfc.model.MerInfo;

@Controller
@RequestMapping(value = "/security/merinfo")
public class MerInfoController {
	@Autowired
	MerInfoMapper merInfoMapper;
	/*
	 * 进入物品详情页面
	 * 路静
	 * 2016年6月4日20:45:45
	 * */
	@RequestMapping(value = "/detail/{mid}", method = RequestMethod.GET)
	public String toMerDetail(@PathVariable("mid") int mid,
			Model model){
		MerInfo merinfo=merInfoMapper.selectById(mid);
		model.addAttribute("merinfo", merinfo);
		return "product-details";
	}
}
