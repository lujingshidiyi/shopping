package com.mucfc.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.mucfc.model.Bank;
/**
 * Mapper
 * @author lujing
 * @time 2016.5.15
 */
public interface BankMapper {
	public List<Bank> selectByUserid(int userid);
	public void updateUserMoney(@Param("entity") Bank bank);
	public void updateSellerMoney(@Param("entity") Bank bank);
	public void add(@Param("entity") Bank bank);
	public Bank selectByKey(int bankid);
}

