package com.xrom.springboot.start.controller;

import com.xrom.springboot.start.domain.SongSheet;
import com.xrom.springboot.start.domain.TeeJson;
import com.xrom.springboot.start.model.SongSheetModel;
import com.xrom.springboot.start.service.SongSheetService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class SongheetController {
	
	@Autowired
	private SongSheetService songSheetService;

	@RequestMapping(value = "SongSheetController")
	public TeeJson SongSheetController(){
		TeeJson json = new TeeJson();
		List<SongSheetModel> results = new ArrayList<>();
		List<SongSheet> list = songSheetService.findAllSongSheet();
		for (SongSheet songSheet : list) {
			SongSheetModel model = new SongSheetModel();
			BeanUtils.copyProperties(songSheet, model);
			model.setShortName(songSheet.getName().split("\\.")[0]);
			results.add(model);
		}
		json.setRtData(results);
		json.setRtMsg("查询成功");
		json.setRtState(true);
		System.out.println(list);
		return json;
	}
}
