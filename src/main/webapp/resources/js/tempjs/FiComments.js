/**
 * 
 */

//댓글 목록 
function commentList(fino){	
	$.ajax({
			url : '../FindComment/findcomment.do',
			type : 'get',
			data : {'fino':fino},
			dataType: "HTML",
			success : function(data){
	            $("#find_comment_list").html(data);
	            let comment_num = document.getElementById("comment_num").value;
	            $('#comment_toggle').text("Comment ("+comment_num+")");
	            global_fino = document.getElementById('global-fino').value;
	        }
	    });
	}


function commentInsert(fino){
	let sendData = {};
	let newInput_html = "";
	let review = document.getElementById('review').value;
	let target = document.getElementById("reply_to").childNodes;
	
	if(typeof target[0] !== 'undefined'){
		target = target[0].value;
		sendData = {
				"contents" : review,
				"fino": fino,
				"cogroup" : target
		}
	}else{
		sendData = {
			"contents": review,
			"fino" : fino
		};
	}
	$.ajax({
		url:"../FindComment/findinsert.json",
		type : "post",
		dataType : "JSON",
		contentType: "application/json",
		data : JSON.stringify(sendData),
		success : function(data){
			if(data){
				commentList(fino);
				alert("댓글이 정상적으로 등록되었습니다.");
				$("#review").val("");
			}else{
				alert("댓글 작성에 실패하였습니다. 오류를 문의해주세요.");
			}
			deleteReply();
		}
	});
}

var prevInput;
var prevTesxt;
var click=0;
////댓글수정폼
function update_form_id(val){
	if(click>0){
		$('#update_txt_'+prevInput).remove();
		$('#btn'+prevInput).text("수정");
		$('#btn'+prevInput).attr("onclick", "update_form_id("+prevInput+");");		
		
		let p_el = '<p class="stext-102 cl6">'+prevText+'</p>';
		$('#update-form-'+prevInput).html(p_el);
	
	}
	click++;
	
	$('#btn'+val).text("수정완료");
	$('#btn'+val).attr("onclick", "do_update("+val+");");

//	console.log("1 : "+val);
	let comment_text = document.getElementById("update-form-"+val).childNodes;
	for(let i=0; i<comment_text.length; i++){
		if(comment_text[i].nodeName == 'P') {
			comment_text = comment_text[i].innerText;
		}
	}
	
	let new_update_input_html = '<input class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="update-txt-'+val+'" value="'+comment_text+'">';
	$('#update-form-'+val).html(new_update_input_html);
	prevText = comment_text;
	prevInput = val;
}
var global_fino;
//댓글수정
function do_update(index){
	click = 0;
	let content = document.getElementById("update-txt-"+index).value;
	$.ajax({
		url : "../FindComment/fiupdate.do",
		type : 'post',
		data : {
			comno : index,
			contents : content
		},
		dataType: "HTML",
		error: function(){
			alert("에러발생");
		},
		success : function(data){
			if(data){
				alert("댓글이 수정이 되었습니당");
			}else{
				alert("댓글 수정 실패 다시 시도해쥬세요");
			}
			commentList(global_fino);
		}
	});
}


function submit(index){
	click = 0;
	document.getElementById('form'+index).submit();
}
//댓글삭제
function commentDelete(val, fino){
	let sendData = new Object;
	sendData.comno = val;
	$.ajax({
		url : "../FindComment/fidelete.json",
		type : 'post',
		contentType : "application/json",
		data : JSON.stringify(sendData),
		dataType : 'JSON',	
		success : function(data){
			if(data){
				alert("댓글이 정상적으로 삭제되었습니다.");
				commentList(fino);
			}else{
				alert("댓글 삭제가 실패하였습니다. 관리자에게 문의해주세요.")
			}
		}
	});
}
function reply_to(who){
	let el = document.getElementById("reply_to");
	let reciever = document.getElementById("who-"+who).value;
	el.innerHTML = "<input id='reply-target-"+who+"' type='hidden' value='"+who+"'>"+reciever+"<span onclick='deleteReply();'> X </span>";
	$("#review").focus();
}

function deleteReply(){
	let el = document.getElementById("reply_to");
	el.innerHTML = "";
}