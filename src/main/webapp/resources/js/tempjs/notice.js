function noticeSearch(){
	$.ajax({
		url:"../gxsx/noticeSearch.json", 
		type:"GET",
		dataType :"HTML",
		data:{query: $("#query").val()},
		error:function(error){
			console.log("통신실패");
			console.log(error);
		},
		success:function(response){
			console.log("성공 : "+response);
			$("#news_board").html(response);
		},
	})
}