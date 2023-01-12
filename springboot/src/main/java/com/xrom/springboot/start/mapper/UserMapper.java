package com.xrom.springboot.start.mapper;

import com.xrom.springboot.start.domain.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
	
	List<User> login(User user);

	int register(User user);

	List<User> checkUsername(String username);

	String selectUserNameOther(String username);
}
