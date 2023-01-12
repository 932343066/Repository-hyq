package com.xrom.springboot.start.controller;

import com.xrom.springboot.start.domain.CatoonSheet;
import com.xrom.springboot.start.domain.TeeJson;
import com.xrom.springboot.start.model.CatoonSheetModel;
import com.xrom.springboot.start.service.CatoonSheetService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class CatoonSheetController {
	
	@Autowired
	private CatoonSheetService catoonSheetService;

	@RequestMapping(value = "CatoonSheetController")
	public TeeJson catoonSheetData(){
		TeeJson json = new TeeJson();
		List<CatoonSheetModel> results = new ArrayList<>();
		List<CatoonSheet> list = catoonSheetService.findAllCatoonSheet();

		for (CatoonSheet catoonSheet : list) {
			CatoonSheetModel model = new CatoonSheetModel();
			BeanUtils.copyProperties(catoonSheet, model);
			model.setShortName(catoonSheet.getName().split("\\.")[0]);
			results.add(model);
		}
		json.setRtData(results);
		json.setRtMsg("查询成功");
		json.setRtState(true);
		return json;
	}
}
