<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--===============================================================================타이틀아이콘-->	
		<link rel="icon" type="image/png" href="../images/icons/favicon.ico"/>
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="../css/util.css">
		<link rel="stylesheet" type="text/css" href="../css/main.css">
	<!--===============================================================================================-->
	
	<script type="text/javascript">
		function CheckLogin(){
			$.ajax({
				type:"POST",
				url:"../gxsx/logincheck.do",
				dataType: "json",
				data: {userid: $("#userid").val(), upwd: $("#upwd").val()},
				success: function(data){
					if(data== true){
						location.href = "../gxsx/domain.do"				
					}else{
						alert("로그인 실패")
						location.href = "../gxsx/login.do"	
					}
				},
				error: function(data){
					alert("CheckLogin 에러가 발생했습니다.");
				}
			});
		}
	</script>
	
	</head>
	<body>
		
		<div class="limiter">
			<div class="container-login100">
				<div class="wrap-login100 p-l-50 p-r-50 p-t-77 p-b-30">
					<form class="login100-form validate-form" action="../gxsx/logincheck.do" method="post">
						<span class="login100-form-title p-b-55">
							Login
						</span>
						<div class="wrap-input100 validate-input m-b-16" data-validate = "Valid id is required">
							<input class="input100" type="text" name="userid" id="userid" placeholder="아이디">
							<span class="focus-input100"></span>
							<span class="symbol-input100">
								<span class="lnr lnr-envelope"></span>
							</span>
						</div>
	
						<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
							<input class="input100" type="password" name="upwd" id="upwd" placeholder="비밀번호">
							<span class="focus-input100"></span>
							<span class="symbol-input100">
								<span class="lnr lnr-lock"></span>
							</span>
						</div>
						
						<div class="container-login100-form-btn p-t-25">
							<button type="submit" class="login100-form-btn" onclick="CheckLogin()">
								로그인
							</button>
						</div>
	
						<div class="text-center w-full p-t-42 p-b-22">
							<span class="txt1">
								Or login with
							</span>
						</div>
						
						<p id="kakao_id_login" style="margin-left:20px">
							<a href="${kakao_url}">
								<img src="../images/kakao_login_medium_wide.png">
							</a>
						</p>
	
<!-- 						<a href="loolo.do" class="btn-google m-b-10"> -->
<!-- 							<img src="images/kakao_login_medium_wide.png"> -->
<!-- 							Google -->
<!-- 						</a>					 -->
						
						<div class="text-center w-full p-t-115">
							<span class="txt1">
								회원이 아니신가요?
							</span>
	
							<a class="txt1 bo1 hov1" href="signupform.do">
								지금회원가입					
							</a>
						</div>
					</form>
				</div>
			</div>
		</div>
		
	<!--===============================================================================================-->	
		<script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
		<script src="../vendor/bootstrap/js/popper.js"></script>
		<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
		<script src="../vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
		<script src="../js/main.js"></script>
	
	</body>
</html>