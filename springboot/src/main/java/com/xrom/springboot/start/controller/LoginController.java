package com.xrom.springboot.start.controller;

import com.xrom.springboot.start.domain.TeeJson;
import com.xrom.springboot.start.domain.User;
import com.xrom.springboot.start.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.Session;
import java.util.List;
import java.util.UUID;

@RestController
public class LoginController {

	@Autowired
	private UserService userService;

	/**
	 * 登录
	 * @param username
	 * @param pwd
	 * @return
	 */
	@RequestMapping(value = "ToLogin", method = RequestMethod.POST)
	public TeeJson login(@RequestParam("username") String username, @RequestParam("pwd") String pwd,
						 HttpServletRequest request){
		TeeJson json = new TeeJson();
		User user = new User();
		user.setUsername(username);
		user.setPwd(pwd);
		List<User> list = userService.login(user);
		if (list.size() > 0) {
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("pwd", pwd);
			request.getSession().setAttribute("img", list.get(0).getImg());
			// 登录成功
			json.setRtState(true);
			json.setRtMsg("登录成功!!!");
		} else {
			// 登录失败
			json.setRtState(false);
			json.setRtMsg("账号密码错误！");
		}
		return json;
	}

	/**
	 * 注册
	 * @param username
	 * @param pwd
	 * @return
	 */
	@RequestMapping(value = "ToRegister", method = RequestMethod.POST)
	public TeeJson register(@RequestParam("username") String username, @RequestParam("pwd") String pwd){
		TeeJson json = new TeeJson();
		User user = new User();
		user.setId(UUID.randomUUID().toString());
		user.setUsername(username);
		user.setPwd(pwd);
		user.setIsDelete(0);
		// 根据用户名和密码查询是否重复
		List<User> lists = userService.checkUsername(username);
		if (lists.size() == 0) {
			int count = userService.register(user);
			if (count > 0) {
				// 注册成功
				json.setRtState(true);
				json.setRtMsg("恭喜！注册成功!!!");
			} else {
				// 注册失败
				json.setRtState(false);
				json.setRtMsg("注册失败！由于网速问题，麻烦您再试一次！");
			}
		} else {
			// 重复注册
			json.setRtState(false);
			json.setRtMsg("该用户名已存在！请重新输入");
		}
		return json;
	}

	/**
	 * 获取头像
	 * @return
	 */
	@RequestMapping(value = "GetImg", method = RequestMethod.POST)
	public TeeJson getImg(HttpServletRequest request){
		TeeJson json = new TeeJson();
		String img = request.getSession().getAttribute("img").toString();
		json.setRtData(img);
		json.setRtState(true);
		json.setRtMsg("查询成功");
		return json;
	}

	/**
	 * 退出登录
	 * @return
	 */
	@RequestMapping(value = "LoginOut", method = RequestMethod.POST)
	public TeeJson loginOut(HttpServletRequest request){
		TeeJson json = new TeeJson();
		request.getSession().setAttribute("username", null);
		request.getSession().setAttribute("pwd", null);
		request.getSession().setAttribute("img", null);
		json.setRtState(true);
		json.setRtMsg("退出成功");
		return json;
	}
}
