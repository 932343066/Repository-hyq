package com.xrom.springboot.start.service;

import java.util.List;
import java.util.Map;

import com.xrom.springboot.start.domain.Person;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping("personService")
public interface PersonService {
	
	/**
	 * 根据接口查询所用的用户
	 */
	@PostMapping("findAllUser")
	List<Person> findAllUser(Person person);
}
