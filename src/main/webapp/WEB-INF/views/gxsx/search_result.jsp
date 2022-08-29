<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row isotope-grid">

  <c:if test="${empty findResult.list}">
	  <center>데이터가 하나도 없음</center>
  </c:if>
	
  <c:forEach items="${findResult.list}" var="finditem">
	<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item ${finditem.ficname}">
		<!-- Block2 -->
		<div class="block2">
			<div class="block2-pic hov-img0">
				<c:if test="${ empty loginuser && empty klogin}">
           			<a href="../gxsx/login.do"><img src="../images/Findimgs/${finditem.fipicname}" alt="IMG-PRODUCT"></a>
           		</c:if>
           		<c:if test="${ (!empty loginuser && empty kakaologout_url) || (!empty klogin && !empty kakaologout_url)}">
					<a href="../finditem/content.do?fino=${finditem.fino}"><img src="../images/Findimgs/${finditem.fipicname}" alt="IMG-PRODUCT"></a>
				</c:if>
			</div>

			<div class="block2-txt flex-w flex-t p-t-14">
				<div class="block2-txt-child1 flex-col-l ">
					<span class="m-r-3">
						<c:if test="${ empty loginuser && empty klogin}">
		           			<a href="../gxsx/login.do"><span class="cl5">${finditem.fisub}</span></a>
		           		</c:if>
		           		<c:if test="${ (!empty loginuser && empty kakaologout_url) || (!empty klogin && !empty kakaologout_url)}">
							<a href="../finditem/content.do?fino=${finditem.fino}"><span class="cl5">${finditem.fisub}</span></a>
						</c:if>
					</span>
					<a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"></a>

					<span class="stext-105 cl3">
						<i class="zmdi zmdi-calendar"></i>&nbsp;${finditem.fidate}
					</span>
					<span class="cl4"><i class="zmdi zmdi-pin"></i>&nbsp;${finditem.fiplace}</span>
				</div>

				<div class="block2-txt-child2 flex-r p-t-3">
					<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
						<img class="icon-heart1 dis-block trans-04" src="../images/coza/icons/icon-heart-01.png" alt="ICON">
						<img class="icon-heart2 dis-block trans-04 ab-t-l" src="../images/coza/icons/icon-heart-01.png" alt="ICON">
					</a>
				</div>
				
			</div>						
		</div>
	</div>
  </c:forEach>
  
</div>
	<div class="btn-nextprev">
		<c:if test="${ findResult.paging.currentPage != 1 }">
			<button class="arrow-slick3 prev-slick3 slick-arrow" style=""
			onclick="searchAction('${findResult.paging.prevPage}', false);">
			<i class="fa fa-angle-left" aria-hidden="true"></i></button>
		</c:if>
		<c:if test="${ findResult.paging.currentPage != findResult.paging.pageCount }">
		<button class="arrow-slick3 next-slick3 slick-arrow" style=""
		onclick="searchAction('${findResult.paging.nextPage}', false);">
		<i class="fa fa-angle-right" aria-hidden="true"></i></button>
		</c:if>
	</div>

	<!-- Pagination -->
	<div class="flex-c-m flex-w w-full p-t-38" id="paging">
		<c:if test="${ findResult.paging.startPage != 1 }">
			<p class="flex-c-m how-pagination1 trans-04 m-all-7" onclick="searchAction('${ findResult.paging.startPage-1 }',false);">&#171;</p>
		</c:if>		
		 
	    <c:forEach begin="${ findResult.paging.startPage }" end="${ findResult.paging.endPage }" var="i">
	    	<c:choose>
	    		<c:when test="${ findResult.paging.currentPage == i }">
	    			<p class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"
	    			onclick="searchAction('${i}', false);">${i}</p>
	    		</c:when>
	    		<c:otherwise>
		    		<p class="flex-c-m how-pagination1 trans-04 m-all-7"
		    		onclick="searchAction('${i}', false);">${i}</p>
	    		</c:otherwise>
	    	</c:choose>
	    </c:forEach>
		
		<c:if test="${ findResult.paging.endPage != findResult.paging.pageCount }">
		    <p class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"
		    	onclick="searchAction('${findResult.paging.endPage+1}', false);">
		      		&#187;</p>
		</c:if>			    
	</div>
	
<!--===============================================================================================-->

<!-- 	<script src="../js/coza/main.js"></script>    -->