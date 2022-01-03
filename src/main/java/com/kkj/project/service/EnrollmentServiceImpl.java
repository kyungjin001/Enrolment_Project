package com.kkj.project.service;
//
//import java.io.File;
//import java.io.IOException;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;



import org.springframework.stereotype.Service;

import com.kkj.project.dto.EnrollmentDTO;
import com.kkj.project.dto.LectureDTO;
import com.kkj.project.dto.MemberDTO;
import com.kkj.project.repository.EnrollmentRepository;

@Service
public class EnrollmentServiceImpl implements EnrollmentService {

	
	@Autowired
	private EnrollmentRepository er;
	
	
	
	
	@Override
	public void enrollment(EnrollmentDTO enrollment) {
		er.enrollment(enrollment);

	}




	@Override
	public List<EnrollmentDTO> findAll() {
		List<EnrollmentDTO> eList = er.findAll();		
		return eList;
	}




	@Override
	public EnrollmentDTO findById(long e_number) {
		EnrollmentDTO enrollment = er.findById(e_number);
		return enrollment;
	}




	@Override
	public void delete(long e_number) {
		er.delete(e_number);
		
	}




	@Override
	public void update(EnrollmentDTO enrollment) {
		er.update(enrollment);		

	}





	@Override
	public void lecture(long e_number, long m_number) {
		Map<String, Long> lecParam = new HashMap<String, Long>();
		lecParam.put("e_number", e_number);
		lecParam.put("m_number", m_number);
		EnrollmentDTO result = er.lecturedu(lecParam);
		if(result==null) {
			er.lecture(lecParam);			
		}
	}




	@Override
	public List<EnrollmentDTO> lecview(long m_number) {
		List<EnrollmentDTO> eList = er.lecview(m_number);
		return eList;
	}






	@Override
	public void unlecture(long e_number, long m_number) {
		Map<String, Long> unlecParam = new HashMap<String, Long>();
		unlecParam.put("e_number", e_number);
		unlecParam.put("m_number", m_number);
		er.unlecture(unlecParam);	
		
	}




	@Override
	public List<EnrollmentDTO> mylecture() {
		List<EnrollmentDTO> eList = er.mylecture();
		return 	eList;	

	}




	@Override
	public List<LectureDTO> mystudent(long e_number, long m_number) {
		Map<String, Long> mystudentParam = new HashMap<String, Long>();
		mystudentParam.put("e_number", e_number);
		mystudentParam.put("m_number", m_number);
		MemberDTO result = er.mystudentdu(mystudentParam);
		if(result==null) {
			return er.mystudent(mystudentParam);
		}
		return null;
	}
	
	




	@Override
	public List<MemberDTO> mystudentview(List<LectureDTO> lList) {
		return er.mystudentview(lList);
	}

























	
}
