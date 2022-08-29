<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

                <h1 class="con_title">공지사항</h1>
                    	<div></div><div></div>

                       <div class="news_board fs-12" style="padding-top:20px;overflow: hidden">
                       			<form class='form2 fs-12' id='form2' autocomplete='off' action='noticeEdit.do'>
                       				<input type='hidden' name='nono' value="${notice.nono}">
									<div class='form-group row'>
											<label for='inputArea'
												class='col-lg-2 col-form-label form-control-label'>Category</label>
											<div class='col-lg-3'>
											      <select class="ui fluid dropdown" name='nocate'>
												    <option value="notice_icon01">공지&emsp;&emsp;&emsp;</option>
												    <option value="notice_icon02">점검</option>
												    <option value="notice_icon03">GM</option>
											      </select>
											</div>
											<label for='inputPlace'
												class='col-lg-1 col-form-label form-control-label' style="text-align:right">Subject</label>
											<div class='col-lg-6'>
												<input class='form-control fs-12' type='text' id='editPlace'
													name='nosub' required='' style="height: 34px;" value="${notice.nosub}">
											</div>
										</div>
										
										<div class='form-group row'>
											<label for='inputPnum'
												class='col-lg-2 col-form-label form-control-label'>Content</label>
											<div class='col-lg-10'>
												<textarea rows="2" class='form-control csisize fs-12' type='text' id='editCon'
													name='nocon' required='' style="height: 330px;">${notice.nocon}</textarea>
											</div>
										</div>
                                
                                <button class="cm_write btn02_b" type='submit'>작성완료</button>
                           <!-- notice ul end -->
                           </form>
						</div>	