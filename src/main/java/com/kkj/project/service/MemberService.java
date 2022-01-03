package com.kkj.project.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kkj.project.dto.KakaoDTO;
import com.kkj.project.dto.MemberDTO;
import com.kkj.project.repository.MemberRepository;


@Service
public class MemberService {

	
	
	@Autowired // 어노테이션은 밑에 한줄만 적용가능, 어노테이션 밑에 두 줄 불가능
	private MemberRepository mr;
	
//	
	@Autowired
	private HttpSession session;

	
	
	// 회원가입 처리
	public int insert(MemberDTO members) throws IllegalStateException, IOException {
		
		
		MultipartFile m_file = members.getM_file();
		String m_filename = m_file.getOriginalFilename();
		m_filename = System.currentTimeMillis() + "-" + m_filename;
		String savePath = "C:\\development\\source\\spring_kkj\\Enrolment_Project\\src\\main\\webapp\\resources\\upload\\"+m_filename;
		if(!m_file.isEmpty()) {
			m_file.transferTo(new File(savePath));
		}		
		members.setM_filename(m_filename);
				
		
		int result = mr.insert(members);

		
		return result;

		
	}
//
//
//	
	
	// 로그인 처리
	public String login(MemberDTO members) {
		
		MemberDTO loginMember = mr.login(members);
		
		if (loginMember != null) {
			//	 로그인 성공(로그인정보(아이디를)세션에 저장)
			session.setAttribute("loginId", loginMember.getM_id());
			session.setAttribute("loginName", loginMember.getM_name());
			session.setAttribute("loginNumber", loginMember.getM_number());
			session.setAttribute("logins", loginMember.getM_select());
			


			return "index"; // jsp가 아니고 주소로 받을때는 리다이렉트 필수!
		} else {
			//	 로그인 실패
			return "/member/login";
			
		}	}

	
	//회원전체목록
	public List<MemberDTO> findAll(){
		List<MemberDTO> mList = mr.findAll();
		return mList;
	}
	
	
	//상세조회
	public MemberDTO findById(long m_number) {
		MemberDTO members = mr.findById(m_number);

		return members;
	}
	

//
//	
//	
	public void delete(long m_number) {
		mr.delete(m_number);
		
		}
//
	public MemberDTO update(MemberDTO members) throws IllegalStateException, IOException {
		MultipartFile m_file = members.getM_file();
		String m_filename = m_file.getOriginalFilename();
		m_filename = System.currentTimeMillis() + "-" + m_filename;
		String savePath = "C:\\development\\source\\spring_kkj\\Enrolment_Project\\src\\main\\webapp\\resources\\upload\\"+m_filename;
		if(!m_file.isEmpty()) {
			m_file.transferTo(new File(savePath));
		}		
		members.setM_filename(m_filename);
		mr.update(members);
		return members;
	}
//
//
//	
//	//아이디 중복체크
	public String idDuplicate(String m_id) {
		String result=mr.idDuplicate(m_id);
		if (result==null)
			return "ok"; //조회결과가 없기 때문에 해당 아이디는 사용 가능
		else
			return "no"; //조회결과가 있기 때문에 해당 아이디는 사용 불가능
	}
//
	public MemberDTO mypage(long m_number) {
		MemberDTO members = mr.mypage(m_number);

		return members;
	}

	public String logincheck(String m_id, String m_password) {
		Map<String, String> loginParam = new HashMap<String, String>();
		loginParam.put("id", m_id);
		loginParam.put("pw", m_password);
		String result=mr.logincheck(loginParam);
		if (result!=null)
			return "ok"; //조회결과가 없기 때문에 해당 아이디는 사용 가능
		else
			return "no"; //조회결과가 있기 때문에 해당 아이디는 사용 불가능
	}


	// 카카오 로그인
		public String getAccessToken (String authorize_code) {
	        String access_Token = "";
	        String refresh_Token = "";
	        String reqURL = "https://kauth.kakao.com/oauth/token";

	        try {
	            URL url = new URL(reqURL);

	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로

	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);

	            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            sb.append("grant_type=authorization_code");
	            sb.append("&client_id=1778a88374db5c70793227164c97b0f4");  //본인이 발급받은 key
	            sb.append("&redirect_uri=http://localhost:8081/member/kakaologin");     // 본인이 설정해 놓은 경로
	            sb.append("&code=" + authorize_code);
	            bw.write(sb.toString());
	            bw.flush();

	            //    결과 코드가 200이라면 성공
	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);

	            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            access_Token = element.getAsJsonObject().get("access_token").getAsString();
	            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

	            System.out.println("access_token : " + access_Token);
	            System.out.println("refresh_token : " + refresh_Token);

	            br.close();
	            bw.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	        return access_Token;
	    }
		
		// 카카오 로그인 정보 저장 
		public KakaoDTO getUserInfo (String access_Token) {

	        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	        HashMap<String, Object> userInfo = new HashMap<String, Object>();
	        String reqURL = "https://kapi.kakao.com/v2/user/me";
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("GET");

	            //    요청에 필요한 Header에 포함될 내용
	            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);

	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

	            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	            String email = kakao_account.getAsJsonObject().get("email").getAsString();

	            userInfo.put("nickname", nickname);
	            userInfo.put("email", email);

	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        KakaoDTO result = mr.findkakao(userInfo);
	        System.out.println("S:" + result);
	        if(result==null) {
	        	mr.kakaoinsert(userInfo);
	        	System.out.println("이거 안불러와줘?"+userInfo);
	        	return mr.findkakao(userInfo);
	        } else {
	        	return result;
	        }
	        
	    }

		public KakaoDTO kakaoNumber(KakaoDTO userInfo) {
			System.out.println("제발좀 돼라"+userInfo);
			return mr.kakaoNumber(userInfo);
		}




	
	
}
