/**
 * 
 */
var losub;
var locname;
var startDate = null;
var endDate = null;
var loano;
//let fiplace; //TODO : 장소 입력 css 설계 이후 javascript 정의
function searchAction(nextPage, isSearch){
	let date_range = document.getElementById("result-2").innerText.trim();
	
//	console.log("1 : "+fisub);
//	console.log("2 : "+ficname);
//	console.log("3 : "+startDate);
//	console.log("4 : "+endDate);
	
	if(date_range != ""){
		date_range = splitDate(date_range);
		startDate = date_range[0];
		endDate = date_range[1];
	}
	
	//undefined 처리
	if(typeof locname === 'undefined'){
		locname = null;
	}
	if(typeof losub == 'undefined'){
		losub = null;
	}
	if(typeof loano == 'undefined'){
		loano = -1;
	}
	
	let input_data = {
		startDate: startDate,
		endDate: endDate,
		losub: losub,
		locname: locname,
		isSearch: isSearch,
		nextPage: nextPage,
		loano: loano
	};
	console.log(input_data);
	$.ajax({
		url: "loslist.do",
		type: "POST",
		data: input_data,
		dataType: "HTML",
		success: function(responseData){
			$('#changing-list').html(responseData);
		}
	});
}

let prev_tag;
function selectTag(index, tag){
	let temp = tag.innerHTML;
	locname = temp.trim();
	
	if(typeof prev_tag != 'undefined'){
		document.getElementById('category-'+prev_tag).style.borderColor = "#ccc";
	}
	if(prev_tag == index){
		tag.style.borderColor = "#ccc";
		locname = undefined;
	}else{
		tag.style.borderColor = "#3486eb";
		locname = temp.trim();
	}
	prev_tag = index;
}

let prev_area;
function selectArea(area, value){
	if(typeof prev_area != 'undefined'){
		document.getElementById('area-'+prev_area).style.borderColor = "#ccc";
	}
	if(prev_area == value){
		area.style.borderColor = "#ccc";
		loano = undefined;
	}else{
		area.style.borderColor = "#3486eb";
		loano = value;
	}
	prev_area = value;
}

const search_input = document.getElementById("query");
function selectSub(){
	losub = query.value;
	//console.log(query.value);
}