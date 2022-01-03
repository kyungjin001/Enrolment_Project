package com.kkj.project.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kkj.project.dto.EnrollmentDTO;
import com.kkj.project.dto.LectureDTO;
import com.kkj.project.dto.MemberDTO;



@Repository
public class EnrollmentRepository {

	@Autowired
	private SqlSessionTemplate sql;
	
	// 수강등록
	public void enrollment(EnrollmentDTO enrollment) {
		sql.insert("Enrollment.insertEnrollment", enrollment);
		
	}

		
	public List<EnrollmentDTO> findAll() {
		return sql.selectList("Enrollment.findAll");
	}


	public EnrollmentDTO findById(long e_number) {
		return sql.selectOne("Enrollment.findById", e_number);
	}


	public void delete(long e_number) {
	sql.delete("Enrollment.delete", e_number);		
	}


	public void update(EnrollmentDTO enrollment) {
		sql.update("Enrollment.update", enrollment);
		
	}


	public EnrollmentDTO lecture(long e_number) {
		return sql.selectOne("Enrollment.lecture", e_number);
	}




	public void lecture(Map<String, Long> lecParam) {
		sql.update("Enrollment.enrollmentcount", lecParam);
		sql.insert("Enrollment.insertlecture", lecParam );
	}


	public List<EnrollmentDTO> lecview(long m_number) {
		return sql.selectList("Enrollment.lecview",m_number);
	}


	public EnrollmentDTO lecturedu(Map<String, Long> lecParam) {
		return sql.selectOne("Enrollment.lecturedu", lecParam);		
	}


	


	public void unlecture(Map<String, Long> unlecParam) {
		sql.update("Enrollment.unenrollmentcount", unlecParam);
		sql.delete("Enrollment.unlecture", unlecParam);			
		
	}


	public List<EnrollmentDTO> mylecture() {
		return sql.selectList("Enrollment.mylecture");
	}


	public List<LectureDTO> mystudent(Map<String, Long> mystudentParam) {
		return sql.selectList("Enrollment.mystudent",mystudentParam);
	}



	public List<MemberDTO> mystudentview(List<LectureDTO> lList) {
		List<MemberDTO> mList = new ArrayList<MemberDTO>();
		mList = sql.selectList("Enrollment.mystudentview",lList);
		return mList;
	}


	public MemberDTO mystudentdu(Map<String, Long> mystudentParam) {
		return sql.selectOne("Enrollment.mystudentdu", mystudentParam);		
	}

}
