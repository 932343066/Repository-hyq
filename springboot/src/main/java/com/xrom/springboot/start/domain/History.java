package com.xrom.springboot.start.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 
* @des
* @author heyq  
* @date 2021年5月26日  
* @version 1.0
 */
@Data
public class History implements Serializable{
	private static final long serialVersionUID = 1L;
	private String id;
	private String sendUser;
	private String receiveUser;
	private Date time;
	private String content;
	private int state;
}