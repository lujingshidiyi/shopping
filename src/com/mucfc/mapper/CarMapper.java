package com.mucfc.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mucfc.model.Car;
/**
 * Mapper
 * @author lujing
 * @time 2016.5.15
 */
public interface CarMapper {
	public void add(@Param("entity") Car car);
	public List<Car> selectByUserid(int userid);
	public void deleteCar(int id);
}

