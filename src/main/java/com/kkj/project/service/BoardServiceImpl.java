package com.kkj.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kkj.project.dto.BoardDTO;
import com.kkj.project.dto.CommentDTO;
import com.kkj.project.dto.PageDTO;
import com.kkj.project.repository.BoardRepository;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardRepository br;

	@Override
	public void study(BoardDTO board) {
			br.study(board);
	}

	
	
	@Override
	public List<BoardDTO> findAll() {
		List<BoardDTO> bList = br.findAll();
		return bList;
	}

	
	@Override
	public void delete(long t_number) {
		br.delete(t_number);
	}

  //게시글 수정
	@Override
	public void update(BoardDTO board){
		br.update(board);

	}

		
	@Override
	public BoardDTO findById(long t_number) {
		BoardDTO board = br.findById(t_number);
		return board;
	}

	private static final int PAGE_LIMIT = 6; // 한페이지에 보여질 글 개수
	private static final int BLOCK_LIMIT = 3; // 한화면에 보여질 페이지 개수

	@Override
	public List<BoardDTO> pagingList(int page) {
		int pagingStart = (page - 1) * PAGE_LIMIT;
		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", pagingStart);
		pagingParam.put("limit", PAGE_LIMIT);
		List<BoardDTO> pagingList = br.pagingList1(pagingParam);
		return pagingList;
	}


	@Override
	public PageDTO paging(int page) {
		int boardCount = br.boardCount(); 
		int maxPage = (int) (Math.ceil((double) boardCount / PAGE_LIMIT)); 
		int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if (endPage > maxPage)
			endPage = maxPage;
		PageDTO paging = new PageDTO();
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		return paging;
	}
	
	// 검색기능 처리
	@Override
	public List<BoardDTO> search(String searchtype, String keyword) {
		Map<String, String> searchParam = new HashMap<String, String>();
		searchParam.put("type", searchtype);
		searchParam.put("word", keyword);
		List<BoardDTO> bList = br.search(searchParam);
		return bList;
	}

	@Override
	public void save(CommentDTO comment) {
		List<BoardDTO> bList = br.save(comment);

	}

}
