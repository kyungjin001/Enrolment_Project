<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품등록</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
				<h4 class="mb-3">상품등록</h4>
				<form class="validation-form" novalidate action="/goods/goodspg" method="post" enctype="multipart/form-data">
			
						<input type="hidden" class="form-control" name="m_id" id="name" value="${sessionScope.loginId}" required>
			
            
            		<div class="mb-3">
						<label for="name">상품이름</label> <input type="text"
								class="form-control" id="name" name="g_name" placeholder="상품명을 입력해주세요." value="" required>
					</div>
            	 	
					<div class="mb-3">
						<label for="name">상품가격(단위 : 원)</label> <input type="text"
								class="form-control" id="name" name="g_price"  placeholder="상품가격을 입력해주세요." value="" required>
					</div>
					
						<div class="mb-3">
						<label for="name">상품재고</label> <input type="text"
								class="form-control" id="name" name="g_stock"  placeholder="상품재고수를 입력해주세요." value="" required>
					</div>
            
            			<div class="mb-3">
						<label for="formFile" class="form-label">상품사진</label>
						<input class="form-control" type="file" id="formFile" name="g_image">
					  </div>
					  
					  

							<div class="row">
						<div class="mb-3">
							<label for="root">거래수단</label> <select 
								class="custom-select d-block w-100" id="root" name="g_way" >
                                
								<option value=""></option>
								<option>직거래</option>
								<option>택배</option>
                                <option>교내 직거래</option>
							</select>
						</div>
				
					</div>
            
            
                    <div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">상품 설명</label>
							<textarea name="g_contents" rows="5" class="form-control"></textarea><br>
						</div>
				
					</div>
			
		

		
					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">상기 내용을 확인하였습니다.</label>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">상품등록
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