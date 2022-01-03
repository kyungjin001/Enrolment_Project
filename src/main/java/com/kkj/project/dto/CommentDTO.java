package com.kkj.project.dto;


import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentDTO {
	
	private long c_number;
	private long t_number;
	private String c_writer;
	private String c_contents;
	private Timestamp c_date;
	private String m_id;
	private int c_rating;


}