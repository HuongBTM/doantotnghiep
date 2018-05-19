<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp"></jsp:include>

<!-- Content wrapper -->
<div class="question-container _full ">
<div id="question-content" class="snippet-hidden">

    <div class="inner-content clearfix">
        <div id="question-header">
           <h1 itemprop="name"><b>${question.title}</b></h1>
           <c:if test="${question.check==0 }"><button class="btn btn-default" style="height: 35px">Câu hỏi chờ phê duyệt</button></c:if>
           <c:if test="${question.check==2 }"><button class="btn btn-danger" style="height: 35px">Câu hỏi bị xóa vì vi phạm chính sách hệ thống</button></c:if>
           <c:if test="${question.check==1 }"><button class="btn btn-success" style="height: 35px">Đang thảo luận</button></c:if>
		</div>
        <div id="mainbar" role="main" aria-label="question and answers">
            <div class="question-detail" data-questionid="43651814" id="question">
				<div class="post-layout">
            		<div class="postcell post-layout--right">
    					<div class="post-text" itemprop="text">
							<p>${question.questionContent}</p>
    					</div>
    					<c:if test="${not empty question.post}">
	        				<div class="post-text">
								<em>Linh bài viết:<a href="/app/post/${question.post.postId }/detail"> ${question.post.postTitle}</a></em>
	    					</div>
    					</c:if>
    					<div id="tag-lst" style="width: 400px; float: left">
				              <span class="question-category">
				              	<c:forEach var="topic" items="${question.topics}">
						            <button type="button" class="btn btn-default btn-xs" style="background-color: #b4d3ea; border-color: #b4d3ea;">
						              <a href="/app/topic/${topic.topicId }/detail"><i class="fa fa-tag"></i> ${topic.topicName}</a>
						            </button>
						          </c:forEach>
				              </span>
			              </div>
    					<div class="grid mb0 fw-wrap ai-start jc-end gs8 gsy" style="clear: both">
    						<div class="grid--cell mr16" style="flex: 1 1 100px;">
								<div class="post-menu">
									<c:if test="${CURRENT_USER.userId eq question.user.userId }"><a href="/app/question/${question.questionId}/edit" class="suggest-edit-post" title="revise and improve this post">Chỉnh sửa</a></c:if>
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
						<c:choose>
						<c:when test="${voteDetail.voteTypeId == 1}">
							<span id="rgptQp" style="margin-right: 10px">
								<a class="icon_action_bar-button blue_icon btn btn btn-default" style="background-color: #1bc364"
									href="#?qid=${question.questionId}&oid=${question.user.userId}&uid=${CURRENT_USER.userId}&action=upvote" id="upQuestionBtn">
									<div class="icon_action_bar-label">
										<span class="glyphicon glyphicon-arrow-up">Upvote |</span>
										<span id="up_question_count" class="icon_action_bar-count">${question.upvotes }</span>
									</div>
								</a>
							</span>
							<span id="rgptQp" style="margin-right: 10px">
								<a class="secondary_action icon_action_bar-button btn btn btn-default" disabled="disabled"
									href="#?qid=${question.questionId}&oid=${question.user.userId}&uid=${CURRENT_USER.userId}&action=downvote" id="downQuestionBtn">
									<div class="icon_action_bar-label">
										<span class="glyphicon glyphicon-arrow-down">Downvote |</span>
										<span id="down_question_count" class="icon_action_bar-count">${question.downvotes }</span>
									</div>
								</a>
							</span>
						</c:when>
						<c:when test="">
							<span id="rgptQp" style="margin-right: 10px">
								<a class="icon_action_bar-button blue_icon btn btn btn-default" disabled="disabled"
									href="#?qid=${question.questionId}&oid=${question.user.userId}&uid=${CURRENT_USER.userId}&action=upvote" id="upQuestionBtn">
									<div class="icon_action_bar-label">
										<span class="glyphicon glyphicon-arrow-up">Upvote |</span>
										<span id="up_question_count" class="icon_action_bar-count">${question.upvotes }</span>
									</div>
								</a>
							</span>
							<span id="rgptQp" style="margin-right: 10px">
								<a class="secondary_action icon_action_bar-button btn btn btn-default" style="background-color: #1bc364"
									href="#?qid=${question.questionId}&oid=${question.user.userId}&uid=${CURRENT_USER.userId}&action=downvote" id="downQuestionBtn">
									<div class="icon_action_bar-label">
										<span class="glyphicon glyphicon-arrow-down">Downvote |</span>
										<span id="down_question_count" class="icon_action_bar-count">${question.downvotes }</span>
									</div>
								</a>
							</span>
						</c:when>
						<c:otherwise>
							<span id="rgptQp" style="margin-right: 10px">
								<a class="icon_action_bar-button blue_icon btn btn btn-default"
									href="#?qid=${question.questionId}&oid=${question.user.userId}&uid=${CURRENT_USER.userId}&action=upvote" id="upQuestionBtn">
									<div class="icon_action_bar-label">
										<span class="glyphicon glyphicon-arrow-up">Upvote |</span>
										<span id="up_question_count" class="icon_action_bar-count">${question.upvotes }</span>
									</div>
								</a>
							</span>
							<span id="rgptQp" style="margin-right: 10px">
								<a class="secondary_action icon_action_bar-button btn btn btn-default"
									href="#?qid=${question.questionId}&oid=${question.user.userId}&uid=${CURRENT_USER.userId}&action=downvote" id="downQuestionBtn">
									<div class="icon_action_bar-label">
										<span class="glyphicon glyphicon-arrow-down">Downvote |</span>
										<span id="down_question_count" class="icon_action_bar-count">${question.downvotes }</span>
									</div>
								</a>
							</span>
						</c:otherwise>
						</c:choose>
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
		
		<c:if test="${CURRENT_USER.userId eq question.user.userId }">
		<div class="request-expect" data-questionid="43651814" id="question">
		<h3 style="margin-top: 0px;">Lựa chọn chuyên gia trả lời câu hỏi của bạn?</h3>
			<div class="grid-layout" style="grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));">
				<c:forEach var="expect" items="${expects}">
				<div class="grid-layout--cell user-info ">
				<button id="expect-${expect.userId }" class="btn btn-default request-user" onclick="sendRequest(${CURRENT_USER.userId }, ${expect.userId}, ${question.questionId})">
					<div class="user-gravatar48">
						<div class="gravatar-wrapper-48"><img alt="" src="/resources/assets/img/${expect.image}"></div>
					</div>
					<div class="user-details" style="width: calc(100% - 64px);">
						<a href="/app/user/${expect.userId}/info">${expect.fullname}</a>
						<span class="user-location">${expect.address }</span>
						<div class="-flair">
							<span class="reputation-score">${expect.points }</span>
						</div>
					</div>
					<div class="user-tags">
					<c:forEach items="${expect.sectors}" var="sector">
						<c:out value="${sector.sectorName},"></c:out>
					</c:forEach>
					</div>
				</button>
				</div>
				</c:forEach>
			</div>
		</div>
		</c:if>
		
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
						
	        				<div class="votecell post-layout--left">
	            				<div class="vote">
							        <input type="hidden" name="_id_" value="43652564">
									<div><a id="upAnswerBtn-${answer.answerId}" class="upvote btn btn-default" href="#?aid=${answer.answerId}&oid=${answer.user.userId}&uid=${CURRENT_USER.userId}&action=upvote" 
											style="width: 45px; height: 45px; padding: 0px;" title="Upvote câu trả lời hữu ích"><div>
										<i class="glyphicon glyphicon-triangle-top" style="font-size: 25px; color: #7b7676"></i></div>
										<span id="up_answer_count_${answer.answerId}"><strong> ${answer.upvotes }</strong></span></a></div>
									<div style="clear: both; padding-top: 10px">
										<a id="downAnswerBtn-${answer.answerId}" class="downvote btn btn-default" href="#?aid=${answer.answerId}&oid=${answer.user.userId}&uid=${CURRENT_USER.userId}&action=downvote" 
											style="width: 45px; height: 45px; padding: 0px;" title="Downvote câu trả lời không hợp lý">
										<span id="down_answer_count_${answer.answerId}"><strong> ${answer.downvotes }</strong></span>
										<i class="glyphicon glyphicon-triangle-bottom" style="font-size: 25px; color: #7b7676"></i></a></div>								
								</div>
							</div>
							<div class="answercell post-layout--right">
								<div class="post-text" itemprop="text">
									<p>${answer.answerContent}</p>
							    </div>
							    <div class="grid mb0 fw-wrap ai-start jc-end gs8 gsy">
							    	<div class="grid--cell mr16" style="flex: 1 1 100px;">
										<div class="post-menu">
											<c:if test="${CURRENT_USER.userId eq answer.user.userId }"><a href="/edit" class="suggest-edit-post" title="revise and improve this post">Chỉnh sửa</a></c:if>
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
										        <a href="/app/user/${answer.user.userId }/info">${answer.user.fullname }</a>
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
									        <div class="js-comment-actions comment-actions">
									            <div class="comment-score"></div>
				                			</div>
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
			 						<form:form id="comment-form" action="/app/question/${question.questionId}/answer/${answer.answerId}/comment/${CURRENT_USER.userId }/add" method="POST" modelAttribute="comment">
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
				<c:when test="${not empty CURRENT_USER and question.check==1}">
				<h3 class="space">Câu trả lời của bạn</h3>
	            <form:form id="post-form" action="/app/question/${question.questionId }/answer/${CURRENT_USER.userId }/add" method="post" modelAttribute="answer">
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
	             <c:when test="${not empty CURRENT_USER and question.check==0}">
	             	<h3 class="space" style="color: #2d2c2c">Câu hỏi đang chờ phê duyệt, chưa thể tham gia thảo luận</h3>
	             </c:when>
	             <c:when test="${not empty CURRENT_USER and question.check==2}">
	             	<h3 class="space" style="color: #2d2c2c">Câu hỏi đã bị xóa, không thể tham gia thảo luận</h3>
	             </c:when>
	             <c:otherwise>
	             <h3 class="space" style="color: #2d2c2c">Bạn phải <a href="/login">đăng nhập</a> để trả lời và bình chọn câu hỏi này</h3>
	             </c:otherwise>
	             </c:choose>
	     	</div>
     	</div>
     	
       	<div id="sidebar" class="show-votes" role="complementary" aria-label="sidebar">                          
         	<div class="module community-bulletin widget" data-tracker="cb=1">
				<div class="sidebar-related">
                    <img class="profile-user-img img-responsive img-circle" 
               			src="<c:url value="/resources/assets/img/${question.user.image}" />" alt="User profile picture">
                    <h3 class="profile-username text-center">${question.user.fullname}</h3>
			          <h5 class="profile-username text-center">${question.user.address}</h5>
						<h5 class="profile-username text-center">
						<c:choose>
			                <c:when test="${question.user.admin}">
			                  <span class="label bg-red" style="color: red">Quản trị viên</span>
			                </c:when>
			                <c:when test="${question.user.expect}">
			                  <span class="label bg-yellow" style="color: green">Chuyên gia</span>
			                </c:when>
			                <c:otherwise>
			                  <span class="label bg-green" style="color: blue">Thành viên</span>
			                </c:otherwise>
			              </c:choose>
						</h5>
						<div style="background-color: #6bc7e8; text-align: center">Điểm uy tín: ${question.user.points}</div>
			
			          <ul class="list-group list-group-unbordered" style="margin-bottom: 0px; padding-top: 5px;">
			          	<c:if test="${question.user.expect }"><li class="list-group-item">
							<i class="fa fa-graduation-cap">
							<b><c:forEach items="${question.user.sectors}" var="sector">
								<c:out value="${sector.sectorName},"></c:out>
							</c:forEach></b></i>
						</li></c:if>
			             <li class="list-group-item">
			              <b>Câu hỏi</b> 
			              <span class="pull-right badge bg-blue">${fn:length(question.user.questions)}</span>
			            </li>
			            <li class="list-group-item">
			              <b>Câu trả lời</b>
			              <span class="pull-right badge bg-yellow">${fn:length(question.user.answers)}</span>
			            </li>
			            <li class="list-group-item">
			              <b>Bài viết</b> 
			              <span class="pull-right badge bg-green">${fn:length(question.user.posts)}</span>
			            </li>
			           <c:if test="${not empty question.user.abouts }"><li class="list-group-item">
			              ${question.user.abouts }
			            </li></c:if>
			          </ul>
                </div>
	            <!-- thông tin -->
			</div>
			<div class="module community-bulletin" data-tracker="cb=1">
			<div class="widget widget_tag_cloud">
			  <h3 class="widget_title">Chủ đề nổi bật</h3>
			  <c:forEach var="topic" items="${topics}">
			    	<a href="<c:url value="/app/topic/${topic.topicId }/detail" />">${topic.topicName } (${fn:length(topic.questions) + fn:length(topic.posts)})</a>
			  </c:forEach>
			</div>
         	</div>
			<div class="module community-bulletin" data-tracker="cb=1">
			<div class="widget widget_highest_points">
				<div class="sidebar-related">
                    <h3 class="widget_title">Chuyên gia hàng đầu</h3>
					  <ul>
					    <c:forEach var="user" items="${users}">
					    <li>
					      <div class="author-img">
					        <a href="<c:url value="/app/user/${user.userId}/info" />">
					          <img width="60" height="60" src="<c:url value="/resources/assets/img/${user.image }" />" alt="">
					        </a>
					      </div> 
					      <h6><a href="<c:url value="/app/user/${user.userId}/info" />">${user.username }</a></h6>
					      <span class="comment"> ${user.points }</span>
					      <div style="font-size: 13px; margin-left: 80px;">
					      <c:forEach items="${user.sectors}" var="sector">
								<c:out value="${sector.sectorName},"></c:out>
							</c:forEach>
							</div>
					    </li>
					    </c:forEach>
					  </ul>
				</div>
			</div>
         </div>
         
    </div>
</div>
</div>
</div>
<!-- Modal -->
<div class="modal fade" id="modalUpdateQuestion" topic="dialog">
    <div class="modal-dialog">
      <!-- Modal content no 1-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Chỉnh sửa câu hỏi</h4>
        </div>
        <!-- ./modal-header -->
        <div class="modal-body">
         <form:form id="updateTopicForm" action="/admin/topic/savetopic" method="post" modelAttribute="topic" class="form-horizontal">
	          <div class="login-box-body">
			    <input type="hidden" id="idHidden" name="idHidden" value="${question.questionId}">
			    <div class="item form-group">
                       <label class="control-label col-xs-3" for="topicName">Tên chủ đề<span class="required">*</span>
                       </label>
                       <div class="col-xs-9">
                         <form:input id="topicName" class="form-control col-md-7 col-xs-12" name="topicName" placeholder="Tên chủ đề..." required="required" type="text" path="topicName"></form:input>
                       	<div class="error" hidden="hidden"></div>
                      </div>
                 </div>
                 <div class="item form-group">
                      <label class="control-label col-xs-3" for="topicDescribe">Mô tả chủ đề
                      </label>
                      <div class="col-xs-9">
                        <form:textarea id="topicDescribe" name="topicDescribe" rows="5" cols="30" placeholder="Mô tả chủ đề..." class="form-control col-md-7 col-xs-12" path="topicDescribe"></form:textarea>
                      </div>
                  </div>
	        </div>
	        <!-- /.modal-body -->
	        <div class="modal-footer">
	 			<button type="submit" class="btn btn-danger" id="btnSave">Lưu</button>
	 			<button type="button" class="btn btn-basic" data-dismiss="modal">Hủy</button>
	 		</div>
 		</form:form>
 		<!-- /.modal-footer -->
      </div>
      <!-- ./modal-content -->
      
    </div>
 	</div>
 	</div>
<script type="text/javascript">
$(document).ready(function () {

	$("#upQuestionBtn").click(function (e) {
		var upvote = parseInt($("#up_question_count").text());
		var href = $(this).attr('href');
    	var qid = getURLParameter(href, 'qid');
    	var oid = getURLParameter(href, 'oid');
    	var uid = getURLParameter(href, 'uid');
    	var action = getURLParameter(href, 'action');
		var url = "<c:url value="/app/question/vote" />";
		$.ajax({
			type: "GET",
      		contentType: "application/json",
      		url: url,
      		data: {qid: qid, oid: oid, uid: uid, action: action},
      		success: function (response) {
      			if(response=="success") {
	      			document.getElementById('upQuestionBtn').style.backgroundColor='#1bc364';
	      			document.getElementById('downQuestionBtn').setAttribute('disabled','disabled');
	      			$("#up_question_count").text(upvote+1);
      			} else {
	      			document.getElementById('upQuestionBtn').style.backgroundColor='#fff';
	      			document.getElementById('downQuestionBtn').removeAttribute("disabled");
	      			$("#up_question_count").text(upvote-1);
      			}
      		}
		})
	});
	
	$("#downQuestionBtn").click(function (e) {
		var downvote = parseInt($("#down_question_count").text());
		var href = $(this).attr('href');
    	var qid = getURLParameter(href, 'qid');
    	var oid = getURLParameter(href, 'oid');
    	var uid = getURLParameter(href, 'uid');
    	var action = getURLParameter(href, 'action');
		var url = "<c:url value="/app/question/vote" />";
		$.ajax({
			type: "GET",
      		contentType: "application/json",
      		url: url,
      		data: {qid: qid, oid: oid, uid: uid, action: action},
      		success: function (response) {
      			if(response=="success") {
	      			document.getElementById('downQuestionBtn').style.backgroundColor='#1bc364';
	      			document.getElementById('upQuestionBtn').setAttribute('disabled','disabled');
	      			$("#down_question_count").text(downvote+1);
      			} else {
      				document.getElementById('downQuestionBtn').style.backgroundColor='#fff';
	      			document.getElementById('upQuestionBtn').removeAttribute("disabled");
	      			$("#down_question_count").text(downvote-1);
      			}
      		}
		})
	});
	
	$("a.upvote").click(function (e) {
		var href = $(this).attr('href');
    	var aid = getURLParameter(href, 'aid');
    	var oid = getURLParameter(href, 'oid');
    	var uid = getURLParameter(href, 'uid');
    	var action = getURLParameter(href, 'action');
		var url = "<c:url value="/app/answer/vote" />";
		var upvote = parseInt($("#up_answer_count_"+aid).text());
		$.ajax({
			type: "GET",
      		contentType: "application/json",
      		url: url,
      		data: {aid: aid, oid: oid, uid: uid, action: action},
      		success: function (response) {
      			if(response=="success") {
	      			document.getElementById("upAnswerBtn-"+aid).style.backgroundColor='#1bc364';
	      			document.getElementById("downAnswerBtn-"+aid).setAttribute('disabled','disabled');
	      			$("#up_answer_count_"+aid).text(upvote+1);
      			} else {
	      			document.getElementById("upAnswerBtn-"+aid).style.backgroundColor='#fff';
	      			document.getElementById("downAnswerBtn-"+aid).removeAttribute("disabled");
	      			$("#up_answer_count_"+aid).text(upvote-1);
      			}
      		}
		})
	});
	$("a.downvote").click(function (e) {
		
		var href = $(this).attr('href');
    	var aid = getURLParameter(href, 'aid');
    	var oid = getURLParameter(href, 'oid');
    	var uid = getURLParameter(href, 'uid');
    	var action = getURLParameter(href, 'action');
		var url = "<c:url value="/app/answer/vote" />";
		var downvote = parseInt($("#down_answer_count_"+aid).text());
		$.ajax({
			type: "GET",
      		contentType: "application/json",
      		url: url,
      		data: {aid: aid, oid: oid, uid: uid, action: action},
      		success: function (response) {
      			if(response=="success") {
	      			document.getElementById("downAnswerBtn-"+aid).style.backgroundColor='#1bc364';
	      			document.getElementById("upAnswerBtn-"+aid).setAttribute('disabled','disabled');
	      			$("#down_answer_count_"+aid).text(downvote+1);
      			} else {
      				document.getElementById("downAnswerBtn-"+aid).style.backgroundColor='#fff';
	      			document.getElementById("upAnswerBtn-"+aid).removeAttribute("disabled");
	      			$("#down_answer_count_"+aid).text(downvote-1);
      			}
      		}
		})
	});
	function getURLParameter(url, name) {
    	return (RegExp(name + '=' + '(.+?)(&|$)').exec(url)||[,null])[1];
  	}
	
});
function sendRequest(oid, uid, qid) {
 	alert(oid+uid+qid);
 	alert(uid);
 	var url = "<c:url value="/app/question/request" />";
 	$.ajax({
 		type: "GET",
  		contentType: "application/json",
  		url: url,
  		data: {oid: oid, uid: uid, qid:qid},
  		success: function (response) {
  			document.getElementById("expect-"+uid).setAttribute('disabled','disabled');
  		}
 	})
}
</script>
<jsp:include page="footer.jsp"></jsp:include>