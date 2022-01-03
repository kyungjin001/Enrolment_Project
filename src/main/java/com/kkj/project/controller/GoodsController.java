package com.kkj.project.controller;

import java.io.IOException;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kkj.project.dto.EnrollmentDTO;
import com.kkj.project.dto.GoodsDTO;
import com.kkj.project.service.GoodsService;

@Controller
@RequestMapping(value = "/goods/*")
public class GoodsController {

	@Autowired
	private GoodsService gs;

	//상품등록 링크처리
	@RequestMapping(value = "goodsform", method = RequestMethod.GET)
	public String goodsForm() {
		return "goods/goodspg";
	}
	@RequestMapping(value = "purchase", method = RequestMethod.GET)
	public String purchase(@RequestParam("g_number") long g_number, Model model) {
		GoodsDTO goods = gs.findById(g_number);

		model.addAttribute("goods", goods);
		return "goods/purchase";
	}
	
	
	// 카카오페이 구매
//	@RequestMapping(value = "test", method = RequestMethod.POST)
//	public String test(@RequestParam("g_number") long g_number) {
//		gs.test(g_number);
//		return "goods/mycart";
//	}
	
	// 장바구니 처리
	@RequestMapping(value = "mycart", method = RequestMethod.GET)
	public String mycart(@RequestParam("g_number") long g_number,@RequestParam("m_number") long m_number, Model model){
		gs.test(g_number);	
		gs.mycart(g_number,m_number);
		return "redirect:/goods/mycarts?g_number="+g_number+"&m_number=" +m_number;
	}
	
	
	//카트 링크 처리
	@RequestMapping(value = "mycarts", method = RequestMethod.GET)
	public String mycarts(@RequestParam("g_number") long g_number,@RequestParam("m_number") long m_number, Model model){
		List<GoodsDTO> gList = gs.cartview(m_number);
		model.addAttribute("gList", gList);
		return "goods/mycart";
	}
	
	//나의 카트 링크 처리
	@RequestMapping(value = "mycartform", method = RequestMethod.GET)
	public String mycartform(@RequestParam("m_number") long m_number, Model model) {
		List<GoodsDTO> gList = gs.cartview(m_number);
		model.addAttribute("gList", gList);
		return "goods/mycart";
	}
	
	
	// 구매취소 
	@RequestMapping(value = "unpurchase", method = RequestMethod.GET)
	public String unpurchase(@RequestParam("g_number") long g_number,@RequestParam("m_number") long m_number) {

		gs.unpurchase(g_number,m_number);

		return "redirect:/goods/mycartform?m_number="+m_number;
	}
	


	//상품등록
	@RequestMapping(value = "goodspg", method = RequestMethod.POST)
	public String goodspg(@ModelAttribute GoodsDTO goods) throws IllegalStateException, IOException {

		int save = gs.goodspg(goods);

		if (save > 0) {
			return "index";
		} else {

			return "goods/goodspg";
		}

	}


	// 상품목록 처리
	@RequestMapping(value = "findAll", method = RequestMethod.GET)
	public String findAll(Model model) {
		List<GoodsDTO> gList = gs.findAll();

		model.addAttribute("gList", gList);
		return "goods/findAll";
	}
	
	//등록상품 확인
	@RequestMapping(value = "myenrollgs", method = RequestMethod.GET)
	public String myenrollgs(Model model) {
		List<GoodsDTO> gList = gs.myenrollgs();

		model.addAttribute("gList", gList);
		return "goods/myenrollgs";
	}
	
//	
//	
//	
////
//	// 상세조회 처리
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String findById(@RequestParam("g_number") long g_number, Model model) {

		GoodsDTO goods = gs.findById(g_number);

		model.addAttribute("goods", goods);

		return "goods/detail";

	}
//
	// 삭제 처리
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam("g_number") long g_number) {

		gs.delete(g_number);

		return "index";
	}
//
//	// 수정화면 요청
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(@RequestParam("g_number") long g_number, Model model) {

		GoodsDTO goods = gs.findById(g_number);
		model.addAttribute("goods", goods);
		return "goods/update";
	}


//	
//	// 수정처리
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@ModelAttribute GoodsDTO goods,Model model) throws IllegalStateException, IOException {

		gs.update(goods);
		
		
		model.addAttribute("goods", goods);

		return "index";
	}
//	


}
