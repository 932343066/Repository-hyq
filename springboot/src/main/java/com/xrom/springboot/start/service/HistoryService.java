package com.xrom.springboot.start.service;

import com.xrom.springboot.start.domain.History;
import com.xrom.springboot.start.domain.User;
import com.xrom.springboot.start.model.HistoryModel;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@RequestMapping("history")
public interface HistoryService {

	/**
	 * 查询发送人是username 接收人是usernameOther的记录
	 * @param username
	 * @param usernameOther
	 * @return
	 */
	List<HistoryModel> selectHistory(String username, String usernameOther);

	/**
	 * 插入消息记录
	 * @param history
	 * @return
	 */
	int insertHistory(History history);
}
