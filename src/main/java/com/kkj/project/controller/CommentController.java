package com.kkj.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kkj.project.dto.CommentDTO;
import com.kkj.project.service.CommentService;

@Controller
@RequestMapping(value = "/comment/*")
public class CommentController {

	@Autowired
	private CommentService cs;

	
	// 댓글 저장 처리
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO comment) {
		cs.save(comment);
		List<CommentDTO> commentList = cs.findAll(comment.getT_number());
		return commentList;

	}

	// 댓글 삭제 처리
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam("t_number") long t_number, @RequestParam("c_number") long c_number,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		String result = cs.delete(t_number, c_number, page);
		return result;

	}
	
	// 평점 옵션
	@RequestMapping(value = "rating", method = RequestMethod.POST)
	public Map rating(@RequestParam("c_rating") int c_rating, Model model){
				
		Map ratingOptions = new HashMap();
		ratingOptions.put(0, "☆☆☆☆☆");
		ratingOptions.put(1, "★☆☆☆☆");
		ratingOptions.put(2, "★★☆☆☆");
		ratingOptions.put(3, "★★★☆☆");
		ratingOptions.put(4, "★★★★☆");
		ratingOptions.put(5, "★★★★★");
		model.addAttribute("ratingOptions", ratingOptions);
		
		return ratingOptions;

	}
	

}
