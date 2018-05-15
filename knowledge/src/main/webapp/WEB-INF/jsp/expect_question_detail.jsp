<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<jsp:include page="expect_layout.jsp"></jsp:include>
<!-- page content -->
        <div class="right_col" role="main">
          <div class="">
           <div class="row">
                <div class="col-lg-12">
                <h2 class="page-header">Chi tiết câu hỏi được yêu cầu trả lời</h2>
                </div>
                <!-- /.col-lg-12 -->
            </div>
			
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default" style="width: 1050px; margin-left: 10px;">
                    <div class="inner-content clearfix">
                     <div id="question-header">
                     	<h1 itemprop="name"><b>${question.title}</b></h1>
                     </div>
			            <div class="question-detail" data-questionid="43651814" id="question">
							<div class="post-layout">
			            		<div class="postcell post-layout--right">
			    					<div class="post-text" itemprop="text">
										<p>${question.questionContent}</p>
			    					</div>
			    					<c:if test="${not empty question.post}">
				        				<div class="post-text">
											<em>Linh bài viết:<a href="/expect/post/detail/${question.post.postId }"> ${question.post.postTitle}</a></em>
				    					</div>
			    					</c:if>
			    					<div id="tag-lst" style="width: 400px; float: left">
							              <span class="question-category">
							              	<c:forEach var="topic" items="${question.topics}">
									            <button type="button" class="btn btn-default btn-xs" style="background-color: #b4d3ea; border-color: #b4d3ea;">
									              <i class="fa fa-tag"></i> ${topic.topicName}
									            </button>
									          </c:forEach>
							              </span>
						              </div>
			    					<div class="grid mb0 fw-wrap ai-start jc-end gs8 gsy" style="clear: both">
			    						<div class="grid--cell mr16" style="flex: 1 1 100px;">
											<div class="post-menu">
											</div>        
			    						</div>
										<div class="post-signature owner grid--cell fl0">
				        					<div class="user-info ">
				    							<div class="user-action-time">
				        							Ngày đăng <span title="2017-04-27 07:54:43Z" class="relativetime">${question.creatAt}</span>
				    							</div>
				    							<div class="user-gravatar32">
											        <a href=""><div class="gravatar-wrapper-32"><img src="/resources/assets/img/${question.user.image}" alt="" width="32" height="32"></div></a>
											    </div>
											    <div class="user-details">
											        <a href="/app/user/${question.user.userId }/info">${question.user.fullname}</a>
											        <div class="-flair">
											        	<c:choose>
											        		<c:when test="${question.user.admin }"><button class="btn btn-danger" style="height: 16px; font-size: 11px; padding: 0px;">Admin</button></c:when>
											        		<c:when test="${question.user.expect }"><button class="btn btn-warning" style="height: 16px; font-size: 11px; padding: 0px;">Chuyên gia</button></c:when>
											        		<c:otherwise><button class="btn btn-success" style="height: 16px; font-size: 11px; padding: 0px;">Member</button></c:otherwise>
											        	</c:choose>
											            <span class="reputation-score" title="reputation score " dir="ltr">${question.user.points}</span>
											            
											        </div>
											    </div>
											</div>
									    </div>
								   </div>
									<div class="action_bar_inner u-flex">
										<span class="question-date"><i class="fa fa-clock-o"></i> ${question.ago}</span>
							              <span class="question-comment">
							                  <i class="fa fa-comment"></i> ${fn:length(question.answers)} câu trả lời
							              </span>
							              <span class="question-view"><i class="fa fa-eye"></i> ${question.views } lượt xem</span>
							              <div class="clearfix"></div>
									</div>
								</div>
			                 <div class="post-layout--right">
				    			<div id="comments-43651814" class="comments js-comments-container "></div>
								<div id="comments-link-43651814" data-rep="50" data-reg="true"></div>         
			    			</div>        
			    		</div>
					</div>
		
		        	<div id="answers">
						<a name="tab-top"></a>
			             <div id="answers-header">
			                 <div class="subheader answers-subheader">
			                     <h2 data-answercount="3" style="line-height: 20px;">
			                        ${fn:length(question.answers)} Câu trả lời
			                        <span style="display:none;" itemprop="answerCount">3</span>
			                     </h2>
			                     <div>
			                         <div id="tabs">
			     						<a href="/oldest" data-nav-xhref="" title="Answers in the order they were provided" data-value="oldest" data-shortcut="O">
							            	Cũ hơn</a>
								        <a class="youarehere" href="/tab-top" data-nav-xhref="" title="Answers with the highest score first" data-value="votes" data-shortcut="V">
								            Nhiều vote</a>
								    </div>
					              </div>
					          </div>
			             </div>
			             <c:forEach items="${question.answers}" var="answer">
			             <a name="43652564"></a>
			            	<div id="answer-43652564" class="answer accepted-answer" data-answerid="43652564" itemscope="" itemtype="http://schema.org/Answer" itemprop="acceptedAnswer">
								<div class="post-layout">
								
									<div class="answercell post-layout--right">
										<div class="post-text" itemprop="text">
											<p>${answer.answerContent}</p>
									    </div>
									    <div class="grid mb0 fw-wrap ai-start jc-end gs8 gsy">
									    	<div class="grid--cell mr16" style="flex: 1 1 100px;">
												<div class="post-menu">
												</div>                    
											</div>
											<div class="post-signature grid--cell fl0">
												<div class="user-info ">
													<div class="user-action-time">
												        Ngày đăng <span title="2017-04-27 08:29:54Z" class="relativetime">${answer.creatAt }</span>
													 </div>
												    <div class="user-gravatar32">
												        <a href=""><div class="gravatar-wrapper-32"><img src="/resources/assets/img/${answer.user.image }" alt="" width="32" height="32"></div></a>
												    </div>
												    <div class="user-details">
												        ${answer.user.fullname }
												        <div class="-flair">
												            <c:choose>
												        		<c:when test="${answer.user.admin }"><button class="btn btn-danger" style="height: 16px; font-size: 11px; padding: 0px;">Admin</button></c:when>
												        		<c:when test="${answer.user.expect }"><button class="btn btn-warning" style="height: 16px; font-size: 11px; padding: 0px;">Chuyên gia</button></c:when>
												        		<c:otherwise><button class="btn btn-success" style="height: 16px; font-size: 11px; padding: 0px;">Member</button></c:otherwise>
												        	</c:choose>
										            		<span class="reputation-score" title="reputation score " dir="ltr">${answer.user.points}</span>
												        </div>
												    </div>
												</div>
										    </div>
										</div>
									</div>
			
									<div class="post-layout--right">
									    <div id="comments-43652564" class="comments js-comments-container ">
								            <ul class="comments-list js-comments-list" data-remaining-comments-count="0" data-canpost="false" data-cansee="true" data-comments-unavailable="false" data-addlink-disabled="true">
								            <c:if test="${not empty answer.comments }">
								            	<c:forEach items="${answer.comments }" var="comment">
								            	<li id="comment-74352620" class="comment js-comment " data-comment-id="74352620">
											        <div class="comment-text js-comment-text-and-form">
											            <div style="display: block;" class="comment-body">
											                <span class="comment-copy">${comment.cmtContent }</span>
											                    –&nbsp;<a href="/app/user/${comment.user.userId }/info" title="68 reputation" class="comment-user owner">${comment.user.fullname }</a>
											                <span class="comment-date" dir="ltr">
												                <a class="comment-link" href="/74352620_43652564">
												                	<span title="2017-04-27 08:33:38Z" class="relativetime-clean">${comment.creatAt }</span>
												                </a></span>
											             </div>
											        </div>
													</li>
											    </c:forEach>
											  </c:if>
						        			</ul>
						 				</div>
						
										<c:if test="${not empty CURRENT_USER}">
					 					<div id="comments-link-43652564" data-rep="50" data-reg="true" style="padding-left: 25px;">
					 						<form:form id="comment-form" action="/expect/question/${question.questionId}/answer/${answer.answerId}/comment/${CURRENT_USER.userId }/add" method="POST" modelAttribute="comment">
					 						<button id="send" type="submit" class="btn btn-success">Comment</button>
								        	<div class="col-md-10 col-sm-3 col-xs-12">
								              <form:input id="title" class="form-control" name="comment" path="cmtContent" placeholder="Comment..."
								              		 required="required" type="text"/>
								            </div>
								            </form:form>
								        </div> 
								        </c:if>        
									</div>    				
								
								</div>
							</div>
						</c:forEach>	
						
						<a name="new-answer"></a>
						<c:choose>
						<c:when test="${not empty CURRENT_USER }">
						<h3 class="space">Câu trả lời của bạn</h3>
			            <form:form id="post-form" action="/expect/question/${question.questionId }/answer/${CURRENT_USER.userId }/add" method="post" modelAttribute="answer">
			            <form:textarea required="required" class="form-control" id="comment-contents" path="answerContent" cols="50" rows="8"></form:textarea>
			                 
			                 <div style="position: relative;">
		                 	<div class="col-md-10 col-sm-3 col-xs-12">
					            <script src="<c:url value="/resources/ckeditor/ckeditor.js" />"></script>
					            <script>
					              CKEDITOR.replace('comment-contents');
					            </script>
					            <c:set var="contentError"><form:errors path="answerContent"/></c:set>
					            <c:if test="${not empty contentError}">
					              <span class="form-description">
					                <i class="icon-exclamation-sign"></i> 
					                <form:errors path="answerContent" cssClass="field-error" />
					              </span>
					            </c:if>
					          </div>
						          
			                 </div>
			                 <div class="form-submit cbt">
			                      <input id="submit-button" class="btn btn-primary" type="submit" value="Đăng câu trả lời" tabindex="110">
			                  </div>
			             </form:form>
			             </c:when>
			             <c:otherwise>
			             <h3 class="space" style="color: #2d2c2c">Bạn phải <a href="/login">đăng nhập</a> để trả lời và bình chọn câu hỏi này</h3>
			             </c:otherwise>
			             </c:choose>
			     	</div>
     	
                    </div>
                  </div>
                  </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
		</div>
	</div>
    <!-- /#wrapper -->
<jsp:include page="admin_footer.jsp"></jsp:include>