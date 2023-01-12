package com.xrom.springboot.start.service;

import com.xrom.springboot.start.domain.History;
import com.xrom.springboot.start.model.HistoryModel;
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

	/**
	 * 修改为已读
	 * @param sendUser
	 * @param receiveUser
	 */
	void updateHistoryState(String sendUser, String receiveUser);

	/**
	 * 查询新消息
	 * @param sendUser
	 * @param receiveUser
	 * @return
	 */
	List<HistoryModel> selectNewHistory(String sendUser, String receiveUser);

	/**
	 * 根据主键查询
	 * @param id
	 * @return
	 */
	List<HistoryModel> selectById(String id);
}
