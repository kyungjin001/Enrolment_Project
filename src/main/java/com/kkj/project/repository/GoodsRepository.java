package com.kkj.project.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kkj.project.dto.GoodsDTO;



@Repository
public class GoodsRepository {

	@Autowired
	private SqlSessionTemplate sql;

	//회원 가입 처리
	public int goodspg(GoodsDTO goods) {
		return sql.insert("Goods.goodspg", goods);	
	}


	//회원 전체목록
	public List<GoodsDTO> findAll() {
		return sql.selectList("Goods.findAll");	
	}

	//회원 상세조회
	public GoodsDTO findById(long g_number) {
		return sql.selectOne("Goods.findById", g_number);	
	}

	// 회원 삭제
	public void delete(long g_number) {
		sql.delete("Goods.delete", g_number);	
	}

	//회원 업데이트
	public void update(GoodsDTO goods) {
		sql.update("Goods.update", goods);			
	}


	public void test(long g_number) {
		sql.update("Goods.test", g_number);					
	}


	public List<GoodsDTO> myenrollgs() {
		return sql.selectList("Goods.myenrollgs");		
		}


	public void mycart(Map<String, Long> cartParam) {
		sql.insert("Goods.insertcart", cartParam );		
	}


	public List<GoodsDTO> cartview(long m_number) {
		return sql.selectList("Goods.cartview",m_number);
	}


	public void unpurchase(Map<String, Long> unpuraram) {
		sql.delete("Goods.unpurchase", unpuraram);			
		
	}



	

	

}
