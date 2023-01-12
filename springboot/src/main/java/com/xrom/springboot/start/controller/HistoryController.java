package com.xrom.springboot.start.controller;

import com.xrom.springboot.start.domain.History;
import com.xrom.springboot.start.domain.TeeJson;
import com.xrom.springboot.start.model.HistoryListsModel;
import com.xrom.springboot.start.model.HistoryModel;
import com.xrom.springboot.start.service.HistoryService;
import com.xrom.springboot.start.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@RestController
public class HistoryController {

	@Autowired
	private UserService userService;

	@Autowired
	private HistoryService historyService;

	/**
     * 获取历史记录
     * @return
	 */
	@RequestMapping(value = "SelectHistory", method = RequestMethod.POST)
	public TeeJson selectHistory(HttpServletRequest request, @RequestParam("type") String type){
		TeeJson json = new TeeJson();
		try {
			String sendUser = request.getSession().getAttribute("username").toString();
			String receiveUser = userService.selectUserNameOther(sendUser);
			List<HistoryModel> lists = new ArrayList<>();
			// 查询发送人是username 接收人是usernameOther的数据
			if ("1".equals(type)) {
				lists = historyService.selectHistory(sendUser, receiveUser);
			} else {
				lists = historyService.selectNewHistory(sendUser, receiveUser);
			}
			historyService.updateHistoryState(sendUser, receiveUser);
            lists.stream().forEach(i -> {
                i.setShortTime(i.getTime().substring(0, i.getTime().length() - 2));
            });
			HistoryListsModel model = new HistoryListsModel();
			model.setHistoryLists(lists);
			model.setSendUser(sendUser);
			json.setRtData(model);
			json.setRtState(true);
			json.setRtMsg("查询成功");
		} catch (Exception e) {
			json.setRtState(false);
			json.setRtMsg("selectHistory {},数据异常");
			e.printStackTrace();
		}
		return json;
	}

	/**
	 * 插入历史记录
	 * @return
	 */
	@RequestMapping(value = "InsertHistory", method = RequestMethod.POST)
	public TeeJson insertHistory(@RequestParam("content") String content, HttpServletRequest request){
		TeeJson json = new TeeJson();
		try {
			String sendUser = request.getSession().getAttribute("username").toString();
			String receiveUser = userService.selectUserNameOther(sendUser);
			History history = new History();
			history.setId(UUID.randomUUID().toString());
			history.setSendUser(sendUser);
			history.setReceiveUser(receiveUser);
			history.setTime(new Date());
			history.setContent(content);
			int count = historyService.insertHistory(history);
			List<HistoryModel> hiss = historyService.selectById(history.getId());
			hiss.stream().forEach(i -> {
				i.setShortTime(i.getTime().substring(0, i.getTime().length() - 2));
			});
			if (count > 0) {
				json.setRtData(hiss);
				json.setRtState(true);
			} else {
				json.setRtState(false);
				json.setRtMsg("selectHistory {},数据异常");
			}
		} catch (Exception e) {
			json.setRtState(false);
			json.setRtMsg("selectHistory {},数据异常");
			e.printStackTrace();
		}
		return json;
	}

	/**
	 * 查询新消息
	 * @return
	 */
	@RequestMapping(value = "SelectNewHistory", method = RequestMethod.POST)
	public TeeJson selectNewHistory(HttpServletRequest request){
		TeeJson json = new TeeJson();
		try {
			String sendUser = request.getSession().getAttribute("username").toString();
			String receiveUser = userService.selectUserNameOther(sendUser);
			// 查询发送人是username 接收人是usernameOther的数据
			List<HistoryModel> lists = historyService.selectNewHistory(sendUser, receiveUser);
			if (lists.size() > 0) {
				// 有新消息
				json.setRtState(true);
			} else {
				json.setRtState(false);
			}
			json.setRtMsg("查询成功");
		} catch (Exception e) {
			json.setRtState(false);
			json.setRtMsg("selectNewHistory {},数据异常");
			e.printStackTrace();
		}
		return json;
	}
}
