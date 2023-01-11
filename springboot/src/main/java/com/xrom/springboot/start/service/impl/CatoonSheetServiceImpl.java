package com.xrom.springboot.start.service.impl;

import com.xrom.springboot.start.domain.CatoonSheet;
import com.xrom.springboot.start.domain.Person;
import com.xrom.springboot.start.mapper.CatoonSheetMapper;
import com.xrom.springboot.start.mapper.PersonMapper;
import com.xrom.springboot.start.service.CatoonSheetService;
import com.xrom.springboot.start.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CatoonSheetServiceImpl implements CatoonSheetService {

	@Autowired
	private CatoonSheetMapper catoonSheetMapper;

	@Override
	public List<CatoonSheet> findAllCatoonSheet() {
		return catoonSheetMapper.findAllCatoonSheet();
	}
}
