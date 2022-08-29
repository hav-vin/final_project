<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>GxSx indexpage</title>
  
  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'/>
  <link rel='stylesheet' href='css/indexpage.css'/> 
</head>
<body>

<!-- partial:index.partial.html -->
	<div id="app-cover">
	  <div id="app">
	    <form action="finditem/list.do" method="get">
	      <div id="f-element">
	        <div id="inp-cover">
	        	<input type="text" name="query" id="query" placeholder="분실물 검색" autocomplete="off">
	        	<a href="gxsx/domain.do"><img src="images/arrow2.png" alt="#" style="position:fixed; right:150px; top:46%"></a>
	        </div>
	        
	      </div>
	      <!-- 	      <button onclick="indexSearchAction(1, true);" id="btnsearch" type="button" class="shadow"><i class="fas fa-search"></i></button>	       -->
	       <button id="btnsearch" type="submit" class="shadow"><i class="fas fa-search"></i></button>	      
	    </form>	    

	  </div>
	  <div id="layer" title="Click the blue area to hide the form"></div>
	  <div id="init"></div>
	</div>
	

<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
  <script src='js/indexpage.js'></script>
  <script src='js/search.js'></script>
 
</body>
</html>