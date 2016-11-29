package com.mucfc.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mucfc.model.Orders;
/**
 * Mapper
 * @author lujing
 * @time 2016.5.15
 */
public interface OrdersMapper {
	public void add(@Param("entity") Orders orders);
	public List<Orders> selectBySellerid();
	public List<Orders> selectByOrdercode(String ordercode);
	public void upadatePayFlag(int orderid);
	public List<Orders> selectByUserid(int userid);
	public Orders selectByKey(int orderid);
	public List<Orders> selectyes();
	public List<Orders> selectno();
}

