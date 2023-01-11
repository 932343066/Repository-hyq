package com.xrom.springboot.start.model;

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
public class HistoryModel implements Serializable{
	private static final long serialVersionUID = 1L;
	private String id;
	private String sendUser;
	private String receiveUser;
	private String time;
	private String shortTime;
	private String content;
	private String img;
}