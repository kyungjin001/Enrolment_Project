<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>강의등록</title>
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
				<h4 class="mb-3">강의등록</h4>
				<form class="validation-form" novalidate action="/enrollment/update"  method="post">
				<input type ="hidden" name="e_number" value="${enrollment.e_number}">	
            
            		<div class="mb-3">
						<label for="name">담당교수</label> <input type="text"
								class="form-control" name="e_pro" id="name" value="${enrollment.e_pro}" readonly placeholder="교수명을 입력해주세요." required>
					</div>
            
            
            
            
                    <div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">강의실</label> <input type="text"
								class="form-control" name="e_space" id="name" placeholder="강의실을 입력해주세요." value="" required value="${enrollment.e_space}">
						</div>
						<div class="col-md-6 mb-3">
							<label for="nickname">수강인원</label> <input type="text"
								class="form-control" name="e_person" id="nickname" placeholder="수강인원을 입력해주세요." value="${enrollment.e_person}"
								required>
						</div>
					</div>
			
		
					<div class="mb-3">
						<label for="address2">과목이름<span class="text-muted">&nbsp;
							</span></label> <input type="text" name="e_name" class="form-control" id="address2"
							placeholder="과목이름을 입력해주세요." value="${enrollment.e_name}" readonly>
					</div>
					<div class="row">
						<div class="col-md-8 mb-3">
							<label for="root">이수구분</label> <select 
								class="custom-select d-block w-100" name="e_div" id="root">
                                
								<option value=""></option>
								<option>전공필수</option>
								<option>전공선택</option>
                                <option>전공심화</option>
                                <option>교양</option>
							</select>
						</div>
				
					</div>
					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">강의등록 수정은 수강신청으로부터 7일전까지 가능합니다.</label>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">강의등록
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