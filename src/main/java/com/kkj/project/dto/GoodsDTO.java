package com.kkj.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GoodsDTO {

	
	//필드 선언
	private long g_number;
	private String g_name;
	private String g_contents;
	private int g_price;
	private MultipartFile g_image; 
	private String g_imagename;
	private String g_way;
	private int g_stock;
	// 참조키
	private String m_id;




	
}
