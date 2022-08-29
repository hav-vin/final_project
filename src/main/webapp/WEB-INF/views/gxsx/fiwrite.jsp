<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="../images/coza/icons/favicon.png" />

<style>

.form-control {
	height: 30px;
}

.csisize {
	height: 70px;
}
</style>

<style type="text/css">
#tabFileName {
	width: 470px;
	text-align: left;
}

#tabFileSize {
	width: 70px;
}

#tabFileDel {
	width: 50px;
}

table, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
}

.dragAndDropDiv {
	border: 2px dashed #92AAB0;
	width: 75%;
	height: 100%;
	color: #92AAB0;
	text-align: center;
	vertical-align: middle;
	padding: 10px 0px 10px 10px;
	font-size: 200%;
	display: table-cell;
}

.progressBar {
	width: 200px;
	height: 22px;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
	display: inline-block;
	margin: 0px 10px 5px 5px;
	vertical-align: top;
}

.progressBar div {
	height: 100%;
	color: #fff;
	text-align: right;
	line-height: 22px;
	/* same as #progressBar height if we want text middle aligned */
	width: 0;
	background-color: #0ba1b5;
	border-radius: 3px;
}

.statusbar {
	border-top: 1px solid #A9CCD1;
	min-height: 25px;
	width: 99%;
	padding: 10px 10px 0px 10px;
	vertical-align: top;
}

.statusbar:nth-child(odd) {
	background: #EBEFF0;
}

.filename {
	display: inline-block;
	vertical-align: top;
	width: 250px;
}

.filesize {
	display: inline-block;
	vertical-align: top;
	color: #30693D;
	width: 100px;
	margin-left: 10px;
	margin-right: 5px;
}

.abort {
	background-color: #A8352F;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	display: inline-block;
	color: #fff;
	font-family: arial;
	font-size: 13px;
	font-weight: normal;
	padding: 4px 15px;
	cursor: pointer;
	vertical-align: top
}

</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
        var objDragAndDrop = $(".dragAndDropDiv");
        
        $(document).on("dragenter",".dragAndDropDiv",function(e){
            e.stopPropagation();
            e.preventDefault();
            $(this).css('border', '2px solid #0B85A1');
        });
        $(document).on("dragover",".dragAndDropDiv",function(e){
            e.stopPropagation();
            e.preventDefault();
        });
        $(document).on("drop",".dragAndDropDiv",function(e){
            
            $(this).css('border', '2px dotted #0B85A1');
            e.preventDefault();
            var files = e.originalEvent.dataTransfer.files;
        
            handleFileUpload(files,objDragAndDrop);
        });
        
        $(document).on('dragenter', function (e){
            e.stopPropagation();
            e.preventDefault();
        });
        $(document).on('dragover', function (e){
          e.stopPropagation();
          e.preventDefault();
          objDragAndDrop.css('border', '2px dotted #0B85A1');
        });
        $(document).on('drop', function (e){
            e.stopPropagation();
            e.preventDefault();
        });
        //drag 영역 클릭시 파일 선택창
        objDragAndDrop.on('click',function (e){
            $('input[type=file]').trigger('click');
        });

        $('input[type=file]').on('change', function(e) {
            var files = e.originalEvent.target.files;
            handleFileUpload(files,objDragAndDrop);
        });
        
        function handleFileUpload(files,obj)
        {
           for (var i = 0; i < files.length; i++) 
           {
                var fd = new FormData();
                fd.append('file', files[i]);
         
                var status = new createStatusbar(obj);
                status.setFileNameSize(files[i].name,files[i].size);
                sendFileToServer(fd,status);
         		uploadFileList.push(fd);
           }
        }
        
        var rowCount=0;
        function createStatusbar(obj){
                
            rowCount++;
            var row="odd";
            if(rowCount %2 ==0) row ="even";
            this.statusbar = $("<div class='statusbar "+row+"'></div>");
            this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
            this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
            this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
            this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
            
            obj.after(this.statusbar);
         
            this.setFileNameSize = function(name,size){
                var sizeStr="";
                var sizeKB = size/1024;
                if(parseInt(sizeKB) > 1024){
                    var sizeMB = sizeKB/1024;
                    sizeStr = sizeMB.toFixed(2)+" MB";
                }else{
                    sizeStr = sizeKB.toFixed(2)+" KB";
                }
         
                this.filename.html(name);
                this.size.html(sizeStr);
            }
            
            this.setProgress = function(progress){       
                var progressBarWidth =progress*this.progressBar.width()/ 100;  
                this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
                if(parseInt(progress) >= 100)
                {
                    this.abort.hide();
                }
            }
            
            this.setAbort = function(jqxhr){
                var sb = this.statusbar;
                this.abort.click(function()
                {
                    jqxhr.abort();
                    sb.hide();
                });
            }
        }
        
        function sendFileToServer(formData,status) 
        {
            var uploadURL = "/GxSx/src/main/webapp/resources/images/finditem"; 
            var extraData ={}; //Extra Data.
            var jqXHR=$.ajax({
                    xhr: function() {
                    var xhrobj = $.ajaxSettings.xhr();
                    if (xhrobj.upload) {
                            xhrobj.upload.addEventListener('progress', function(event) {
                                var percent = 0;
                                var position = event.loaded || event.position;
                                var total = event.total;
                                if (event.lengthComputable) {
                                    percent = Math.ceil(position / total * 100);
                                }
                                //Set progress
                                status.setProgress(percent);
                            }, false);
                        }
                    return xhrobj;
                },
                url: uploadURL,
                type: "POST",
                contentType:false,
                processData: false,
                cache: false,
                data: formData,
                success: function(data){
                    status.setProgress(100);
         
                    //$("#status1").append("File upload Done<br>");           
                },
                error : function(data) {
                }
            }); 
         
            status.setAbort(jqXHR);
        }
        
    });
	</script>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="../js/map.js"></script>
<script type="text/javascript" src="../js/stringBuffer.js"></script>

<script type="text/javascript">
	//폼에 데이터를 추가하기 위해 (파일을 전송하기 전 정보 유지)
	var fd = new FormData();
	//파일 중복 업로드 방지용 맵을 선언한다.
	var map = new Map();
	//submit 버튼을 눌렀을 때 
	var uploadFileList = [];
// 	function submitFile(){
// 		//추가적으로 보낼 파라미터가 있으면 formData에 넣어준다. 
// 		//예를들어 , 게시판의 경우 게시글 제목 , 게시글 내용 등등
// // 		fd.append('temp',$('#temp').val());  
//      	var AllData = new Map();
//         AllData.put('fiuid',$('#fiuid').val()); 
//         console.log("uploadFileList");
//         console.log(uploadFileList);
//         AllData.put('filelist',uploadFileList);
// //         sendFileToServer2(AllData);
				
// 		//ajax로 이루어진 파일 전송 함수를 수행시킨다.
// 		//sendFileToServer();
// 	}

    function sendFileToServer2(formData) //formData를 리스트로받아서
    {
    	console.log(formData);
        var uploadURL = "/GxSx/src/main/webapp/resources/imgs"; //Upload URL 
        $.ajax({
            url: uploadURL,
            type: "POST",
            contentType:false,
            processData: false,
            cache: false,
            data: formData,
            success: function(data){
                alert(111);
     
                //$("#status1").append("File upload Done<br>");           
            },
            error : function(data) {
            	alert(222);
            }
        }); 
    }
    
	function handleFileUpload(files) { 
		//파일의 길이만큼 반복하며 formData에 셋팅해준다.
		var megaByte = 1024*1024;
		for (var i = 0; i < files.length; i++) {
			if(map.containsValue(files[i].name) == false && (files[i].size/megaByte) <= 20 ){
				fd.append(files[i].name, files[i]);
				//파일 중복 업로드를 방지하기 위한 설정
				map.put(files[i].name, files[i].name);
				// 파일 이름과 정보를 추가해준다.
				var tag = createFile(files[i].name, files[i].size);
				$('#fileTable').append(tag);
			}else{
				//중복되는 정보 확인 위해 콘솔에 찍음
				if((files[i].size/megaByte) > 20){
					alert(files[i].name+"은(는) \n 20메가 보다 커서 업로드가 할 수 없습니다.");
				}else{
					alert('파일 중복 : ' + files[i].name);
				}
			}
	    }
	}
	// 태그 생성
	function createFile(fileName, fileSize) {
		var file = {
				name : fileName,
				size : fileSize,
				format : function() {
					var sizeKB = this.size / 1024;
					if (parseInt(sizeKB) > 1024) {
						var sizeMB = sizeKB / 1024;
						this.size = sizeMB.toFixed(2) + " MB";
					} else {
						this.size = sizeKB.toFixed(2) + " KB";
					}
					//파일이름이 너무 길면 화면에 표시해주는 이름을 변경해준다.
					if(name.length > 70){
						this.name = this.name.substr(0,68)+"...";
					}
					return this;
				},
				tag : function() {
					var tag = new StringBuffer();
					tag.append('<tr>');
					tag.append('<td>'+this.name+'</td>');
					tag.append('<td>'+this.size+'</td>');
					tag.append("<td><button id='"+this.name+"' onclick='delFile(this)'>취소</button></td>");
					tag.append('</tr>');
					return tag.toString();					
				}
		}
		return file.format().tag();
	}
	//업로드 할 파일을 제거할 때 수행되는 함수
	function delFile(e) {
		//선택한 창의 아이디가 파일의 form name이므로 아이디를 받아온다.
		var formName = e.id;
		
		//form에서 데이터를 삭제한다.
		fd.delete(formName);
		
		//맵에서도 올린 파일의 정보를 삭제한다.
		map.remove(formName);
		// tr을 삭제하기 위해
		$(e).parents('tr').remove();
		alert('삭제 완료!');		
	}
	$(document).ready(function() {
		var objDragDrop = $(".dragDropDiv");
		// div 영역으로 드래그 이벤트호출
		$(".dragDropDiv").on("dragover",
			function(e) {
				e.stopPropagation();
				e.preventDefault();
				$(this).css('border', '2px solid red');
		});
		// 해당 파일 드랍시 호출 이벤트
		
		$(".dragDropDiv").on("drop", function(e) {
			$(this).css('border', '2px solid green');
			//브라우저로 이동되는 이벤트를 방지하고 드랍 이벤트를 우선시 한다.
			e.preventDefault();
			//DROP 되는 위치에 들어온 파일 정보를 배열 형태로 받아온다.
			var files = e.originalEvent.dataTransfer.files;
			//DIV에 DROP 이벤트가 발생 했을 때 다음을 호출한다.
			handleFileUpload(files);
			
			//sendFileToServer(); //테스팅 20200108
// 			submitFile(); //테스팅 20200108
		});
		// div 영역빼고 나머지 영역에 드래그 원래색변경
		$(document).on('dragover', function(e) {
			e.stopPropagation();
			e.preventDefault();
			objDragDrop.css('border', '2px solid green');
		});
	});
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
							<li>
								<a href="../gxsx/domain.do">Home</a>
							</li>

							<li>
								<a href="../gxsx/notice.do?cp=1">Notice</a>
							</li>

							<li class="label1 active-menu" data-label1="습득물">
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
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.do" class="stext-109 cl8 hov-cl1 trans-04"> 홈 <i
				class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a> <a href="list.do" class="stext-109 cl8 hov-cl1 trans-04">
				습득물 <i class="fa fa-angle-right m-l-9 m-r-10"
				aria-hidden="true"></i>
			</a> <span class="stext-109 cl4"> 글쓰기 </span>
		</div>
	</div>

	<!-- Content page -->
	<section class="bg0 p-t-62 p-b-60">
		<div class="container">
			<div class="col-md-8 col-lg-9 p-b-80" id="contentchange">

				<div class='m-l-25 m-r--38 m-lr-0-xl fs-12'
					style='margin-left: 200px'>
					<br/> <br/>
					<div class='table-shopping-cart fs-12'>
						<div class='card-header'>
							<h3 class='mb-0'>습득물 글작성</h3>
						</div>
						<div class='card-body fs-12'>
							<form class='form2 fs-12' name='input' id='form2' role='form2' method='post' enctype="multipart/form-data"
								autocomplete='off' action='../file/fileUpload/post2.do'>
								<div class='form-group row'>
									<label for='noinputId'
										class='col-lg-2 col-form-label form-control-label'>작성자</label>
									<div class='col-lg-10'>
										<input type='text' class='form-control fs-12' id='editId'
											name='fiuid' value='${loginuser.userid}' readonly='readonly'>
									</div>
								</div>
								
								<div class='form-group row'>
									<label for='noinputId'
										class='col-lg-2 col-form-label form-control-label'>제목</label>
									<div class='col-lg-10'>
										<input type='text' class='form-control fs-12' id='editId'
											name='fisub'>
									</div>
								</div>

								<div class='form-group row'>
									<label for='inputDate'
										class='col-lg-2 col-form-label form-control-label'>날짜</label>
									<div class='col-lg-10'>

										<input class='form-control fs-12' type='date' id='editDate'
											name='fidate' required=''>
									</div>
								</div>

								<div class='form-group row'>
									<label for='inputArea'
										class='col-lg-2 col-form-label form-control-label'>지역</label>
									<div class='col-lg-3' >
										<div class="select-box">
											<select class="ui fluid dropdown" name="fiano" id="ano" onmousedown="if(this.options.length>5){this.size=5;}" onchange='this.size=0;' onblur="this.size=0;">
												<option value="02">서울</option>
												<option value="051">부산</option>
												<option value="053">대구</option>
												<option value="032">인천</option>
												<option value="062">광주</option>
												<option value="042">대전</option>
												<option value="052">울산</option>
												<option value="044">세종</option>
												<option value="031">경기</option>
												<option value="033">강원</option>
												<option value="043">충북</option>
												<option value="041">충남</option>
												<option value="063">전북</option>
												<option value="061">전남</option>
												<option value="054">경북</option>
												<option value="055">경남</option>
												<option value="064">제주</option>
												<option value="0">기타</option>
											</select>
											</div>
										
									</div>
									<label for='inputPlace'
										class='col-lg-2 col-form-label form-control-label'
										style="text-align: right">습득장소</label>
									<div class='col-lg-5'>
										<input class='form-control fs-12' type='text' id='editPlace'
											name='fiplace' required=''>
									</div>
								</div>

								<div class='form-group row'>
									<label for='inputArea'
										class='col-lg-2 col-form-label form-control-label'>물품종류</label>
									<div class='col-lg-3'>
										<div class="select-box">
										<select class="ui fluid dropdown" name="ficname" id="cname" onmousedown="if(this.options.length>5){this.size=5;}" onchange='this.size=0;' onblur="this.size=0;">
											<option value="가방">가방</option>
											<option value="귀금속">귀금속</option>
											<option value="도서용품">도서용품</option>
											<option value="서류">서류</option>
											<option value="산업용품">산업용품</option>
											<option value="핸드폰">핸드폰</option>
											<option value="현금">현금</option>
											<option value="카드">카드</option>
											<option value="노트북">노트북</option>
											<option value="악기">악기</option>
											<option value="지갑">지갑</option>
											<option value="증명서">증명서</option>
											<option value="스포츠용품">스포츠용품</option>
											<option value="전자기기">전자기기</option>
											<option value="자동차">자동차</option>
											<option value="의류">의류</option>
											<option value="기타">기타</option>
										</select>
										</div>
									</div>
									<label for='inputPlace'
										class='col-lg-2 col-form-label form-control-label'
										style="text-align: right">보관장소</label>
									<div class='col-lg-5'>
										<input class='form-control fs-12' type='text' id='editPlace'
											name='fistor' required=''>
									</div>
								</div>

								<div class='form-group row'>
									<label for='inputPnum'
										class='col-lg-2 col-form-label form-control-label'>내용</label>
									<div class='col-lg-10'>
										<textarea rows="2" class='form-control csisize fs-12'
											type='text' id='editCon' name='ficon'
											required=''></textarea>
									</div>
								</div>

								<div class='form-group row'>
									<label for='inputPnum'
										class='col-lg-2 col-form-label form-control-label'>첨부파일</label>
									<div class='col-lg-10'>
										<div id="fileUpload" class="dragAndDropDiv">Drag & Drop
										파일을 첨부하거나 드래그해 올려주세요</div>
									</div>
									<input type="file" name="fileUpload" id="fileUpload"  
										style="display: none;" multiple />
								</div>

								</br>
								<div class='flex-w flex-m m-r-20 m-tb-5'>
									<div
										class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5'
										style='opacity: 0; pointer-events: none'></div>
									<button
										class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10'
										id='submit2' name='submit2'
										type='submit'>
										등록</button>
										&emsp;
									<button
										class='flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10'
										id='submit3' name='submit3' onclick="location.href='../finditem/list.do'">
										취소</button>
								</div>
							</form>
						</div>
					</div>


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
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!--===============================================================================================-->
	<script src="../js/coza/main.js"></script>

	<!-- 자바스크립트  -->
	<script src="../js/tempjs/FiComments.js"></script>

</body>
</html>