package com.mucfc.mapper;

import java.util.List;

import com.mucfc.model.MerInfo;
/**
 * Mapperӳ
 * @author 路静
 * @time 2016.6.15
 */
public interface MerInfoMapper {
	public List<MerInfo> selectAll();
	
	public MerInfo selectById(int mid);
}
