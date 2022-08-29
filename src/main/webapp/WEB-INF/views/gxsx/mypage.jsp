<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<meta name="keywords" content="sansillyung, gxsx, bitcamp">
		<meta name="description" content="sansillyung - GxSx">
		<meta name="author" content="sansillyung">
		
		<title>GxSx</title>
		
	<link rel="stylesheet" href="../css/beryllium/style.css">
	<link rel="stylesheet" href="../css/beryllium/themify-icons.css">
	<link rel="stylesheet" href="../css/topmenu.css">

	
	<style>
	</style>
	
	<script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script type="text/javascript">	
		function findSfunc(){
				$.ajax({
				   url: "../Users/fiboard.json", 
				   type: "POST",
				   dataType: "json",
				   data: { fisub: $("#fisub").val()},				
				   success: function(responseData){
					 if(!responseData){
						 alert("존재하지 않는 제목");
						 return false;
					 }
					 var html =  "<div class='m-l-25 m-r--38 m-lr-0-xl' id='boardcontent' style='margin-top:75px'>";
					 	 html += "<div class='wrap-table-shopping-cart'>";
						 html += "<table class='table-shopping-cart'><tr class='table_head'><th class='column-1'>제목</th><th class='column-2'></th>";
						 html += "<th class='column-3'>물품종류</th><th class='column-4'>날짜</th><th class='column-5'>완료여부</th></tr>";
					 if(responseData.length != 0){
 						 for(var i=0; i<responseData.length; i++){
							html += "<tr class='table_row'><td class='column-1'><div class='how-itemcart1'>";
							html += "<img src='../images/Findimgs/"+responseData[i].fipicname+"' alt='IMG'></div></td>";
							html += "<td class='column-2'><a class='cl3' href='../finditem/content.do?fino="+responseData[i].fino+"'>"+responseData[i].fisub+"</a></td>";
							html += "<td class='column-3'>"+responseData[i].ficname+"</td>";
							html += "<td class='column-4'>"+responseData[i].fidate+"</td>";
							if(responseData[i].fifin==0){
								html += "<td class='column-5'>미완료</td>";
							}
							else{
								html += "<td class='column-5'>완료</td>";
							}
						 }
 					 }else{
 						 html += "</tr></table></div><tr class='table_row'><td colspan='5'><center>검색결과 없음</center></td></tr>";
 					 }
  					 html += "</table>";
					 html += "<div class='flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm'>";
					 html += "<div class='flex-w flex-m m-r-20 m-tb-5'></div>";
					 html += "<div>";
					 html += "<input style='float:left' class='stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5' type='text' name='fisub' id='fisub' placeholder='검색할 제목'>";
					 html += "<div class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10' id='fiboard' onclick='findSfunc()'>";
					 html += "검색</div></div></div></div>";
  						
  					 $("#contentchange").html(html);
				   }
			   });
		}//start-end
		
		function lostSfunc(){
				$.ajax({
				   url: "../Users/loboard.json", 
				   type: "POST",
				   dataType: "json",
				   data: { losub: $("#losub").val()},				
				   success: function(responseData){
					 if(!responseData){
						 alert("존재하지 않는 제목");
						 return false;
					 }
					 var html =  "<div class='m-l-25 m-r--38 m-lr-0-xl' id='boardcontent' style='margin-top:75px'>";
					 	 html += "<div class='wrap-table-shopping-cart'>";
						 html += "<table class='table-shopping-cart'><tr class='table_head'><th class='column-1'>제목</th><th class='column-2'></th>";
						 html += "<th class='column-3'>물품종류</th><th class='column-4'>날짜</th><th class='column-5'>완료여부</th></tr>";
					 if(responseData.length != 0){
 						 for(var i=0; i<responseData.length; i++){
							html += "<tr class='table_row'><td class='column-1'><div class='how-itemcart1'>";
							html += "<img src='../images/Lostimgs/"+responseData[i].lopicname+"' alt='IMG'></div></td>";
							html += "<td class='column-2'><a class='cl3' href='../lostitem/locontent.do?lono="+responseData[i].lono+"'>"+responseData[i].losub+"</td>";
							html += "<td class='column-3'>"+responseData[i].locname+"</td>";
							html += "<td class='column-4'>"+responseData[i].lodate+"</td>";
							if(responseData[i].lofin==0){
								html += "<td class='column-5'>미완료</td>";
							}
							else{
								html += "<td class='column-5'>완료</td>";
							}
						 }
 					 }else{
 						 html += "</tr></table></div><tr class='table_row'><td colspan='5'><center>검색결과 없음</center></td></tr>";
 					 }
  					 html += "</table>";
					 html += "<div class='flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm'>";
					 html += "<div class='flex-w flex-m m-r-20 m-tb-5'></div>";
					 html += "<div>";
					 html += "<input style='float:left' class='stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5' type='text' name='losub' id='losub' placeholder='검색할 제목'>";
					 html += "<div class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10' id='loboard' onclick='lostSfunc()'>";
					 html += "검색</div></div></div></div>";
  						
  					 $("#contentchange").html(html);
				   }
			   });
		}//start-end
	</script>

	<script type="text/javascript">
	
	function findfunc() {
		//alert("성공2");
		var str1 = "";
			str1 += "<div class='m-l-25 m-r--38 m-lr-0-xl' id='boardcontent' style='margin-top:75px'>";
			str1 += "<div class='wrap-table-shopping-cart'><table class='table-shopping-cart'>";
			str1 += "<tr class='table_head'><th class='column-1'>제목</th><th class='column-2'></th>";
			str1 += "<th class='column-3'>물품종류</th><th class='column-4'>날짜</th><th class='column-5'>완료여부</th></tr>";
			str1 += "<c:if test='${empty find}'><tr class='table_row'><td colspan='5'><center>등록한 글 없음</center></td></tr></table></div></c:if>";
			str1 += "<c:forEach items='${find}' var='find' varStatus='status'>";
			str1 += "<tr class='table_row'><td class='column-1'><div class='how-itemcart1'>";
			str1 += "<img src='../images/Findimgs/${find.fipicname}' alt='IMG'></div></td><td class='column-2'>";
			str1 += "<a class='cl3' href='../finditem/content.do?fino=${find.fino}'>${find.fisub}</a></td>";
			str1 += "<td class='column-3'>${find.ficname}</td><td class='column-4'>${find.fidate}</td>";
			str1 += "<c:if test='${find.fifin==0}'><td class='column-5'>미완료</td></c:if>";
			str1 += "<c:if test='${find.fifin==1}'><td class='column-5'>완료</td></c:if></tr></c:forEach></table></div>";
			str1 += "<div class='flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm'>";
			str1 += "<div class='flex-w flex-m m-r-20 m-tb-5'></div>";
			str1 += "<div><input style='float:left' class='stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5' type='text' name='fisub' id='fisub' placeholder='검색할 제목'>";
			str1 += "<div class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10' id='fiboard' onclick='findSfunc()'>검색</div></div></div>";
		document.getElementById("contentchange").innerHTML = str1;
			//.innerText = "str" : str 자체가 출력되도록 변환 후 덮어씌움
			// 예)str : <b> b태그 </b> ==> &lt;b&gt; b태그 &lt;/b&gt;
	}
	
	function lostfunc() {
		var str2 = "";
			str2 += "<div class='m-l-25 m-r--38 m-lr-0-xl' id='boardcontent' style='margin-top:75px'>";
			str2 += "<div class='wrap-table-shopping-cart'><table class='table-shopping-cart'>";
			str2 += "<tr class='table_head'><th class='column-1'>제목</th><th class='column-2'></th>";
			str2 += "<th class='column-3'>물품종류</th><th class='column-4'>날짜</th><th class='column-5'>완료여부</th></tr>";
			str2 += "<c:if test='${empty lost}'><tr class='table_row'><td colspan='5'><center>등록한 글 없음</center></td></tr></table></div></c:if>";
			str2 += "<c:forEach items='${lost}' var='lost' varStatus='status'>";
			str2 += "<tr class='table_row'><td class='column-1'><div class='how-itemcart1'>";
			str2 += "<img src='../images/Lostimgs/${lost.lopicname}' alt='IMG'></div></td><td class='column-2'>";
			str2 += "<a class='cl3' href='../lostitem/locontent.do?lono=${lost.lono}'>${lost.losub}</a></td>";
			str2 += "<td class='column-3'>${lost.locname}</td><td class='column-4'>${lost.lodate}</td>";
			str2 += "<c:if test='${lost.lofin==0}'><td class='column-5'>미완료</td></c:if>";
			str2 += "<c:if test='${lost.lofin==1}'><td class='column-5'>완료</td></c:if></tr></c:forEach></table></div>";
			
			str2 += "<div class='flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm'>";
			str2 += "<div class='flex-w flex-m m-r-20 m-tb-5'></div><form method='post' action='loboard.do?'>";
			str2 += "<div><input style='float:left' class='stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5' type='text' name='losub' id='losub' placeholder='검색할 제목'>";
			str2 += "<div class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10' id='loboard' onclick='lostSfunc()'>검색</div></form></div></div>";
		document.getElementById("contentchange").innerHTML = str2;
	}
	
	function profilefunc() {
		var str3 = "";
			str3 += "<div class='row'><div class='m-l-25 m-r--38 m-lr-0-xl' style='margin-left:100px;margin-top:40px'</br></br>";
			str3 += "<div class='table-shopping-cart'><div class='card-header'><h3 class='mb-0'>정보 수정</h3></div>";
			str3 += "<div class='card-body'><form class='form2' name='form2' id='form2' role='form2' autocomplete='off' action='editProfile.do'>";
			str3 += "<div class='form-group row'><label for='noinputId' class='col-lg-3 col-form-label form-control-label'>아이디</label>";
			str3 += "<div class='col-lg-9'><input type='text' class='form-control' id='editId' name='userid' value='${user.userid}' readonly='readonly'></div></div>";
			str3 += "<div class='form-group row'><label for='noinputName' class='col-lg-3 col-form-label form-control-label'>이름</label>";
			str3 += "<div class='col-lg-9'><input type='text' class='form-control' id='editName' name='uname' value='${user.uname}' readonly='readonly'></div></div>";
			str3 += "<div class='form-group row'><label for='inputEmail' class='col-lg-3 col-form-label form-control-label'>이메일</label>";
			str3 += "<div class='col-lg-9'><input class='form-control' type='text' id='editEmail' name='uemail' value='${user.uemail}' required=''></div></div>";
			str3 += "<div class='form-group row'><label for='inputPnum' class='col-lg-3 col-form-label form-control-label'>연락처</label>";		
			str3 += "<div class='col-lg-9'><input class='form-control' type='text' id='editPnum' name='upnum' value='${user.upnum}' required=''></div></div>";
			str3 += "<div class='form-group row'><label for='inputPwd' class='col-lg-3 col-form-label form-control-label'>기존비밀번호</label>";
			str3 += "<div class='col-lg-9'><input class='form-control' type='password' id='editPwd' value='' required=''>";
			str3 += "<input type='hidden' class='form-control' id='oldPwd' name='oldPwd' value='${user.upwd}'></div></div>";
			str3 += "<div class='form-group row'><label for='inputPwd' class='col-lg-3 col-form-label form-control-label'>비밀번호재입력</label>";
			str3 += "<div class='col-lg-9'><input class='form-control' type='password' id='editPwdVerify' value='' required='' data-bvStrict='same:editPwd'></div></div></br>";
			str3 += "<div class='flex-w flex-m m-r-20 m-tb-5'>";
			str3 += "<div class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5' id='submit' name='submit'";
			str3 += "onclick='CheckLeave(document.form2.editId,document.form2.editPwd,document.form2.editPwdVerify,document.form2.oldPwd)'>회원탈퇴</div>";
			str3 += "<div class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5' style='opacity:0; pointer-events:none'></div>";
			str3 += "<div class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10' id='submit2' name='submit2'";
			str3 += "onclick='CheckEditProfile(document.form2.editEmail,document.form2.editPnum,document.form2.editPwd,document.form2.oldPwd,document.form2.editPwdVerify)'>";
			str3 += "저장</div>&emsp;<div class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10' id='submit3' name='submit3' onclick='EditCancel()'>";
			str3 += "취소</div></div></form></div></div></div></div>";
				
		document.getElementById("contentchange").innerHTML = str3;
	}
	
	function pwdfunc() {
		var str4 = "";
			str4 += "<div class='row'><div class='m-l-25 m-r--38 m-lr-0-xl' style='margin-left:100px;margin-top:20px'></br></br>";
			str4 += "<div class='table-shopping-cart'><div class='card-header'><h3 class='mb-0'>비밀번호 변경</h3></div>";
			str4 += "<div class='card-body'><form class='form' name='form' role='form' autocomplete='off'>";
			str4 += "<div class='form-group'><label for='inputPasswordOld'>현재 비밀번호</label>";
			str4 += "<input type='password' class='form-control' id='oldPwd' required=''>";
			str4 += "<input type='hidden' class='form-control' id='oldPwdVerify' value='${user.upwd}'></div>";
			str4 += "<div class='form-group'><label for='inputPasswordNew'>새 비밀번호</label>";
			str4 += "<input type='password' class='form-control' id='newPwd' required=''><span class='form-text small text-muted'>";
			str4 += "The password must be 7-16 characters, contain only characters, numbers and must <em>not</em> contain spaces.</br>공백 없는 8~17자의 문자만 비밀번호로 가능</span></div>";
			str4 += "<div class='form-group'><label for='inputPasswordNewVerify'>비밀번호 재입력</label>";
			str4 += "<input type='password' class='form-control' id='newPwdVerify' required=''>";
			str4 += "<span class='form-text small text-muted'>To confirm, type the new password again.</br>바꿀 비밀번호 재입력</span></div>";
			str4 += "<div class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10' id='submit' name='submit'";
			str4 += "onclick='CheckPassword(document.form.oldPwd,document.form.oldPwdVerify,document.form.newPwd,document.form.newPwdVerify)'>";
			str4 += "저장</div></form></div></div></div></div>";
			
		document.getElementById("contentchange").innerHTML = str4;
	}

	function CheckPassword(oldPwd,oldPwdVerify,newPwd,newPwdVerify){ 
		var passw=  /^[A-Za-z]\w{7,14}$/;
		var oldPwd = $("#oldPwd").val();
		var oldPwdVerify = $("#oldPwdVerify").val();
		var newPwd = $("#newPwd").val();
		var newPwdVerify = $("#newPwdVerify").val();
		console.log(oldPwd,oldPwdVerify,newPwd,newPwdVerify);
		
		if(oldPwd!=newPwd && newPwd.match(passw) 
			&& newPwd==newPwdVerify && oldPwd==oldPwdVerify){
			alert('Correct')
			location.href="editPwd.do?upwd="+newPwd;
		}
		else{
			if(oldPwd==newPwd){
				alert('변경할 비번이 이전의 것과 같음')
			}
			else if(newPwd!=newPwdVerify){
				alert('변경할 비번과 비번확인 불일치')
			}
			else if(oldPwd!=oldPwdVerify){
				alert('사용중인 비번확인 불일치')
			}
			else{
				alert('변경할 비번이 규칙에 맞지않음')
			}
			return false;
		}
	}

	function CheckLeave(editId, editPwd, editPwdVerify, oldPwd){
		var editId = $("#editId").val();
		var editPwd = $("#editPwd").val();
		var editPwdVerify = $("#editPwdVerify").val();
		var oldPwd = $("#oldPwd").val();
		
		if(editPwd==oldPwd){
			var leaveConfirm = confirm("탈퇴하시겠습니까?");
				if(leaveConfirm == true){
					location.href="leaveUser.do?userid="+editId;
					alert('탈퇴완료')
				}
				else if(leaveConfirm == false){
					alert('탈퇴취소')
				}
		}
		else{
			alert('탈퇴불가(비밀번호를 확인해주세요)')
		}
	}
	
	function EditCancel(){
		location.href="mypage.do";		
	}
	
</script>

</head>

<body class="animsition">
	
	<!-- Header -->	
	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->
	<!-- ////////////////////////////////////// 맨 위 메뉴 시작 ////////////////////////////////////// -->
	<header class="header-v4">
		<!-- Header desktop -->
		<div class="container-menu-desktop">

			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">
					
					<!-- Logo desktop -->		
					<a href="../gxsx/domain.do" class="logo">
						<img src="../images/003-.png" alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li class="active-menu">
								<a href="../gxsx/domain.do">Home</a>
							</li>

							<li>
								<a href="../gxsx/notice.do">Notice</a>
							</li>

							<li class="label1" data-label1="습득물">
								<a href="../finditem/list.do?cp=1">Finditem</a>
							</li>

							<li class="label1" data-label1="분실물">
								<a href="../lostitem/list.do?cp=1">Lostitem</a>
							</li>
							<li>
								 <a href="../gxsx/contact.do">Contact</a>								 
							</li>
						</ul>
					</div>	

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						<ul class="main-menu">					
							<c:if test="${ empty loginuser && empty klogin}">
									<li><i class="zmdi zmdi-account-circle"></i>
										<a href="../gxsx/login.do">Login</a></li>
							</c:if>
							<c:if test="${ !empty loginuser }">
								<li class="dropdown">
							        <li class="dropdown">
							          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
							          <i class="ti-bell"></i>(<b>${messageResult.size()}</b>)</a>
							          <c:choose>
							          	<c:when test="${messageResult=='[]'}">
							          		<ul class="dropdown-menu notify-drop" style="right:350px;min-width:100px;max-height:30px">
								            		<div class="drop-content" data-tooltip="tooltip" data-placement="top" style="min-height:10px">
										            	<li><center><div class="col-md-9 col-sm-9 col-xs-9 pd-l0" style="margin-left:15px;">
										            		알람 없음</div></center>
										            	</li>
									            	</div>
									            </ul>
							          	</c:when>
							          	<c:otherwise>
								          	<ul class="dropdown-menu notify-drop" style="right:350px">
									          	<div class="drop-content" data-tooltip="tooltip" data-placement="top">
									          		<c:forEach items="${messageResult}" var="messageResult" varStatus="status" begin="0" end="4">
										            	<li><div class="col-md-9 col-sm-9 col-xs-9 pd-l0" style="margin-left:15px;min-width:250px">
										            		<a href="../Question/questionco.do?qno=${messageResult.qno}">${messageResult.qsub}</a>
										            		<p style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 250px">${messageResult.qcon}</p>
										            		<p class="time">답변완료</p></div>
										            	</li>
										            </c:forEach>
									            </div>
								            </ul>
							          	</c:otherwise>
							          </c:choose>
						            </li>
							    </li>
						    </c:if>
								
						<c:if test="${ !empty loginuser || !empty klogin }">
							<li class="dropdown">
					          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="ti-user"></i></a>
					          <ul class="dropdown-menu notify-drop" style="min-width:150px">
					            <div class="drop-content" data-tooltip="tooltip" data-placement="top" style="min-height:50px; overflow:hidden">							            
					            	<li><div>&nbsp;&nbsp;
											<i class="ti-bookmark-alt"></i>&nbsp;&nbsp;<a href="../Users/mypage.do">마이페이지</a>
					            		</div></li>
					            	<li><div>&nbsp;&nbsp;
					            			<i class="ti-headphone-alt"></i>&nbsp;&nbsp;<a href="../gxsx/contact.do">고객센터</a>
					            		</div></li>
					            	<li><div>&nbsp;&nbsp;
						            		<i class="ti-power-off"></i>
						            		<c:if test="${ empty loginuser && empty klogin}">
						            			&nbsp;<a href="">로그아웃</a>
						            		</c:if>
						            		<c:if test="${ !empty loginuser && empty kakaologout_url}">
												&nbsp;<a href="../gxsx/logout.do">로그아웃</a>
											</c:if>
											<c:if test="${!empty klogin && !empty kakaologout_url}">
												&nbsp;<a href="${kakaologout_url}">로그아웃</a>
											</c:if>
					            		</div></li>
					             </div>
						      </ul>
							</li>
						</c:if>	
						</ul>			
					</div>
				</nav>
			</div>	
		</div>
	</header>
	<!-- ////////////////////////////////////// 맨 위 메뉴 종료 ////////////////////////////////////// -->
	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->

	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->
	<!-- /////////////////////////////////////// 컨텐츠 시작  /////////////////////////////////////// -->
	
	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('../images/coza/bg-02.jpg');margin-top:-40px">
		<h2 class="ltext-105 cl0 txt-center">
			<img src ="../images/마이페이지.png">
		</h2>
	</section>

	<!-- Content page -->
	<section class="bg0 p-t-62 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-lg-3 p-b-80">
					<div class="side-menu">

						<div class="p-t-55">
							<h4 class="mtext-112 cl2 p-b-33">
								마이페이지 목록
							</h4>

							<ul id="accordion" class="accordion">
								<li class="bor18">
									<span class="link dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">나의 게시판</span>
								    <ul class="submenu">
								      <li id="finditem">
								      		<a href="#" onclick="findfunc()" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
								      		&emsp;습득물</a></li>
								      <li id="lostitem">
								      		<a href="#" onclick="lostfunc()" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
								      		&emsp;분실물</a></li>
								    </ul>
								</li>

								<li class="bor18">
									<a href="#" onclick="profilefunc()" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										프로필 수정
									</a>
								</li>
								
								<li class="bor18">
									<a href="#" onclick="pwdfunc()" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										비밀번호 변경
									</a>
								</li>
							</ul>
							
						</div>
					</div>
				</div>
				
				<div class="col-md-8 col-lg-9 p-b-80" id="contentchange" name="">
<%-- 					<jsp:include page='mylostitem.jsp'></jsp:include> --%>					
				</div>
				
			</div>
		</div>
	</section>

	<!-- /////////////////////////////////////// 컨텐츠 종료  /////////////////////////////////////// -->
	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->

	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->
	<!-- ////////////////////////////////////// footer 시작 ////////////////////////////////////// -->

	<footer class="bg3 p-t-75 p-b-32">
		<div class="container">
			<div class="row">
			
				<div class="col-sm-6 col-lg-3 p-b-50">
						<h4 class="stext-301 cl0 p-b-30" style="font-size:100px">
							<img src="../images/003-w.png" >
						</h4>
	
					</div>
				
				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						CATEGORIES
					</h4>
					
						<ul>
							<li class="p-b-10">
								<a href="../gxsx/notice.do" class="stext-107 cl7 hov-cl1 trans-04">
									Notice
								</a>
							</li>
	
							<li class="p-b-10">
								<a href="../finditem/list.do?cp=1" class="stext-107 cl7 hov-cl1 trans-04">
									Finditem
								</a>
							</li>
	
							<li class="p-b-10">
								<a href="../lostitem/list.do?cp=1" class="stext-107 cl7 hov-cl1 trans-04">
									Lostitem
								</a>
							</li>	
						</ul> 
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						CONTACT US
					</h4>

					<p class="stext-107 cl7 size-201">
						<i class="fa fa-home"></i> 서울 마포구 백범로 23 구프라자 3층, 
						<br/>&nbsp;&nbsp;&nbsp; (지번)신수동 63-14 구프라자 3층
					</p>
					<p class="stext-107 cl7 size-201">
						<i class="fa fa-phone"></i> 02-707-1480
					</p>
					<p class="stext-107 cl7 size-201">
						<i class="fa fa-envelope"></i> javaoneteam@gmail.com
						
					</p>

					<div class="p-t-27">
						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-instagram"></i>
						</a>

						<a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
							<i class="fa fa-pinterest-p"></i>
						</a>
					</div>
				</div>

				<div class="col-sm-6 col-lg-3 p-b-50">
					<h4 class="stext-301 cl0 p-b-30">
						BUSINESS HOURS
					</h4>

					<p class="stext-107 cl7 size-201">
						<i class="fa fa-clock-o"></i> <span class="day">Weekdays : </span>
						<span>9am to 8pm</span>
					</p>
					<p class="stext-107 cl7 size-201">
						<i class="fa fa-clock-o"></i> <span class="day">Saturday &nbsp; : </span>
						<span>9am to 2pm</span>
					</p>
					<p class="stext-107 cl7 size-201">
						<i class="fa fa-clock-o"></i> <span class="day">Sunday &nbsp; &nbsp; : </span>
						<span>Closed</span>
					</p>
				</div>
			</div>

			<p class="stext-107 cl6 txt-center">
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | by Sansillyung <i class="fa fa-heart-o" aria-hidden="true"></i> 
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

				</p>
			</div>
	</footer>
	
	<!-- ////////////////////////////////////// footer 종료 ////////////////////////////////////// -->	
	<!-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* -->


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	
	<script>
		function CheckEditProfile(editEmail,editPnum,editPwd,oldPwd,editPwdVerify){ 
			var email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			var phone = /^01(?:0|1|7|9)-(?:\d{3}|\d{4})-\d{4}$/;
			var editEmail = $("#editEmail").val();
			var editPnum = $("#editPnum").val();
			var editPwd = $("#editPwd").val();
			var editPwdVerify = $("#editPwdVerify").val();
			var oldPwd = $("#oldPwd").val();
			
			if(editEmail!=null && editEmail.match(email) && editPnum.match(phone)  
				&& editPnum!=null && editPwd!=null && editPwdVerify!=null 
				&& editPwd==oldPwd && editPwd==editPwdVerify){
				alert('Correct')
				document.getElementById("form2").submit();
			}
			else{
				if(editEmail==null){
					alert('이메일을 입력하세요')
				}
				else if(editPnum==null){
					alert('휴대폰번호를 입력하세요')
				}
				else if(editPwd==null || editPwdVerify==null){
					alert('사용중인 비번을 입력하세요')
				}
				else if(editPwd!=editPwdVerify || editPwd!=oldPwd){
					alert('현재 비번과 비번확인 불일치')
				}
				else{
					if(editEmail.match(email)){					
						alert('변경할 휴대폰번호가 규칙에 맞지않음')
					}
					else{					
						alert('변경할 이메일이 규칙에 맞지않음')
					}
				}
				return false;
			}
		}
	</script>
	
<!--===============================================================================================-->
	<script src="../js/coza/main.js"></script>
	

</body>
</html>