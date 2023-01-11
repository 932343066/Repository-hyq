package com.xrom.springboot.start.mapper;

import com.xrom.springboot.start.domain.CatoonSheet;
import com.xrom.springboot.start.domain.Person;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CatoonSheetMapper {
	
	List<CatoonSheet> findAllCatoonSheet();

}
