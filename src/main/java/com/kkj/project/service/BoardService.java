package com.kkj.project.service;

import java.util.List;

import com.kkj.project.dto.BoardDTO;
import com.kkj.project.dto.CommentDTO;
import com.kkj.project.dto.PageDTO;

public interface BoardService {



	
	
	
	public void study(BoardDTO board);
		
	
	
	public List<BoardDTO> findAll();


	public BoardDTO findById(long t_number);

	public void delete(long t_number);

	public void update(BoardDTO board);

	public PageDTO paging(int page);

	public List<BoardDTO> pagingList(int page);

	
	
	public List<BoardDTO> search(String searchtype, String keyword);

	public void save(CommentDTO comment);

}
