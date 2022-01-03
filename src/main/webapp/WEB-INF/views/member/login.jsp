<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Sign in</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
   <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<style>
    body{
        background-color: #79ABFF;
    }
</style>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	
	

<script>

	
    function logincheck(){
        const pw = document.getElementById('m_password').value;
        const id = document.getElementById('m_id').value;		
        const pwDB = '${members.m_password}';

        
        $.ajax({
            type:'post', 
            url: 'logincheck', 
            data : {'m_id':id,'m_password':pw}, 
            dataType : 'text', 
            success : function(result){ 
                console.log('ajax성공')
                console.log(result)
                
                if(result=="ok"){
                	login_form.submit();
                }
                else{
        	 		alert('아이디 또는 비밀번호를 확인하세요.');
                }               
            },
            error : function(){
                console.log('ajax실패');
            }
        });
        
    }
	
	</script>




</head>

<!-- <body class="bg-gradient-primary"> -->
<body>
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <form class="user" action= "/member/login" name= "login_form" method="post" >
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="m_id" aria-describedby="emailHelp" name="m_id"
                                                placeholder="아이디를 입력해주세요">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="m_password" name="m_password" placeholder="비밀번호를 입력해주세요">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div>
                                        <input type ="button" value="로그인" onclick="logincheck()" class="btn btn-primary btn-user btn-block">
                                        <hr>
                           <!--              <a href="https://www.google.co.kr/" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> Login with Google
                                        </a> -->
                                                                  
                            <!--카카오 로그인 시작  -->
						<!-- 			<a href="https://kauth.kakao.com/oauth/authorize?
									client_id=1778a88374db5c70793227164c97b0f4
									&redirect_uri=http://localhost:8081/member/kakaologin
									&response_type=code">로그인</a>    -->
									                                     
                                        
                                            <a id="kakao-login-btn" href="https://kauth.kakao.com/oauth/authorize?
									client_id=1778a88374db5c70793227164c97b0f4
									&redirect_uri=http://localhost:8081/member/kakaologin
									&response_type=code"></a>
									
							<a class="btn btn-outline-danger" href="https://kauth.kakao.com/oauth/logout?client_id=1778a88374db5c70793227164c97b0f4&logout_redirect_uri=http://localhost:8081/">Logout</a>								  
									  <script type='text/javascript'>
									        //<![CDATA[
									        // 사용할 앱의 JavaScript 키를 설정해 주세요.
									        Kakao.init('e12030c46dfe5c31c53908ce020976a9');
									        // 카카오 로그인 버튼을 생성합니다.
									        Kakao.Auth.createLoginButton({
									            container: '#kakao-login-btn',
									            success: function (authObj) {
									                alert(JSON.stringify(authObj));
									            },
									            fail: function (err) {
									                alert(JSON.stringify(err));
									            }
									        });
									      //]]>
									    </script>
									   <!--카카오 로그인 끝  --> 
									    
									    <!--네이버 로그인 시작  -->
									      <!-- 아래와같이 아이디를 꼭 써준다. -->
									      <a id="naverIdLogin_loginButton" href="javascript:void(0)">
									        <img src = "${pageContext.request.contextPath}/resources/img/btnG_완성형.png" width="222" height="48"></img>
									      </a>
									
<!-- 										<li onclick="naverLogout(); return false;">
 -->									      <a href="javascript:void(0)" onclick="naverLogout(); return false;">
									          <img src = "${pageContext.request.contextPath}/resources/img/btnG_로그아웃.png" width="115" height="48"></img>
									      </a>
									
									<!-- 네이버 스크립트 -->
									<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
									
									<script>
									
									var naverLogin = new naver.LoginWithNaverId(
											{
												clientId: "COFSiU1zf5aC53EfPtBg", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
												callbackUrl: "http://localhost:8081/member/naverLogin", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
												isPopup: false, 
												callbackHandle: true
											}
										);	
									
									naverLogin.init();
									
									window.addEventListener('load', function () {
										naverLogin.getLoginStatus(function (status) {
											if (status) {
												var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
									    		
												console.log(naverLogin.user); 
									    		
									            if( email == undefined || email == null) {
													alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
													naverLogin.reprompt();
													return;
												}
											} else {
												console.log("callback 처리에 실패하였습니다.");
											}
										});
									});
									
									
									var testPopUp;
									function openPopUp() {
									    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
									}
									function closePopUp(){
									    testPopUp.close();
									}
									
									function naverLogout() {
										openPopUp();
										setTimeout(function() {
											closePopUp();
											}, 1000);
										
										
									}
									</script>
                                        <!--네이버 로그인 끝  -->
                                        
                 
                                        
                                        
                                        <a href="https://www.facebook.com/" class="btn btn-facebook btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                        </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="/member/fgpw">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="/member/insertform">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.min.js"></script>

</body>
</html>