package com.xrom.springboot.start.service.impl;

import com.xrom.springboot.start.domain.Person;
import com.xrom.springboot.start.mapper.PersonMapper;
import com.xrom.springboot.start.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PersonServiceImpl implements PersonService {

	@Autowired
	private PersonMapper personMapper;

	// @LogAop(logType = "2")
	public List<Person> findAllUser(Person person) {
		List<Person> all = personMapper.findAll();
		System.out.println(all);
		return all;
	}
}
