package com.xrom.springboot.start.controller;

import com.xrom.springboot.start.domain.CatoonSheet;
import com.xrom.springboot.start.domain.TeeJson;
import com.xrom.springboot.start.service.CatoonSheetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CatoonSheetController {
	
	@Autowired
	private CatoonSheetService catoonSheetService;

	@RequestMapping(value = "CatoonSheetController")
	public TeeJson catoonSheetData(){
		TeeJson json = new TeeJson();
		List<CatoonSheet> list = catoonSheetService.findAllCatoonSheet();
		json.setRtData(list);
		json.setRtMsg("查询成功");
		json.setRtState(true);
		return json;
	}
}
