package com.kkj.project.service;

import java.util.List;
import java.util.Map;

import com.kkj.project.dto.CommentDTO;

public interface CommentService {

	void save(CommentDTO comment);


	List<CommentDTO> findAll(long t_number);
	
	
	public String delete(long c_number, long t_number, int page);
	
	
	public void update(CommentDTO comment);



}
