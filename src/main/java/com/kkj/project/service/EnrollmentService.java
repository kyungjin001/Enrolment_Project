package com.kkj.project.service;
import java.util.List;
import java.util.Map;

//
//import java.io.IOException;
//import java.util.List;
//
import javax.servlet.http.HttpSession;

//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//

import com.kkj.project.dto.EnrollmentDTO;
import com.kkj.project.dto.LectureDTO;
import com.kkj.project.dto.MemberDTO;

public interface EnrollmentService {

	void enrollment(EnrollmentDTO enrollment);

	List<EnrollmentDTO> findAll();

	EnrollmentDTO findById(long e_number);

	void delete(long e_number);

	void update(EnrollmentDTO enrollment);



	void lecture(long e_number, long m_number);

	List<EnrollmentDTO> lecview(long m_number);


	void unlecture(long e_number, long m_number);

	List<EnrollmentDTO> mylecture();

	List<LectureDTO> mystudent(long e_number, long m_number);



	List<MemberDTO> mystudentview(List<LectureDTO> lList);






	


	
}
