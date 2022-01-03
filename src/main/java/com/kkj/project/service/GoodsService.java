package com.kkj.project.service;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kkj.project.dto.EnrollmentDTO;
import com.kkj.project.dto.GoodsDTO;
import com.kkj.project.repository.GoodsRepository;


@Service
public class GoodsService {

	
	
	@Autowired // 어노테이션은 밑에 한줄만 적용가능, 어노테이션 밑에 두 줄 불가능
	private GoodsRepository gr;
	
//	
	@Autowired
	private HttpSession session;

	
	
	// 상품등록 처리
	public int goodspg(GoodsDTO goods) throws IllegalStateException, IOException {
		
		
		MultipartFile g_image = goods.getG_image();
		String g_imagename = g_image.getOriginalFilename();
		g_imagename = System.currentTimeMillis() + "-" + g_imagename;
		String savePath = "C:\\development\\source\\spring_kkj\\Enrolment_Project\\src\\main\\webapp\\resources\\upload\\"+g_imagename;
		if(!g_image.isEmpty()) {
			g_image.transferTo(new File(savePath));
		}		
		goods.setG_imagename(g_imagename);
				
		
		int result = gr.goodspg(goods);
		
		return result;

		
	}

	

	
	//상품전체목록
	public List<GoodsDTO> findAll(){
		List<GoodsDTO> gList = gr.findAll();
		return gList;
	}
	
	
	//상세조회
	public GoodsDTO findById(long g_number) {
		GoodsDTO goods = gr.findById(g_number);

		return goods;
	}
	

//
//	
//	
	public void delete(long g_number) {
		gr.delete(g_number);
		
		}

	public GoodsDTO update(GoodsDTO goods) throws IllegalStateException, IOException {
		MultipartFile g_image = goods.getG_image();
		String g_imagename = g_image.getOriginalFilename();
		g_imagename = System.currentTimeMillis() + "-" + g_imagename;
		String savePath = "C:\\development\\source\\spring_kkj\\Enrolment_Project\\src\\main\\webapp\\resources\\upload\\"+g_imagename;
		if(!g_image.isEmpty()) {
			g_image.transferTo(new File(savePath));
		}		
		goods.setG_imagename(g_imagename);
		gr.update(goods);
		return goods;
	}




	public void test(long g_number) {
		gr.test(g_number);
	}




	public List<GoodsDTO> myenrollgs() {
		List<GoodsDTO> gList = gr.myenrollgs();
		return gList;
	}




	public void mycart(long g_number, long m_number) {
		Map<String, Long> cartParam = new HashMap<String, Long>();
		cartParam.put("g_number", g_number);
		cartParam.put("m_number", m_number);
			gr.mycart(cartParam);			
			
	}




	public List<GoodsDTO> cartview(long m_number) {
		List<GoodsDTO> gList = gr.cartview(m_number);
		return gList;
	}




	public void unpurchase(long g_number, long m_number) {
		Map<String, Long> unpuraram = new HashMap<String, Long>();
		unpuraram.put("g_number", g_number);
		unpuraram.put("m_number", m_number);
		gr.unpurchase(unpuraram);			
	}





	
	
}
