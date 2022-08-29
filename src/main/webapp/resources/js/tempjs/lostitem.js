/**
 * 
 */

function selectlostitemPage(index){ // 인덱스라는 변수로 받는다? 
	$.ajax({
		url:"../lostitem/paging.json", // url 내가 컨트롤러에서 받을 json녀석을 써준다
		contentType : "application/json", // ??
		type:"GET", // controller에서 받아올Type을 정의해준다 
		dataType :"json", // 
		data:{selectedPage: index}, //클릭한 페이지 넘버->다음의 현재페이지   자바에서 정의해준  index를 data로 받아온다
		error:function(error){
			console.log("통신실패");
			console.log(error);
		},
		success:function(response){ //데이터가 잘들어왔을때 response라는 변수 선언 후 response로 써준당  
			console.log("성공 : "+response);
			var newData ="";
				newData += "<div id='fh5co-news' class='fh5co-light-grey' style='padding-bottom:20px'>";
				newData += "<div class='row'>";
			if(response.list.length != 0){				
			for(var i=0; i<response.list.length; i++){
				console.log(response.list[i].losub);
					newData += "<div class='col-md-3 animate-box'>"; //css js 가 안먹혀서 안뜨는중 (클래스이름바꾸면 뜸 -> 안먹힌상태)
					newData += "<div class='news' id='news'>";
					newData += "<a href='#' class='img-holder'><img class='img-responsive'";
					newData += "src='../images/Lostimgs/"+response.list[i].lopicname+"' alt='image!!'></a>";
					newData += "<div class='desc'>";
					newData += "<span class='date'>"+response.list[i].lodata+"</span>";
					newData += "<h3><a href='#'>"+response.list[i].losub+"</a></h3>";
					newData += "<p>"+response.list[i].locon+"</p>";
					newData += "</div></div></div>";
				}
			}else{
				newData += "<center>데이터가 하나도 없음</center>";
				
			}
			newData += "</div></div>";
			
			$("#row2").html(newData);
			
			var paging_html="";
			console.log("startPage : "+response.page.startPage);
			if(response.page.startPage == 1){
				console.log("걸렸나?제발");
				paging_html+="<li class='page-item disabled'>"
					+"<span class='page-link'>Previous</span>"
					+"</li>";
			}else{
				paging_html+="<li class='page-item' onclick='selectlostitemPage("+(response.page.startPage-1)+")'>"
				+"<span class='page-link'>Previous</span>"
				+"</li>";				
			}
			
			for(var i = response.page.startPage; i<=response.page.endPage; i++){
		    	if(String(index) == String(i)){
		    		paging_html+="<li id='pageNum"+i+"' class='page-item active' onclick='selectlostitemPage("+i+")'>"
		    		+"<span class='page-link'>"
		    		+i
		    		+"</span>"
		    		+"</li>";		    		
		    	}else{
		    		paging_html+="<li id='pageNum"+i+"' class='page-item' onclick='selectlostitemPage("+i+")'>"
		    		+"<span class='page-link'>"
		    		+i
		    		+"</span>"
		    		+"</li>";	    		
		    	}
			}
			
			if(response.page.endPage==response.page.pageCount){
				paging_html+="<li class='page-item disabled'>"
				+"<span class='page-link'>Next</span>"
				+"</li>";
			}else{
				paging_html+="<li class='page-item' onclick='selectlostitemPage("+(response.page.endPage+1)+")'>"
				+"<span class='page-link'>Next</span>"
				+"</li>";
			}
			
			$("#paging").html(paging_html);
			
		}
	});
}