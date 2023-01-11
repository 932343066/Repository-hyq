package com.xrom.springboot.start.domain;

import lombok.Data;

import java.io.Serializable;

/**
 * 
* @des
* @author heyq  
* @date 2021年5月26日  
* @version 1.0
 */
@Data
public class Person implements Serializable{
	private static final long serialVersionUID = 1L;
	private String id;
	private String name;
	private int age;
	private Integer isDelete;
}