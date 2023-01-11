package com.xrom.springboot.start.mapper;

import com.xrom.springboot.start.domain.History;
import com.xrom.springboot.start.domain.User;
import com.xrom.springboot.start.model.HistoryModel;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface HistoryMapper {

	List<HistoryModel> selectHistory(@Param("username") String username,
									 @Param("usernameOther") String usernameOther);

	int insertHistory(History history);
}
