package com.kkj.project.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kkj.project.dto.BoardDTO;
import com.kkj.project.dto.CommentDTO;

@Repository
public class BoardRepository {

	@Autowired
	private SqlSessionTemplate sql;

	// 게시글 작성
	public void study(BoardDTO board) {
		sql.insert("Board.study", board);
	}

	// 스터디모임 전체글목록
	public List<BoardDTO> findAll() {
		return sql.selectList("Board.findAll");
	}

	// 글상세조회
	public BoardDTO findById(long t_number) {
		sql.update("Board.updates", t_number);
		return sql.selectOne("Board.findById", t_number);
	}

	// 게시글 삭제
	public void delete(long t_number) {
		sql.delete("Board.delete", t_number);
	}

	// 글수정
	public void update(BoardDTO board) {
		sql.update("Board.update", board);
	}

	// 페이지 개수 세기
	public int boardCount() {
		return sql.selectOne("Board.count");
	}

	// 페이징리스트1
	public List<BoardDTO> pagingList1(Map<String, Integer> pagingParam) {
		return sql.selectList("Board.pagingList1", pagingParam);
	}

	// 페이징리스트
	public List<BoardDTO> pagingList(int pagingStart) {
		return sql.selectList("Board.pagingList", pagingStart);
	}

	// 검색기능
	public List<BoardDTO> search(Map<String, String> searchParam) {
		return sql.selectList("Board.search", searchParam);
	}

	// 댓글작성 기능
	public List<BoardDTO> save(CommentDTO comment) {
		return sql.selectList("Board.save", comment);
	}

}
