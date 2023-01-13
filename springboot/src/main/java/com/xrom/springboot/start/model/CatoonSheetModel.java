package com.xrom.springboot.start.model;

import lombok.Data;

import java.io.Serializable;

/**
 *
* @des
* @author heyq
* @date 2023年1月8日
* @version 1.0
 */
@Data
public class CatoonSheetModel implements Serializable{
	private static final long serialVersionUID = 1L;
	private String name;
    private String vaule;
    private String shortName;
}