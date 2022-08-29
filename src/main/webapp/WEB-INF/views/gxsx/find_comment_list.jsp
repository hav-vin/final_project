<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%pageContext.setAttribute("LF", "\n");%>

	<input type="hidden" id="comment_num" value="${ comment.size() }">
	<input type="hidden" id="global-fino" value="${ comment[0].fino }">

	<c:forEach items="${ comment }" var="comment">
	
	<c:choose>
		<c:when test="${ comment.depth > 0 }">
			<div class="size-207" id="ficomment_${comment.comno}" style="margin-left:100px">
				<div class="flex-w flex-sb-m p-b-17" style="justify-content: unset">
 					<span class="mtext-107 cl2 p-r-20"> 
 						${comment.userid}
 						<span class="stext-102 cl6">&nbsp; 
 							${comment.codate} </span> 
					</span> 
	
 					<span class="fs-18 cl11"> 
 					<c:if test="${sessionScope.loginuser.userid eq comment.userid }">
					<c:if test="${!empty sessionScope.loginuser}">
 						<button id="btn${comment.comno}"  type="button" onclick="update_form_id(this.value);" value="${comment.comno}" class="stext-109 cl8 hov-cl1 trans-04">수정</button>	
 						<button id="btndel${comment.comno}" type="button" onclick="commentDelete('${comment.comno}', '${ comment.fino }');" value="${comment.comno}" class="stext-109 cl8 hov-cl1 trans-04" >삭제</button>							
 					</c:if>
 					</c:if>	
 						<!-- <a href="#" class="stext-109 cl8 hov-cl1 trans-04"><i class="zmdi zmdi-mail-reply"></i></a>  -->
					</span> 
				</div>
	
				<div id="update-form-${comment.comno}">
					<p class="stext-102 cl6">
						<c:out value="${ comment.contents }" escapeXml="true"/>
					</p>
				</div>
				<br/>
			</div>
		</c:when>
		<c:otherwise>
		    <div class="size-207">
				<div class="flex-w flex-sb-m p-b-17" style="justify-content: unset">
					<input type="hidden" id="who-${ comment.comno }" value="${ comment.userid }">
					<span class="mtext-107 cl2 p-r-20">
						${ comment.userid }
						<span class="stext-102 cl6">&nbsp;
							${ comment.codate } </span>
					</span>
					<span class="fs-18 cl11">
						<a onclick="reply_to(${ comment.comno });" class="stext-109 cl8 hov-cl1 trans-04">reply</a>
					<c:if test="${sessionScope.loginuser.userid eq comment.userid }">
					<c:if test="${!empty sessionScope.loginuser}">
					<button id="btn${comment.comno}"  type="button" onclick="update_form_id(this.value);" value="${comment.comno}" class="stext-109 cl8 hov-cl1 trans-04">수정</button>									
					<button id="btndel${comment.comno}" type="button" onclick="commentDelete('${comment.comno}', '${ comment.fino }');" value="${comment.comno}" class="stext-109 cl8 hov-cl1 trans-04" >삭제</button>	
					</c:if>
					</c:if>
						
					</span>
				</div>
				<div id="update-form-${comment.comno}">
					<p class="stext-102 cl6">
						<c:out value="${ comment.contents }" escapeXml="true"/>
					</p>
				</div>
				<br/>
			</div>
		</c:otherwise>
	</c:choose>
</c:forEach>