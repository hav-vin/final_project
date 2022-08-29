/**
 * 
 */
function selectQuestionPage(index){ // 인덱스라는 변수로 받는다? 
	$.ajax({
		url:"../Question/otherPageQu.json", // url 내가 컨트롤러에서 받을 json녀석을 써준다
		type:"POST", // controller에서 받아올Type을 정의해준다 
		dataType :"HTML", // 
		data:{selectedPage: index}, //클릭한 페이지 넘버->다음의 현재페이지   자바에서 정의해준  index를 data로 받아온다
		error:function(error){
			console.log("통신실패");
			console.log(error);
		},
		success:function(response){ //데이터가 잘들어왔을때 response라는 변수 선언 후 response로 써준당  
			console.log("성공 : "+response);
			$("#contentchange").html(response);
		},
	})
}

//function allQuestionPage(index){ // 인덱스라는 변수로 받는다? 
//	$.ajax({
//		url:"../Question/otherPageQu.json", // url 내가 컨트롤러에서 받을 json녀석을 써준다
//		type:"GET", // controller에서 받아올Type을 정의해준다 
//		dataType :"HTML", // 
//		data:{selectedPage: index}, //클릭한 페이지 넘버->다음의 현재페이지   자바에서 정의해준  index를 data로 받아온다
//		error:function(error){
//			console.log("통신실패");
//			console.log(error);
//		},
//		success:function(response){ //데이터가 잘들어왔을때 response라는 변수 선언 후 response로 써준당  
//			console.log("성공 : "+response);
//			$("#contentchange").html(response);
//		},
//	})
//}