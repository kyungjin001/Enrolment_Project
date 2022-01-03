package com.kkj.project.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kkj.project.dto.CommentDTO;

@Repository
public class CommentRepository {
	
	
	@Autowired
	private SqlSessionTemplate sql;

	public void save(CommentDTO comment) {
		sql.insert("Comment.save", comment);
		
	}

	public List<CommentDTO> findAll(long t_number) {
		return sql.selectList("Comment.findAll", t_number);	
		}

	public int delete(long c_number) {
		return sql.delete("Comment.delete", c_number);
		
	}

	public void update(CommentDTO comment) {
		sql.update("Comment.update", comment); 
		
	}
	


}
