package com.xrom.springboot.start.model;

import com.xrom.springboot.start.domain.History;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 
* @des
* @author heyq  
* @date 2021年5月26日  
* @version 1.0
 *
 */
@Data
public class HistoryListsModel implements Serializable{
	private static final long serialVersionUID = 1L;
	private List<HistoryModel> historyLists;
	private String sendUser;
}