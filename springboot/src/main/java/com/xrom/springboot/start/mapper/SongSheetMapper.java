package com.xrom.springboot.start.mapper;

import com.xrom.springboot.start.domain.CatoonSheet;
import com.xrom.springboot.start.domain.SongSheet;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SongSheetMapper {
	
	List<SongSheet> findAllSongSheet();

}
