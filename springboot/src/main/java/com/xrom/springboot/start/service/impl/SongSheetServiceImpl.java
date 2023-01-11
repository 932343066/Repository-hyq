package com.xrom.springboot.start.service.impl;

import com.xrom.springboot.start.domain.CatoonSheet;
import com.xrom.springboot.start.domain.SongSheet;
import com.xrom.springboot.start.mapper.CatoonSheetMapper;
import com.xrom.springboot.start.mapper.SongSheetMapper;
import com.xrom.springboot.start.service.CatoonSheetService;
import com.xrom.springboot.start.service.SongSheetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SongSheetServiceImpl implements SongSheetService {

	@Autowired
	private SongSheetMapper songSheetMapper;

	@Override
	public List<SongSheet> findAllSongSheet() {
		return songSheetMapper.findAllSongSheet();
	}
}
