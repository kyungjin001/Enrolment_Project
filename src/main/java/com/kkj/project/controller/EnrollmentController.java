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
import com.kkj.project.dto.LectureDTO;
import com.kkj.project.dto.MemberDTO;
import com.kkj.project.service.EnrollmentService;

@Controller
@RequestMapping(value = "/enrollment/*")
public class EnrollmentController {

	@Autowired
	private EnrollmentService es;
	
	
	//강의등록 링크 처리
	@RequestMapping(value = "enrollmentpgform", method = RequestMethod.GET)
	public String enrollmentform() {
		return "enrollment/enrollmentpg";
	}
	
	//강의등록 링크 처리
	@RequestMapping(value = "lectureform", method = RequestMethod.GET)
	public String lectureform(@RequestParam("m_number") long m_number, Model model) {
		List<EnrollmentDTO> eList = es.lecview(m_number);
		model.addAttribute("lecture", eList);
		return "enrollment/lecture";
	}
	
	
////	// 교수 수강생관리 처리
	@RequestMapping(value = "mystudent", method = RequestMethod.GET)
	public String mystudent(@RequestParam("e_number") long e_number, @RequestParam("m_number") long m_number,Model model) {
		List<LectureDTO> lList = es.mystudent(e_number,m_number);
		System.out.println(lList);
		if(!(lList.isEmpty())){
			System.out.println("제발 인덱스로 넘어가");
			List<MemberDTO> mList = es.mystudentview(lList);		
			model.addAttribute("mList", mList);
			return "enrollment/mystudent";
		}
		return "redirect:/enrollment/mylecture";
		}

	
	
	// 수강신청 처리
	@RequestMapping(value = "lecture", method = RequestMethod.GET)
	public String lecture(@RequestParam("e_number") long e_number,@RequestParam("m_number") long m_number, Model model){
		
		es.lecture(e_number,m_number);
		List<EnrollmentDTO> eList = es.lecview(m_number);
		model.addAttribute("lecture", eList);
		return "enrollment/lecture";
	}
	
	
	// 수강취소 
	@RequestMapping(value = "unlecture", method = RequestMethod.GET)
	public String unlecture(@RequestParam("e_number") long e_number,@RequestParam("m_number") long m_number) {

		es.unlecture(e_number,m_number);

		return "redirect:/enrollment/lectureform?m_number="+m_number;
	}

	
	//강의 등록
	@RequestMapping(value = "enrollmentpg", method = RequestMethod.POST)
	public String enrollment(@ModelAttribute EnrollmentDTO enrollment){
		es.enrollment(enrollment);
		return "index";
	}
	
//	// 강의목록 처리
	@RequestMapping(value = "findAll", method = RequestMethod.GET)
	public String findAll(Model model) {
		List<EnrollmentDTO> eList = es.findAll();

		model.addAttribute("eList", eList);
		return "enrollment/findAll";
	}
	
//	// 교수 강의목록 처리
	@RequestMapping(value = "mylecture", method = RequestMethod.GET)
	public String mylecture(Model model) {
		List<EnrollmentDTO> eList = es.mylecture();

		model.addAttribute("eList", eList);
		return "enrollment/mylecture";
	}
	
	// 상세조회 처리
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String findById(@RequestParam("e_number") long e_number, Model model) {

		EnrollmentDTO enrollment = es.findById(e_number);

		model.addAttribute("enrollment", enrollment);

		return "enrollment/detail";

	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam("e_number") long e_number) {

		es.delete(e_number);

		return "index";
	}
	
//	// 수정화면 요청
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(@RequestParam("e_number") long e_number, Model model) {

		EnrollmentDTO enrollment = es.findById(e_number);
		model.addAttribute("enrollment", enrollment);		
		return "enrollment/update";
	}


//	
//	// 수정처리
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@ModelAttribute EnrollmentDTO enrollment,Model model){

		es.update(enrollment);
				
		model.addAttribute("enrollment", enrollment);	

		return "index";
	}
	

}
