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
	</style>
	
	<script type="text/javascript" language="javascript" 
		     src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script type="text/javascript">	
		function noticeEditForm(nono){
			$.ajax({
				url:"../gxsx/noticeEditForm.json",
				type:"GET",
				dataType :"HTML", 
				data:{nono: nono},
				error:function(error){
					console.log("통신실패");
					console.log(error);
				},
				success:function(response){
					console.log("성공 : "+response);
					$("#contents_wrap").html(response);
				},
			})
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
								<a href="../gxsx/notice.do?cp=1">Notice</a>
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
			<img src="../images/공지사항-w.png">
		</h2>
	</section>

	<!-- Content page -->
	<section class="bg0 p-t-62 p-b-60">
		<div class="container" style="padding-left:110px">
			<!-- d -->
			<div class="contents_wrap" id="contents_wrap">
                <h1 class="con_title">공지사항
                    <div style="float:right;">
                        <span class="word_input" style="margin-top:0;">
                            <span class="con_title_btn fs-13">
                            <a href="../gxsx/notice.do" class="back_btn" style="width:56px; text-align:center;">목록</a></span>
                    </div>
                </h1>
                    	<div></div><div></div>

                       <div class="news_board">
                           <!-- notice ul str -->
                           <ul>
	                           <li>
		                           <p class="last fs-13" style="float:right;">
		                           		<img src="https://ssl.nx.com/s2/game/maplestory/renewal/common/sub_date_new.png" alt="작성 시간" 
		                           			style="margin-right:5px;">${noticeList.nodate}
		                           </p>
		                           
		                           <img src="https://ssl.nx.com/s2/game/maplestory/renewal/common/${noticeList.nocate}.png">
		                           		<span class="qs_id fs-15">&emsp;${noticeList.nosub}</span>
	                           </li>
                               <!--게시물 Loop : Str-->
                                   <li>
                                   		<div class="qs_text" style="word-break:keep-all">
											<p class="fs-13">
	                                           <span>&emsp;${noticeList.nocon}</span>
											</p>
										</div>
                                   </li>
                           </ul>
                           <!-- notice ul end -->
                           <input type='hidden' name='nouid' value='${userid}'>
                           <c:if test="${user=='관리자'}">
                                	<button class="cm_write"><a class="btn02_b" href="noticeDel.do?nono=${noticeList.nono}">삭제</a></button>
                                	<button class="cm_write" id="editbtn"><a class="btn02_b" onclick="noticeEditForm(${noticeList.nono})">수정</a></button>
                           </c:if>

						<div class="news_board lili">
                           <!-- notice ul str -->
                           <ul>
                               <!--게시물 Loop : Str-->
                                   <li style="margin-top:6px;min-height: 40px;">
										<p class="fs-12"> 
											<a href="../gxsx/noticeCon.do?nono=${noticeup.nono}" style="float:center;line-height:30px">                       
												<img src="https://ssl.nx.com/s2/game/maplestory/renewal/common/page_up.png">
												이전글
	                                           &emsp;${noticeup.nosub}</a>
										</p>
                                       <div class="heart_date">
                                           <dl>
                                               <dt><img src="https://ssl.nx.com/s2/game/maplestory/renewal/common/sub_date_new.png" alt="시계 아이콘"></dt>
                                               <dd>${noticeup.nodate}</dd>
                                           </dl>
                                       </div>
                                   </li>
                                   <li style="margin-top:6px;min-height: 40px;">
										<p class="fs-12">                                           
											<a href="../gxsx/noticeCon.do?nono=${noticedown.nono}" style="float:center;line-height:30px">
												<img src="https://ssl.nx.com/s2/game/maplestory/renewal/common/page_down.png">
												다음글
	                                           &emsp;${noticedown.nosub}</a>
										</p>
                                       <div class="heart_date">
                                           <dl>
                                               <dt><img src="https://ssl.nx.com/s2/game/maplestory/renewal/common/sub_date_new.png" alt="시계 아이콘"></dt>
                                               <dd>${noticedown.nodate}</dd>
                                           </dl>
                                       </div>
                                   </li>
                                   
                           </ul>
                           <!-- notice ul end -->
						</div>
                            
						</div>
				</div>
			
			<!-- d -->
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


</body>
</html>