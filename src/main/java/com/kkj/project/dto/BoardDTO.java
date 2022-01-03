package com.kkj.project.dto;




import java.sql.Timestamp;


import lombok.Data;

@Data
public class BoardDTO {

	
	//필드 선언
	private long t_number;
	private String t_writer;
	private String t_title;
	private String t_area;
	private String t_contents;
	private int t_hits;
	private Timestamp t_date;	
	private String m_id;

	

		
	
	
}
