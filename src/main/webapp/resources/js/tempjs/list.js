/**
 * 
 */
function selectLostItemPage(index){
	$.ajax({
		url:"/test/Users/otherPageLo.json",
		contentType : "application/json",
		type:"GET",
		dataType :"json",
		data:{selectedPage: index}, //클릭한 페이지 넘버->다음의 현재페이지
		error:function(error){
			console.log("통신실패");
			console.log(error);
		},
		success:function(response){
			console.log("성공 : "+response);
			var newData ="";
			for(var i=0; i<response.list.length; i++){
				newData += "<tr>"
					+ "<TD>"+response.list[i].lono+"</TD>"
				+ "<TD>"
				+ "<img src= '../../resources/Lostimgs/"+response.list[i].lopicname+"' width=100px height=100px>"
				+ "</TD>"
				+ "<TD>"+response.list[i].louid+"</TD>"
				+ "<TD>"+response.list[i].locname+"</TD>"
			    + "<TD>"
			      + "<a href='content.do?seq="+response.list[i].lono+"'>"
				   + response.list[i].losub
				  + "</a>"
				+ "</TD>"
				+ "<TD>"+response.list[i].lodate+"</TD>"
				+ "</tr>";
			}
			
			var paging_html="";
			console.log("startPage : "+response.page.startPage);
			if(response.page.startPage == 1){
				console.log("걸렸나?제발");
				paging_html+="<li class='page-item disabled'>"
					+"<span class='page-link'>Previous</span>"
					+"</li>";
			}else{
				paging_html+="<li class='page-item' onclick='selectLostItemPage("+(response.page.startPage-1)+")'>"
				+"<span class='page-link'>Previous</span>"
				+"</li>";				
			}
			
			for(var i = response.page.startPage; i<=response.page.endPage; i++){
		    	if(String(index) == String(i)){
		    		paging_html+="<li id='pageNum"+i+"' class='page-item active' onclick='selectLostItemPage("+i+")'>"
		    		+"<span class='page-link'>"
		    		+i
		    		+"</span>"
		    		+"</li>";		    		
		    	}else{
		    		paging_html+="<li id='pageNum"+i+"' class='page-item' onclick='selectLostItemPage("+i+")'>"
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
				paging_html+="<li class='page-item' onclick='selectLostItemPage("+(response.page.endPage+1)+")'>"
				+"<span class='page-link'>Next</span>"
				+"</li>";
			}
			
			$("#lost-paging").html(paging_html);
			
			$('#lostItems').html(newData);
			
		},
	})
}

function selectFindItemPage(index){
	$.ajax({
		url:"/test/Users/otherPageFi.json",
		contentType : "application/json",
		type:"GET",
		dataType :"json",
		data:{selectedPage: index}, //클릭한 페이지 넘버->다음의 현재페이지
		error:function(error){
			console.log("통신실패");
			console.log(error);
		},
		success:function(response){
			console.log("성공 : "+response);
			var newData ="";
			for(var i=0; i<response.list.length; i++){
				newData += "<tr>"
					+ "<TD>"+response.list[i].fino+"</TD>"
				+ "<TD>"
				+ "<img src= '../../resources/Findimgs/"+response.list[i].fipicname+"' width=100px height=100px>"
				+ "</TD>"
				+ "<TD>"+response.list[i].fiuid+"</TD>"
				+ "<TD>"+response.list[i].ficname+"</TD>"
			    + "<TD>"
			      + "<a href='content.do?seq="+response.list[i].fino+"'>"
				   + response.list[i].fisub
				  + "</a>"
				+ "</TD>"
				+ "<TD>"+response.list[i].fidate+"</TD>"
				+ "</tr>";
			}
			
			var paging_html="";
			console.log("startPage : "+response.page.startPage);
			if(response.page.startPage == 1){
				console.log("걸렸나?제발");
				paging_html+="<li class='page-item disabled'>"
					+"<span class='page-link'>Previous</span>"
					+"</li>";
			}else{
				paging_html+="<li class='page-item' onclick='selectFindItemPage("+(response.page.startPage-1)+")'>"
				+"<span class='page-link'>Previous</span>"
				+"</li>";				
			}
			
			for(var i = response.page.startPage; i<=response.page.endPage; i++){
		    	if(String(index) == String(i)){
		    		paging_html+="<li id='pageNum"+i+"' class='page-item active' onclick='selectFindItemPage("+i+")'>"
		    		+"<span class='page-link'>"
		    		+i
		    		+"</span>"
		    		+"</li>";		    		
		    	}else{
		    		paging_html+="<li id='pageNum"+i+"' class='page-item' onclick='selectFindItemPage("+i+")'>"
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
				paging_html+="<li class='page-item' onclick='selectFindItemPage("+(response.page.endPage+1)+")'>"
				+"<span class='page-link'>Next</span>"
				+"</li>";
			}
			
			$("#find-paging").html(paging_html);
			
			$('#findItems').html(newData);
			
		},
	})
}
