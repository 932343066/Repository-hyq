package com.xrom.springboot.start.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.xrom.springboot.start.domain.Person;
@Mapper
public interface PersonMapper {
	
	List<Person> findAll();

}
