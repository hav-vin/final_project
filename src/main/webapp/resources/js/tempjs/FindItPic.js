/**
 * 
 */

function selectFindItPicPage(index){ // 인덱스라는 변수로 받는다? 
	$.ajax({
		url:"../findItPic2/paging.json", // url 내가 컨트롤러에서 받을 json녀석을 써준다
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
			for(var i=0; i<response.list.length; i++){
			console.log("뭐야이 : "+response.list);
				newData += "<tr align='center' noshade>"
					+ "<TD>"+response.list[i].fino+"</TD>"
				+ "<TD>"+response.list[i].fisub+"</TD>"
				+ "<TD>"+response.list[i].ficon+"</TD>"
			    + "<TD>"+response.list[i].fidate+"</TD>"
				+ "</tr>";
			}
			
			var paging_html="";
			console.log("startPage : "+response.page.startPage);
			console.log("endPage : "+response.page.endPage);
			if(response.page.startPage == 1){
				console.log("걸렸나?제발");
				paging_html+="<li class='page-item disabled'>"
					+"<span class='page-link'>Previous</span>"
					+"</li>";
			}else{
				paging_html+="<li class='page-item' onclick='selectFindItPicPage("+(response.page.startPage-1)+")'>"
				+"<span class='page-link'>Previous</span>"
				+"</li>";				
			}
			
			for(var i = response.page.startPage; i<=response.page.endPage; i++){
		    	if(String(index) == String(i)){
		    		paging_html+="<li id='pageNum"+i+"' class='page-item active' onclick='selectFindItPicPage("+i+")'>"
		    		+"<span class='page-link'>"
		    		+i
		    		+"</span>"
		    		+"</li>";		    		
		    	}else{
		    		paging_html+="<li id='pageNum"+i+"' class='page-item' onclick='selectFindItPicPage("+i+")'>"
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
				paging_html+="<li class='page-item' onclick='selectFindItPicPage("+(response.page.endPage+1)+")'>"
				+"<span class='page-link'>Next</span>"
				+"</li>";
			}
			$("#paging").html(paging_html);
			
			$('#FindItPic').html(newData);
			
		},
	})
}