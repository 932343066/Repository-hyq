package com.xrom.springboot.start.service;

import com.xrom.springboot.start.domain.Person;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@RequestMapping("personService")
public interface PersonService {
	
	/**
	 * 根据接口查询所用的用户
	 */
	@PostMapping("findAllUser")
	List<Person> findAllUser(Person person);
}
