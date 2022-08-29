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
	<link rel="stylesheet" type="text/css" href="../css/coza/util.css">
	<link rel="stylesheet" type="text/css" href="../css/coza/main.css">
	
	<style>
		
		.container2 * {
		    margin: 0;
		    padding: 0;
		    list-style: none;
		    border: 0;
		    text-decoration: none;
		    font-family: "NanumBarunGothic" , "Malgun Gothic" , sans-serif;
		    letter-spacing: -0.03em;
		}
		
		.con_title {
		    font-size: 34px;
		    color: #333;
		    margin-top: 60px;
		    width: 100%;
		    float: left;
		    margin-bottom: 30px;
		    height: 40px;
		}
		
		input {
		    -webkit-writing-mode: horizontal-tb !important;
		    text-rendering: auto;
		    color: -internal-light-dark(black, white);
		    word-spacing: normal;
		    text-transform: none;
		    text-indent: 0px;
		    text-shadow: none;
		    display: inline-block;
		    text-align: start;
		    appearance: textfield;		    
		}
		.contents_wrap {
		    width: 930px;
		    float: left;
		    height: 100%;
		    overflow: auto;
		    zoom: 1;
		}
		
		.page_numb {
		    float: left;
		    width: 100%;
		    margin-top: 30px;
		    padding-bottom: 180px;
		    text-align: center;
		}
		.news_board {
		    width: 100%;
		    float: left;
		    border-top: 1px solid #c8c8d5;
		    margin-top: 30px;
		}
		.news_board > ul:after { display:block; clear:both; content:""; }
		div {
		    display: block;
		    overflow: auto;
		    zoom: 1;
		}
		
		li {
		    display: list-item;
		    text-align: -webkit-match-parent;
		}
		.news_board ul li {
		    float: left;
		    width: 903px;
		    padding-left: 27px;
		    position: relative;
 		    line-height: 69px;
		    min-height: 68px;
		    height:auto;
		    border-bottom: 1px solid #e3e3e3;
		    font-size: 16px;
		    color: #333;
		}
		.heart_date {
		    position: absolute;
		    top: 34px;
    		right: 35px;
		}
		.heart_date dl dd {
		    float: left;
		    margin-top: 3px;
		    color: #aaa;
		    font-size: 12px;
		    font-family: "Tahoma";
		}
		.heart_date dl dt {
		    float: left;
		    margin-right: 5px;
		    margin-top: 1px;
		}
		dt {
		    display: block;
		}
		.news_board ul li a {
		    color: #333;
		    float: left;
		    line-height: 69px;
		}
		.news_board ul li div.heart_date {
		    top: 0;
		    right: 0;
		    width: 110px;
		}
		.fix_sort {
		    float: right;
		    padding: 0 10px 0 10px !important;
		    font-size: 13px;
		    color: #333;
		    height: 38px;
		    line-height: 38px;
		    border: 1px solid #e3e3e3;
		    border-right: 0;
		    margin-top: 16px;
		    min-width: 67px;
		    position: relative;
		    background: none !important;
		    text-align: center;
		}
		.sort_wrap a {
		    width: 100%;
		    float: left;
		    color: #666;
		    padding-right: 30px;
		    font-weight: normal;
		}
		.word_input input {
		    height: 38px;
		    line-height: 38px;
		    background-color: #fff;
		    border: 1px solid #e3e3e3;
		    padding: 0 29px 0 20px;
		    float: left;
		}
		.word_input {
		    float: right;
		    position: relative;
		    margin-top: 16px;
		}
		.word_input span.btn2 {
		    position: absolute;
		    right: 8px;
		    top: -5px;
		    height: 21px;
		}
		.sort_wrap {
		    float: right;
		    padding: 0 30px 0 10px;
		    font-size: 13px;
		    color: #333;
		    height: 38px;
		    line-height: 38px;
		    border: 1px solid #e3e3e3;
		    border-right: 0;
		    margin-top: 16px;
		    background: url(https://ssl.nx.com/s2/game/maplestory/renewal/common/search_down_bg.jpg) #fff right center no-repeat;
		    min-width: 67px;
		    position: relative;
		}
		
		input {
		    -webkit-writing-mode: horizontal-tb !important;
		    text-rendering: auto;
		    color: -internal-light-dark(black, white);
		    letter-spacing: normal;
		    word-spacing: normal;
		    text-transform: none;
		    text-indent: 0px;
		    text-shadow: none;
		    display: inline-block;
		    text-align: start;
		    appearance: textfield;
		    background-color: -internal-light-dark(rgb(255, 255, 255), rgb(59, 59, 59));
		    -webkit-rtl-ordering: logical;
		    cursor: text;
		    margin: 0em;
		    font: 400 13.3333px Arial;
		    padding: 1px 2px;
		    border-width: 2px;
		    border-style: inset;
		    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(195, 195, 195));
		    border-image: initial;
		}
		a{
			color: #868e96;
		}
		.page_move {
		    float: left;
		    margin-top: 40px;
		    width: 100%;
		    padding-bottom: 180px;
		}
		.page_move > ul > li:first-child {
		    border-top: 1px solid #e3e3e3;
		}
		.page_move > ul > li {
		    float: left;
		    width: 100%;
		    height: 45px;
		    line-height: 46px;
		    border-bottom: 1px solid #e3e3e3;
		}
		.notice_title {
		    float: left;
		    font-size: 15px;
		    color: #666;
		}
		.page_move_info {
		    float: right;
		    height: 100%;
		}
		.page_move > ul {
		    float: left;
		    width: 100%;
		    height: 100%;
		}
		.page_move_btn {
		    float: left;
		    margin-left: 27px;
		    margin-right: 24px;
		    font-size: 15px;
		    line-height: 1;
		    margin-top: 15px;
		}
		.lili > ul > li {
			   float: left;
			   width: 100%;
			   height: 40px;
			   line-height: 30px;
			   border-bottom: 1px solid #e3e3e3;
			}
		.back_btn {
		    display: inline-block;
		    font-size: 13px;
		    color: #666;
		    padding: 13px 11px;
		    line-height: 1;
		    border: 1px solid #e6e6e6;
		}
		.cm_write {
		    float: right;
		    text-align: right;
		    width: auto;
		    margin-top: 15px;
		    margin-right: 15px;
		}
		.btn02_b {
		    min-width: 53px;
		    font-size: 16px;
		    color: #fff !important;
		    text-align: center;
		    background-color: #455d9d;
		    border-radius: 2px;
		    padding: 10px 14px 10px 14px;
		    border: 1px solid #455d9d;
		    display: inline-block;
		    line-height: 1;
		}
		div{
			overflow: visible;
		}
	</style>
	
	
	<script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script type="text/javascript">	
		$(function() {
			$("#MyQandA").on("click", function(){
				$.ajax({
				   url: "../Question/otherPageQu.json", 
				   type: "POST",
				   dataType: "json",
				   data: { userid: $("#userid").val()},				
				   success: function(responseData){
					 if(!responseData){
						 alert("존재하지 않는 제목");
						 return false;
					 }
					 var html= "<div class='wrap-table-shopping-cart'>";
						 html += "<table class='table-shopping-cart'><tr class='table_head'><th class='column-1'>Subject</th>";
						 html += "<th class='column-4'>Date</th><th class='column-5'>Finish</th></tr>";
					 if(responseData.length != 0){
 						 for(var i=0; i<responseData.length; i++){
							html += "<tr class='table_row'>";
							html += "<td class='column-2'>"+responseData[i].qsub+"</td>";
							html += "<td class='column-4'>"+responseData[i].qdate+"</td>";
							if(responseData[i].qreply != 0){
								html += "<td class='column-5'>답변완료</td></tr>";
							}
							else{
								html += "<td class='column-5'>답변미완료</td></tr>";
							}
						 }
 					 }else{
 						 html += "<tr class='table_row'><td colspan='5'><center>작성된 글 없음</center></td></tr></table></div>";
 					 }
  					 html += "</table></div>";
  						
  					 $("#contentchange").html(html);
				   }
			   });
		   });
		})//start-end
		
		function tempfunc() {
			var html = "";
			 html= "<div class='wrap-table-shopping-cart'>";
			 html += "<table class='table-shopping-cart'><tr class='table_head'><th class='column-1'>Subject</th>";
			 html += "<th class='column-4'>Date</th><th class='column-5'>Finish</th></tr>";
			 html += "<tr class='table_row'>";
			 html += "<td class='column-2'>제목</td>";
			 html += "<td class='column-4'>날짜</td>";
			 html += "<td class='column-5'>미완료</td></tr>";
			 html += "</table></div>";
			document.getElementById("contentchange").innerHTML = html;
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
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('../images/coza/bg-01.jpg');margin-top:-40px">
		<h2 class="ltext-105 cl0 txt-center">
			<img src = "../images/고객센터.png">
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
								Categories
							</h4>

							<ul id="accordion" class="accordion">
								<li class="bor18" id="QandA">
								<c:choose>
									<c:when test="${ !empty admin }">
										<a href="#" onclick="selectQuestionPage(1)" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
											Q&A
										</a>
									</c:when>
									<c:otherwise>
										<a href="../gxsx/contact.do" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
											Q&A
										</a>
									</c:otherwise>
								</c:choose>
								</li>
								
								<ul id="question-paging" class="pagination" style="display:inline-flex">
									<c:choose>
										<c:when test="${ !empty admin }">
										</c:when>
										<c:otherwise>
											<li class="bor18" id="MyQandA">
												<tbody id="question">
													<a href="#" onclick="selectQuestionPage(1)"  class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
														My Q&A
													</a>
												</tbody>	
											</li>
										</c:otherwise>
									</c:choose>
								
								</ul>
							</ul>
							<input id="currentPage" type="hidden" value="${questionPage.currentPage}">
							<input id="prevPage" type="hidden" value="${questionPage.currentPage}">
							<input id="startPage" type="hidden" value="${questionPage.startPage}">
							<input id="endPage" type="hidden" value="${questionPage.endPage}">
							<input id="rangeSize" type="hidden" value="${questionPage.rangeSize}">
							<input id="pageCount" type="hidden" value="${questionPage.pageCount}">
							
							
						</div>
					</div>
				</div>
				
				
				<div class="col-md-8 col-lg-9 p-b-80" id="contentchange"> <!-- 본문 들어갈 div -->
					<!-- 경빈 -->

				<!-- Content page -->
				
				<section class="bg0 p-t-62 p-b-60">
					<div class="container">  <!-- style="padding-left:110px"-->
						<!-- d -->
						<div class="contents_wrap" id="contents_wrap" style="margin-top:-105px;width:800px">
							 <h1 class="con_title">
			                </h1> <div></div>
								<form id='questionco_form' name='input' method='post' action='../Question/reupdate.do' accept-charset='UTF-8'>
			                       <div class="news_board">
			                           <!-- notice ul str -->
			                           <ul>
				                           <li style="width:800px">
					                           <p class="last fs-13" style="float:right;">${loginuser.userid}</p>
					                           <span class="qs_id fs-15">&emsp;${question.qsub}</span>
				                           </li>
			                               <!--게시물 Loop : Str-->
			                                   <li style="width:800px">
			                                   		<div class="qs_text" style="word-break:keep-all">
														<p class="fs-13">
				                                           <span>&emsp;${question.qcon}</span>
														</p>
													</div>
			                                   </li>
			                           </ul>
									</div>
									
									<div class="news_board">
			                           <!-- notice ul str -->
			                           <ul>
				                           <li style="width:800px">
					                           <span class="qs_id fs-15"><img src="https://ssl.nx.com/s2/game/maplestory/renewal/common/notice_icon02.png"><b>&emsp;산신령 답변</b></span>
				                           </li>
			                               <!--게시물 Loop : Str-->
			                                   <li style="width:800px">
			                                   		<div class="qs_text" style="word-break:keep-all">
														<p class="fs-13">
				                                           <span>&emsp;${question.qreply}</span>
														</p>
													</div>
			                                   </li>
			                                    </ul>
			                                   <span class="con_title_btn fs-13"> <a href="#" onclick="selectQuestionPage(1)" class="back_btn" 
			                                   					style="width:56px; text-align:center;float:right;margin-top:20px">목록</a></span>
			                          
			                        <c:if test="${ admin}">	
			                        							
										<div id="comment-input" class="container" style="margin-top:25px">
											<c:if test="${empty question.qreply}">
												<label for="content">관리자 댓글</label>
												<form action="reupdate.do" method="POST">
													<div class="input-group">
														<input type="hidden" id="qno" name="qno"
															value="${question.qno}" /> <input type="text"
															class="form-control" id="content" name="content"
															placeholder="내용을 입력하세요."> <span
															class="input-group-btn">
															<c:if test="${ admin }">
																<c:if test="${!empty sessionScope.loginuser}">
																	<button class="back_btn" type="submit" style="width:110px; text-align:center;margin-right:-15px;margin-left:10px">등록</button>
																</c:if>
															</c:if>
														</span>
													</div>
												</form>
											</c:if>
										</div>
									</form>
								
									<c:if test="${!empty question.qreply}">
										<div id="comment_update_btn">
										<c:if test="${admin}">
		      								<button class="back_btn" type="button" style="width:80px; text-align:center;margin-top:-5px" onclick="qreply('${question.qno}','${question.qreply}');">답변수정</button>
		    							</c:if>	
		    							</div>
									</c:if>
								</c:if>
									
									<script>		
										function questionco_form() {
											if (confirm("관리자 댓글을 등록하시겠습니까??") == true) {
												document.getElementById(
														'questionco_form').submit();
											} else {
												return false;
											}
										}
									</script>
									</div>
									
							</div>
						
						<!-- d -->
					</div>
				</section>
				
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

<!--===============================================================================================-->
	<script src="../js/coza/main.js"></script>
	
<!-- ======question========================================================================================== -->
	<!-- 자바스크립트  -->
	<script src="../js/tempjs/question.js"></script>
	<!-- 자바스크립트  -->
	<script src="../js/tempjs/questionrepley.js"></script>
<!-- 수정버튼 안보이게하기! =================================================================== -->
	<script>
 
 
</script>	
</body>
</html>