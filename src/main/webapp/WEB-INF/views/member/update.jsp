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

    <title>Sign up</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

		<script>
		function update(){	
		 	console.log('update 함수호출')		
			// 이 문장이 아래 form을 전송하는 문장
	        const pw = document.getElementById('m_password').value;
		 	console.log(pw);		
	        const pwDB = '${members.m_password}';
		 	console.log(pwDB);
		 	if(pw==pwDB){
			update_form.submit();	 		
		 	}else{
		 		alert('비밀번호가 틀립니다.');
		 	}

		}
	</script>
</head>
<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form class="user" action="/member/update" method="post" name= "update_form" enctype="multipart/form-data" >
                            	<input type ="hidden" name="m_number" value="${members.m_number}">		
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type = "text" class="form-control form-control-user" name="m_id"  id="m_id"
                                            placeholder="아이디" value="${members.m_id}" readonly>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user" name="m_password" id="m_password"
                                            placeholder="비밀번호">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type = "text" class="form-control form-control-user" name="m_name" 
                                            placeholder="이름" value="${members.m_name}" readonly>
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type = "text" class="form-control form-control-user" name="m_phone" 
                                            placeholder="전화번호" value="${members.m_phone}">
                                    </div>
                           
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0" >
                                            <select name="m_select" class="form-control shadow-sm" value="${members.m_select}" readonly>
                                                <option>선택해주세요.</option>
                                                <option >재학생</option>
                                                <option>교수</option>
                                                <option>관리자</option>
                                           </select>
                                    </div>
                             
                                 <div class="col-sm-6">
                                        <input type="file" name="m_file"  >                                        
                                    </div>

                                </div>
                                <input type ="button" value="수정" onclick="update()" class="btn btn-primary btn-user btn-block">
                                <hr>
                                <a href="https://www.google.com/" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                <a href="https://www.facebook.com/" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.html">Already have an account? Login!</a>
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