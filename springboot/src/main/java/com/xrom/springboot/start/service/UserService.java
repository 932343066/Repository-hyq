package com.xrom.springboot.start.service;

import com.xrom.springboot.start.domain.SongSheet;
import com.xrom.springboot.start.domain.User;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@RequestMapping("user")
public interface UserService {
	
	/**
	 * 登录
	 */
	@PostMapping("login")
	List<User> login(User user);

	/**
	 * 注册
	 */
	@PostMapping("register")
	int register(User user);

	/**
	 * 校验用户名
	 * @param username
	 * @return
	 */
	@PostMapping("checkUsername")
	List<User> checkUsername(String username);

	/**
	 * 查询除自己外的其他用户
	 * @return
	 */
	@PostMapping("selectUserNameOther")
    String selectUserNameOther(String username);
}
