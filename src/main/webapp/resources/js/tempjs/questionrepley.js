/**
 * 
 */
function qreply(qno, content){ 
	if($('#comment_update_btn').is(":visible")){
	$('#comment_update_btn').hide();	
	
	var newInput_html = "";
	newInput_html+="<label for='content'>comment</label>"
    
    +"<form action='reupdate.do' method='POST'>"
        +"<div class='input-group'>"
           +"<input type='hidden' id='qno' name='qno' value='"+qno+"'/>"
           +"<input type='text' class='form-control' id='content' value='"+content+"' name='content' placeholder='내용을 입력하세요.'>"
           +"<span class='input-group-btn'>"
                +"<button class='back_btn' type='submit' style='width:110px; text-align:center;margin-right:-15px;margin-left:10px'>등록</button>"
           +"</span>"
          +"</div>"
    +"</form>";
	}
	document.getElementById("comment-input").innerHTML = newInput_html;
}
