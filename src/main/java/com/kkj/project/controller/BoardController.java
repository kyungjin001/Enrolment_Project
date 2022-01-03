package com.kkj.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kkj.project.dto.BoardDTO;
import com.kkj.project.dto.CommentDTO;
import com.kkj.project.dto.PageDTO;
import com.kkj.project.service.BoardService;
import com.kkj.project.service.CommentService;





@Controller
@RequestMapping(value = "/board/*") 
public class BoardController {

	@Autowired
	private BoardService bs;
	@Autowired
	private CommentService cs;

	// 글쓰기 링크를 처리하는 메서드
	@RequestMapping(value = "studyform", method = RequestMethod.GET)
	public String studyform() {
		return "board/study";
	}


	// 글쓰기 등록
	@RequestMapping(value = "study", method = RequestMethod.POST)
	public String study(@ModelAttribute BoardDTO board){
		bs.study(board);
		return "index";
	}
	

	// 스터디모임 전체목록 처리
	@RequestMapping(value = "findAll", method = RequestMethod.GET)
	public String findAll(Model model) {
		List<BoardDTO> bList = bs.findAll();

		model.addAttribute("bList", bList);
		return "redirect:/board/paging";
	}
	
	// 스터디 상세조회 처리
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String findById(@RequestParam("t_number") long t_number, 
			Model model,@RequestParam(value="page", required=false, defaultValue="1")int page
			) {

		BoardDTO board = bs.findById(t_number);

		model.addAttribute("board", board);
		model.addAttribute("page", page); //detail.jsp로 갈 때 page 값을 가지고 감.
		List<CommentDTO> commentList = cs.findAll(t_number);
		model.addAttribute("commentList", commentList);
		return "/board/detail";

	}

	// 삭제 처리
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam("t_number") long t_number) {

		bs.delete(t_number);

		return "redirect:/board/paging";	
		}

	// 수정화면 요청
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(@RequestParam("t_number") long t_number, Model model,@RequestParam(value="page", required=false, defaultValue="1")int page) {

		BoardDTO board = bs.findById(t_number);
		model.addAttribute("board", board);
		model.addAttribute("page", page); //detail.jsp로 갈 때 page 값을 가지고 감.
		return "board/update";
	}

	// 글 수정 등록
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@ModelAttribute BoardDTO board, @RequestParam(value="page", required=false, defaultValue="1")int page) 
			{
		bs.update(board);

		return "redirect:/board/detail?t_number="+board.getT_number()+ "&page=" + page;	
		}
//	
//	// 페이징 처리
	@RequestMapping(value="paging", method=RequestMethod.GET)
	// value: 파라미터이름, required: 필수여부, defaultValue: 기본값(page 요청값이 없으면 1로 세팅)
	public String paging(@RequestParam(value="page", required=false, defaultValue="1")int page, Model model) {
		List<BoardDTO> bList = bs.pagingList(page);
		PageDTO paging = bs.paging(page);
		model.addAttribute("bList", bList);
		model.addAttribute("paging", paging);
		return "board/findAll";
	}
	
	
	// 검색 처리	
	@RequestMapping(value="search", method=RequestMethod.GET)
	public String search(@RequestParam("searchtype") String searchtype, @RequestParam("keyword") String keyword, Model model) {
		List<BoardDTO> bList = bs.search(searchtype, keyword);
		model.addAttribute("bList", bList);
		return "board/findAll";
	}
	
	
	  
}
