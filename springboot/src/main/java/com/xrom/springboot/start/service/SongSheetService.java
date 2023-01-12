package com.xrom.springboot.start.service;

import com.xrom.springboot.start.domain.SongSheet;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@RequestMapping("catoonSheet")
public interface SongSheetService {
	
	/**
	 * 查询所有动画名
	 */
	@PostMapping("findAllSongSheet")
	List<SongSheet> findAllSongSheet();
}
