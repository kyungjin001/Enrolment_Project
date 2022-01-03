<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>스터디 모임등록</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">스터디모임 등록</h4>
				<form class="validation-form" novalidate action="/board/study"  method="post">
			
            	
						<input type="hidden" class="form-control" name="m_id" id="name" value="${sessionScope.loginId}" required>
					
					
					<div class="mb-3">
						<label for="name">작성자</label>
						<input type="text" class="form-control" name="t_writer" id="name" value="${sessionScope.loginId}" required>
					</div>
          		
            		
            		<div class="mb-3">
						<label for="name">스터디 주제</label>
						<input type="text" class="form-control" name="t_title" id="name" placeholder="주제를 입력해주세요." value="" required>
					</div>
            
            
						<div class="mb-3">
							<label for="name">스터디 지역</label> 
							<input type="text" class="form-control" name="t_area" id="name" placeholder="지역을 입력해주세요." value="" required>
						</div>
		
		         	<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">스터디 내용</label>
							<textarea name="t_contents" rows="5" class="form-control"></textarea><br>
						</div>
					</div>
				
		
					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">상기 스터디모임 내용을 확인하였습니다.</label>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">스터디 등록
						</button>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 인천일보아카데미</p>
		</footer>
	</div>
</body>

</html>