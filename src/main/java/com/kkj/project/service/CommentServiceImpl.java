package com.kkj.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kkj.project.dto.CommentDTO;
import com.kkj.project.repository.CommentRepository;

@Service
public class CommentServiceImpl implements CommentService {

	
	
	@Autowired
	private CommentRepository cr;

	@Override
	public void save(CommentDTO comment) {
		cr.save(comment);
		
	}


	@Override
	public List<CommentDTO> findAll(long t_number) {
		return cr.findAll(t_number);
	}





	@Override
	public void update(CommentDTO comment) {
		cr.update(comment);
		
	}


	@Override
	public String delete(long t_number,long c_number,int page) {
		int result = cr.delete(c_number);	
		
		if(result>0) {
			return "redirect:/board/detail?t_number="+t_number+"&page="+page;			
		}else {
			return "board/paging";
		}
	}


	
	
}
