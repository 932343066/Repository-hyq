package com.xrom.springboot.start.service.impl;

import com.xrom.springboot.start.domain.History;
import com.xrom.springboot.start.mapper.HistoryMapper;
import com.xrom.springboot.start.model.HistoryModel;
import com.xrom.springboot.start.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HistoryServiceImpl implements HistoryService {

    @Autowired
    private HistoryMapper historyMapper;

    @Override
    public List<HistoryModel> selectHistory(String username, String usernameOther) {
        return historyMapper.selectHistory(username, usernameOther);
    }

    @Override
    public int insertHistory(History history) {
        return historyMapper.insertHistory(history);
    }

    @Override
    public void updateHistoryState(String sendUser, String receiveUser) {
        historyMapper.updateHistoryState(sendUser, receiveUser);
    }

    @Override
    public List<HistoryModel> selectNewHistory(String sendUser, String receiveUser) {
        return historyMapper.selectNewHistory(sendUser, receiveUser);
    }

    @Override
    public List<HistoryModel> selectById(String id) {
        return historyMapper.selectById(id);
    }
}
