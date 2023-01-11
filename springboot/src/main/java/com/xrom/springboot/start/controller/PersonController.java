package com.xrom.springboot.start.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.xrom.springboot.start.domain.Person;
import com.xrom.springboot.start.service.PersonService;

@RestController
public class PersonController {
	
	@Autowired
	private PersonService personService;

	/**
	 * 需求：操作REDIS集群缓存
	 */
	@RequestMapping("redis")
	public String redisMap(Model model){
		//Map<String, Object> maps = userService.redisMap();
		model.addAttribute("hello", "张三丰");
		return null;
	}

	@RequestMapping(value = "PersonController")
	public List<Person> personData(){
		List<Person> list = personService.findAllUser(new Person());
		System.out.println(list);
		return list;
	}
}
