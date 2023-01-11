package com.xrom.springboot.start.service.impl;

import com.xrom.springboot.start.domain.SongSheet;
import com.xrom.springboot.start.domain.User;
import com.xrom.springboot.start.mapper.SongSheetMapper;
import com.xrom.springboot.start.mapper.UserMapper;
import com.xrom.springboot.start.service.SongSheetService;
import com.xrom.springboot.start.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;


	@Override
	public int register(User user) {
		return userMapper.register(user);
	}

	@Override
	public List<User> checkUsername(String username) {
		return userMapper.checkUsername(username);
	}

	@Override
	public String selectUserNameOther(String username) {
		return userMapper.selectUserNameOther(username);
	}

	@Override
	public List<User> login(User user) {
		return userMapper.login(user);
	}
}
