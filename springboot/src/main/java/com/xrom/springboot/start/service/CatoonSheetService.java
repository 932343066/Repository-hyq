package com.xrom.springboot.start.service;

import com.xrom.springboot.start.domain.CatoonSheet;
import com.xrom.springboot.start.domain.Person;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@RequestMapping("catoonSheet")
public interface CatoonSheetService {
	
	/**
	 * 查询所有动画名
	 */
	@PostMapping("findAllCatoonSheet")
	List<CatoonSheet> findAllCatoonSheet();
}
