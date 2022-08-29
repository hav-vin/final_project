<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			
                       <div class="news_board">
                       
                           <ul>
                               <!--게시물 Loop : Str-->
                               <c:forEach items="${noticeList}" var="notice" varStatus="status">
                                   <li>
										<p>
											<a href="../gxsx/noticeCon.do?nono=${notice.nono}">
                                             <em><img src="https://ssl.nx.com/s2/game/maplestory/renewal/common/${notice.nocate}.png"></em>
                                              <span>&emsp;${notice.nosub}</span>
                                              <c:if test="${today==notice.nodate}">
                                                <img class="new" alt="" src="https://ssl.nx.com/s2/game/maplestory/renewal/common/new.png">
                                              </c:if>
											</a>
										</p>
                                       <div class="heart_date">
                                           <dl>
                                               <dt><img src="https://ssl.nx.com/s2/game/maplestory/renewal/common/sub_date_new.png" alt="시계 아이콘"></dt>
                                               <dd>${notice.nodate}</dd>
                                           </dl>
                                       </div>
                                   </li>
                                </c:forEach>
                                <c:if test="${user=='관리자'}">
                                	<span class="cm_write"><a class="btn02_b" href="../gxsx/noticeForm.do">글작성</a></span>
                                </c:if>
                           </ul>
                           
                           
                           <!-- Pagination -->

							<div class="page_numb">
								<c:if test="${listpage.rangeCount>5}">
								    <span class="cm_prev">
								    	<a href="noticeSearch.do?cp=${listpage.startPage-1}&&query=${query}"><img src="https://ssl.nx.com/s2/game/maplestory/renewal/common/cm_prev.png" alt="이전"></a>
								    </span>
							    </c:if>
							    <c:forEach begin="1" end="5" var="i">
							    	<c:choose>
						   			    <c:when test="${i==listpage.currentPage && i<=listpage.pageCount}">
						                	<a class="active" href="noticeSearch.do?cp=${i}&&query=${query}">${i}</a>
						                </c:when>
						                <c:when test="${i!=listpage.currentPage && i<=listpage.pageCount}">
						                    <a href="noticeSearch.do?cp=${i}&&query=${query}">${i}</a>
						                </c:when>
						                <c:otherwise>
						                    <p></p></a>
						                </c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${listpage.pageCount>5}">
								    <span class="cm_next">
								    	<a href="noticeSearch.do?cp=${listpage.endPage+1}&&query=${query}"><img src="https://ssl.nx.com/s2/game/maplestory/renewal/common/cm_next.png" alt="다음"></a>
								    </span>
							    </c:if>
							</div>
							