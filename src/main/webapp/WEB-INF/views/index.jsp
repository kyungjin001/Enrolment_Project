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

    <title>Enrollment Project</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
   
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"> --%>
  	 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/templatemo.css">
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css">
 --%>
    <!-- Load fonts style after rendering the layout styles -->
<!--     <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
 -->   <%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome.min.css"> --%>





<script>
	function logout() {
		console.log('성공');
		location.href = "/member/logout";
	}
</script>


</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">ICIA 수강신청</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <c:if test="${sessionScope.logins eq '재학생'}">
            <li class="nav-item active">
                <a class="nav-link" href="/board/studyform/">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>스터디 모임 등록</span></a>
            </li>
            </c:if>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <c:if test="${sessionScope.loginId eq 'admin'}">
            <div class="sidebar-heading">
                관리자용
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>게시판 및 중고거래 관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Components:</h6>
                        <a class="collapse-item" href="/board/findAll">전체 게시글목록</a>
                        <a class="collapse-item" href="/goods/findAll">전체 중고상품목록</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>회원 및 수강 관리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="/member/findAll">전체 회원목록</a>
                        <a class="collapse-item" href="/enrollment/findAll">전체 강의리스트</a>
                        <a class="collapse-item" href="utilities-other.html">Other</a>
                    </div>
                </div>
            </li>
            </c:if>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Sign up/in</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="/member/login">Login</a>
                        <a class="collapse-item" href="/member/insertform">Register</a>
                        <a class="collapse-item" href="/member/fgpw">Forgot Password</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
                <c:if test="${sessionScope.logins eq '재학생'}">
            <li class="nav-item">
                <a class="nav-link" href="/goods/goodsform">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>중고거래 등록</span></a>
            </li>
        
                 <li class="nav-item">
                <a class="nav-link" href="/goods/findAll">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>중고거래</span></a>
            </li>
  		  </c:if>
            <!-- Nav Item - Tables -->
            <c:if test="${sessionScope.logins eq '교수'}">
            <li class="nav-item">
                <a class="nav-link" href="/enrollment/enrollmentpgform">
                    <i class="fas fa-fw fa-table"></i>
                    <span>강의등록</span></a>
            </li>
                 <li class="nav-item">
                <a class="nav-link" href="/enrollment/mylecture">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>나의 강의확인</span></a>
            </li>
         
            </c:if>
            <c:if test="${sessionScope.logins eq '재학생'}">
             <li class="nav-item">
                <a class="nav-link" href="/enrollment/findAll">
                    <i class="fas fa-fw fa-table"></i>
                    <span>수강신청</span></a>
            </li>
            
                           <li class="nav-item">
                <a class="nav-link" href="/board/findAll">
                    <i class="fas fa-fw fa-table"></i>
                    <span>스터디모임 게시판</span></a>
            </li>
            </c:if>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

      

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2021</div>
                                        <span class="font-weight-bold">홈페이지 많이 놀러오세요~</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2021</div>
                                        홈페이지 이벤트 참여하고 상품 정보 확인해보기
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2021</div>
                                       연말을 알차게 보내는 방법! 그리고 새해를 따뜻하게 보내는 방법!
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">7</span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="${pageContext.request.contextPath}/resources/img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">형 언제와! 지각이야~</div>
                                        <div class="small text-gray-500">오지석 · 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="${pageContext.request.contextPath}/resources/img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">오늘 날씨 엄청 춥네.....</div>
                                        <div class="small text-gray-500">허성욱 · 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="${pageContext.request.contextPath}/resources/img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">형 끝나고 헬스장 갈꺼지??</div>
                                        <div class="small text-gray-500">심형철 · 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">점심은 역시 소고기 된짱찌개야~</div>
                                        <div class="small text-gray-500">고윤성 · 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.loginId}${sessionScope.kakaoN}님 환영합니다!</span>
                                <img class="img-profile rounded-circle"
                                    src="${pageContext.request.contextPath}/resources/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                               <a class="dropdown-item" href="/member/mypage?m_number=${loginNumber}">                  
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    마이페이지 
                                </a>
                                <c:if test="${sessionScope.logins eq '재학생'}">                          
                                <a class="dropdown-item" href="/enrollment/lectureform?m_number=${loginNumber}">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    나의 시간표
                                </a>
                                <a class="dropdown-item" href="/goods/mycartform?m_number=${loginNumber}">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    나의 거래목록
                                </a>
                                 <a class="dropdown-item" href="/goods/myenrollgs">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                   내가 등록한 상품목록
                                </a>
                                </c:if>
                                <c:if test="${sessionScope.logins eq '교수'}">                          
                                <a class="dropdown-item" href="/enrollment/mylecture">
                                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    나의 강의목록
                                </a>
                                </c:if>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">





            <!-- Start Banner Hero -->
    <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/banner_img_01.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left align-self-center">
                                <h1 class="h1 text-success"><b>ICIA</b> 공식홈페이지</h1>
                                <h3 class="h2">인천 ICIA에 오신 걸 환영합니다!</h3>
                                <p>
                                    안녕하세요! ICIA 홈페이지에 수강신청하시고 겨울 이벤트와 상품 챙겨가세요!
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/banner_img_02.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1">[ICIA의 소식!]</h1>
                                <h3 class="h2">ICIA-재능대학교 산학협력 협약체결</h3>
                                <p>
                                    IT전문 인재를 양성해 지역 업체에 지속적으로 공급할 수 있는 산학협력 사업이 활기를 띨 전망이다.
                                    <strong>자세히 보기</strong> <br><br>인천재능대학교와 인천일보, 인천일보아카데미는 17일 인천재능대학교에서 산학협력 협약식을 갖고 IT전문 인재를 양성해 외부유출을 방지하고....
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/banner_img_03.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1">[모집공고]</h1>
                                <h3 class="h2">플랫폼을 활용한  개발자과정</h3>
                                <p>
                                    미래를 선도할 인공지는 기술!!<br>
                                    세상을 바꿀 주인공이 당신이 될 수 있습니다.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
            <i class="fas fa-chevron-left"></i>
        </a>
        <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
            <i class="fas fa-chevron-right"></i>
        </a>
    </div>
    <!-- End Banner Hero -->
    
    <!-- Start Categories of The Month -->
    <section class="container py-5">
        <div class="row text-center pt-3">
            <div class="col-lg-6 m-auto">
                <h1 class="h1">중고거래 HOT ITEM</h1>
                <p>
                    지금 바로 중고거래 페이지에 좋은 상품을 저렴한 가격으로 가져가 보세요!
                    (해당 페이지는 재학생을 위한 페이지입니다.)
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="/goods/findAll"><img src="${pageContext.request.contextPath}/resources/img/category_img_01.jpg" class="rounded-circle img-fluid border"></a>
                <h5 class="text-center mt-3 mb-3">애플워치</h5>
                <p class="text-center"><a class="btn btn-success" href="/goods/findAll">Go Shop</a></p>
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="/goods/findAll"><img src="${pageContext.request.contextPath}/resources/img/category_img_02.jpg" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">명품나이키</h2>
                <p class="text-center"><a class="btn btn-success" href="/goods/findAll">Go Shop</a></p>
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="/goods/findAll"><img src="${pageContext.request.contextPath}/resources/img/category_img_03.jpg" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">선글라스</h2>
                <p class="text-center"><a class="btn btn-success" href="/goods/findAll">Go Shop</a></p>
            </div>
        </div>
    </section>
    <!-- End Categories of The Month -->


    <!-- Start Featured Product -->
    <section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">스터디모임 리뷰보기</h1>
                    <p>
                       친구들의 리뷰를 확인해보고 스터디모임을 이용해보세요!
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
              <%--           <a href="shop-single.html">
                            <img src="${pageContext.request.contextPath}/resources/img/feature_prod_01.jpg" class="card-img-top" alt="...">
                        </a> --%>
                        	<div id="map" style="width:345px;height:250px;"></div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5099a6144aa0c285a8dcd0bf7c48ed61"></script>
							<script>
								var container = document.getElementById('map');
								var options = {
									center: new kakao.maps.LatLng(37.44518230096057, 126.7015230255106),
									level: 3
								};
						
								var map = new kakao.maps.Map(container, options);
								
								// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
								var mapTypeControl = new kakao.maps.MapTypeControl();

								// 지도 타입 컨트롤을 지도에 표시합니다
								map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
								
								// 마커가 표시될 위치입니다 
								var markerPosition  = new kakao.maps.LatLng(37.44518230096057, 126.7015230255106); 

								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
								    position: markerPosition
								});

								// 마커가 지도 위에 표시되도록 설정합니다
								marker.setMap(map);
							</script>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                </li>
                                <li class="text-muted text-right">별점 4개</li>
                            </ul>
                            <a href="/board/findAll" class="h2 text-decoration-none text-dark">구월동 할리스 카페</a>
                            <p class="card-text">
                                여기는 아메리카노가 맛있고 공부하기가 정말 편리함. 구월동 최고 카페
                            </p>
                            <p class="text-muted">작성자 : 오지석</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                                  	<div id="map1" style="width:345px;height:250px;"></div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5099a6144aa0c285a8dcd0bf7c48ed61"></script>
							<script>
								var container1 = document.getElementById('map1');
								var options = {
									center: new kakao.maps.LatLng(37.44491590413552, 126.70218652308422),
									level: 3
								};
						
								var map1 = new kakao.maps.Map(container1, options);
								
								
								// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
								var mapTypeControl = new kakao.maps.MapTypeControl();

								// 지도 타입 컨트롤을 지도에 표시합니다
								map1.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
								
								// 마커가 표시될 위치입니다 
								var markerPosition  = new kakao.maps.LatLng(37.44491590413552, 126.70218652308422); 

								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
								    position: markerPosition
								});

								// 마커가 지도 위에 표시되도록 설정합니다
								marker.setMap(map1);
							</script>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                </li>
                                <li class="text-muted text-right">별점 3개</li>
                            </ul>
                            <a href="/board/findAll" class="h2 text-decoration-none text-dark">구월동 파스쿠찌</a>
                            <p class="card-text">
                                와이파이가 안돼서 불편함. 하지만 공부공간이 좋고 조용해서 좋음
                            </p>
                            <p class="text-muted">작성자 : 심형철</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                 <%--        <a href="shop-single.html">
                            <img src="${pageContext.request.contextPath}/resources/img/feature_prod_03.jpg" class="card-img-top" alt="...">
                        </a> --%>
                   <div id="map2" style="width:345px;height:250px;"></div>
                    		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5099a6144aa0c285a8dcd0bf7c48ed61"></script>
							<script>
								var container2 = document.getElementById('map2');
								var options = {
									center: new kakao.maps.LatLng(37.43904502893404, 126.67510236884907),
									level: 3
								};
						
								var map2 = new kakao.maps.Map(container2, options);
								
								
								// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
								var mapTypeControl = new kakao.maps.MapTypeControl();

								// 지도 타입 컨트롤을 지도에 표시합니다
								map2.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
								
								
								// 마커가 표시될 위치입니다 
								var markerPosition  = new kakao.maps.LatLng(37.43904502893404, 126.67510236884907); 

								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
								    position: markerPosition
								});

								// 마커가 지도 위에 표시되도록 설정합니다
								marker.setMap(map2);
							</script>    
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                </li>
                                <li class="text-muted text-right">별점 5개</li>
                            </ul>
                            <a href="/board/findAll" class="h2 text-decoration-none text-dark">인천일보아카데미</a>
                            <p class="card-text">
                                말이 필요없는 우리반 강의실. 따뜻한 히터와 최강 음향시설을 갖추고 있음.
                            </p>
                            <p class="text-muted">작성자 : 김경진</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Featured Product -->
      

                      



            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; KKJ Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <button class="btn btn-primary" onclick="logout()" >Logout</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/demo/chart-pie-demo.js"></script>



        <!-- Start Script -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/templatemo.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
        <!-- End Script -->




</body>
</html>