package com.mucfc.mapper;


import org.apache.ibatis.annotations.Param;

import com.mucfc.model.UserInfo;
/**
 * Mapper
 * @author lujing
 * @time 2016.5.15
 */
public interface UserInfoMapper {
	public UserInfo loginCheck(@Param("entity") UserInfo userinfo);
	public int add(UserInfo userinfo);
	public int select(String uname);
}
