<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp"></jsp:include>

<div class="question-container _full ">
<div id="question-content" class="snippet-hidden">

    <div class="inner-content clearfix">
    	<div id="question-header">
           <h1 itemprop="name">Câu hỏi</h1>
		</div>
		<div id="mainbar" role="main" aria-labelledby="h-all-questions">
		<div class="nav-tabs-custom">
	        <ul class="nav nav-tabs">
	          <li><a href="#allquestions" data-toggle="tab">Tất cả</a></li>
	          <li><a href="#newquestions" data-toggle="tab">Mới nhất</a></li>
	          <li class="active"><a href="#hotquestions" data-toggle="tab">Nổi bật</a></li>
	          <li><a href="#noanswers" data-toggle="tab">Chưa trả lời</a></li>
	        </ul>
	        
			<div class="tab-content">
				<div class="active tab-pane" id="hotquestions">
				<c:forEach items="${hotQuestions}" var="question">
				<div class="question-summary tagged-interesting"
					id="question-summary-218384">
					<div class="statscontainer">
						<div class="statsarrow"></div>
						<div class="stats">
							<div class="vote">
								<div class="votes">
									<span class="vote-count-post "><strong>${question.upvotes}</strong></span>
									<div class="viewcount">Upvote</div>
								</div>
							</div>
							<div class="status answered-accepted">
								<strong>${fn:length(question.answers)}</strong>Trả lời
							</div>
						</div>
						<div class="views supernova" title="7 views">${question.views }
							view</div>
					</div>
					<div class="summary">
						<h3 style="margin-top: 0px">
							<a href="/app/question/${question.questionId }/detail"
								class="question-hyperlink"><b>${question.title }</b></a>
						</h3>
						<div class="excerpt">${question.summary }</div>
						<div id="tag-lst" style="width: 400px; float: left">
				              <span class="question-category">
				              	<c:forEach var="topic" items="${question.topics}">
						            <button type="button" class="btn btn-default btn-xs" style="background-color: #b4d3ea; border-color: #b4d3ea;">
						              <a href="/app/topic/${topic.topicId }/detail"><i class="fa fa-tag"></i> ${topic.topicName}</a>
						            </button>
						          </c:forEach>
				              </span>
			              </div>
						<div class="started fr">
							<div class="user-info user-hover">
								<div class="user-action-time">
									Ngày đăng <span title="2013-01-08 17:06:14Z" class="relativetime">${question.creatAt }</span>
								</div>
								<div class="user-gravatar32">
									<a href="/app/user/${question.user.userId }/info">
									<div class="gravatar-wrapper-32">
											<img src="/resources/assets/img/${question.user.image }"
												alt="" width="32" height="32">
										</div></a>
								</div>
								<div class="user-details">
									<a href="/app/user/${question.user.userId }/info">${question.user.fullname }</a>
									<div class="-flair">
										<span class="reputation-score"
											title="reputation score 493,596" dir="ltr">${question.user.points }</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				</div>
		        <div class="active tab-pane" id="allquestions">
				<c:forEach items="${allQuestions}" var="question">
				<div class="question-summary tagged-interesting"
					id="question-summary-218384">
					<div class="statscontainer">
						<div class="statsarrow"></div>
						<div class="stats">
							<div class="vote">
								<div class="votes">
									<span class="vote-count-post "><strong>${question.upvotes}</strong></span>
									<div class="viewcount">Upvote</div>
								</div>
							</div>
							<div class="status answered-accepted">
								<strong>${fn:length(question.answers)}</strong>Trả lời
							</div>
						</div>
						<div class="views supernova" title="7 views">${question.views }
							view</div>
					</div>
					<div class="summary">
						<h3 style="margin-top: 0px">
							<a href="/app/question/${question.questionId }/detail"
								class="question-hyperlink"><b>${question.title }</b></a>
						</h3>
						<div class="excerpt">${question.summary }</div>
						<div id="tag-lst" style="width: 400px; float: left">
				              <span class="question-category">
				              	<c:forEach var="topic" items="${question.topics}">
						            <button type="button" class="btn btn-default btn-xs" style="background-color: #b4d3ea; border-color: #b4d3ea;">
						              <a href="/app/topic/${topic.topicId }/detail"><i class="fa fa-tag"></i> ${topic.topicName}</a>
						            </button>
						          </c:forEach>
				              </span>
			              </div>
						<div class="started fr">
							<div class="user-info user-hover">
								<div class="user-action-time">
									Ngày đăng <span title="2013-01-08 17:06:14Z" class="relativetime">${question.creatAt }</span>
								</div>
								<div class="user-gravatar32">
									<a href="/app/user/${question.user.userId }/info">
									<div class="gravatar-wrapper-32">
											<img src="/resources/assets/img/${question.user.image }"
												alt="" width="32" height="32">
										</div></a>
								</div>
								<div class="user-details">
									<a href="/app/user/${question.user.userId }/info">${question.user.fullname }</a>
									<div class="-flair">
										<span class="reputation-score"
											title="reputation score 493,596" dir="ltr">${question.user.points }</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>

				</div>
				<div class="active tab-pane" id="newquestions">
				<c:forEach items="${newQuestions}" var="question">
				<div class="question-summary tagged-interesting"
					id="question-summary-218384">
					<div class="statscontainer">
						<div class="statsarrow"></div>
						<div class="stats">
							<div class="vote">
								<div class="votes">
									<span class="vote-count-post "><strong>${question.upvotes}</strong></span>
									<div class="viewcount">Upvote</div>
								</div>
							</div>
							<div class="status answered-accepted">
								<strong>${fn:length(question.answers)}</strong>Trả lời
							</div>
						</div>
						<div class="views supernova" title="7 views">${question.views }
							view</div>
					</div>
					<div class="summary">
						<h3 style="margin-top: 0px">
							<a href="/app/question/${question.questionId }/detail"
								class="question-hyperlink"><b>${question.title }</b></a>
						</h3>
						<div class="excerpt">${question.summary }</div>
						<div id="tag-lst" style="width: 400px; float: left">
				              <span class="question-category">
				              	<c:forEach var="topic" items="${question.topics}">
						            <button type="button" class="btn btn-default btn-xs" style="background-color: #b4d3ea; border-color: #b4d3ea;">
						              <a href="/app/topic/${topic.topicId }/detail"><i class="fa fa-tag"></i> ${topic.topicName}</a>
						            </button>
						          </c:forEach>
				              </span>
			              </div>
						<div class="started fr">
							<div class="user-info user-hover">
								<div class="user-action-time">
									Ngày đăng <span title="2013-01-08 17:06:14Z" class="relativetime">${question.creatAt }</span>
								</div>
								<div class="user-gravatar32">
									<a href="/app/user/${question.user.userId }/info">
									<div class="gravatar-wrapper-32">
											<img src="/resources/assets/img/${question.user.image }"
												alt="" width="32" height="32">
										</div></a>
								</div>
								<div class="user-details">
									<a href="/app/user/${question.user.userId }/info">${question.user.fullname }</a>
									<div class="-flair">
										<span class="reputation-score"
											title="reputation score 493,596" dir="ltr">${question.user.points }</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				</div>
				<div class="active tab-pane" id="noanswers">
				<c:forEach items="${noanswers}" var="question">
				<div class="question-summary tagged-interesting"
					id="question-summary-218384">
					<div class="statscontainer">
						<div class="statsarrow"></div>
						<div class="stats">
							<div class="vote">
								<div class="votes">
									<span class="vote-count-post "><strong>${question.upvotes}</strong></span>
									<div class="viewcount">Upvote</div>
								</div>
							</div>
							<div class="status answered-accepted">
								<strong>${fn:length(question.answers)}</strong>Trả lời
							</div>
						</div>
						<div class="views supernova" title="7 views">${question.views }
							view</div>
					</div>
					<div class="summary">
						<h3 style="margin-top: 0px">
							<a href="/app/question/${question.questionId }/detail"
								class="question-hyperlink"><b>${question.title }</b></a>
						</h3>
						<div class="excerpt">${question.summary }</div>
						<div id="tag-lst" style="width: 400px; float: left">
				              <span class="question-category">
				              	<c:forEach var="topic" items="${question.topics}">
						            <button type="button" class="btn btn-default btn-xs" style="background-color: #b4d3ea; border-color: #b4d3ea;">
						              <a href="/app/topic/${topic.topicId }/detail"><i class="fa fa-tag"></i> ${topic.topicName}</a>
						            </button>
						          </c:forEach>
				              </span>
			              </div>
						<div class="started fr">
							<div class="user-info user-hover">
								<div class="user-action-time">
									Ngày đăng <span title="2013-01-08 17:06:14Z" class="relativetime">${question.creatAt }</span>
								</div>
								<div class="user-gravatar32">
									<a href="/app/user/${question.user.userId }/info">
									<div class="gravatar-wrapper-32">
											<img src="/resources/assets/img/${question.user.image }"
												alt="" width="32" height="32">
										</div></a>
								</div>
								<div class="user-details">
									<a href="/app/user/${question.user.userId }/info">${question.user.fullname }</a>
									<div class="-flair">
										<span class="reputation-score"
											title="reputation score 493,596" dir="ltr">${question.user.points }</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>

			</div>
			</div>			
		</div>
		</div>
		
		<!-- right content -->
       	<div id="sidebar" class="show-votes" role="complementary" aria-label="sidebar">  
       		<div class="module community-bulletin" data-tracker="cb=1">
			<div class="widget widget_tag_cloud">
			  <h3 class="widget_title">Chủ đề nổi bật</h3>
			   <c:forEach var="topic" items="${topics}">
			    <a href="<c:url value="/app/topic/${topic.topicId }/detail" />">${topic.topicName } (${fn:length(topic.posts) + fn:length(topic.questions)})</a>
			  </c:forEach>
			</div>
         	</div>                        
			<div class="module community-bulletin" data-tracker="cb=1">
			<div class="widget widget_highest_points">
				<div class="sidebar-related">
                    <h3 class="widget_title">Chuyên gia hàng đầu</h3>
					  <ul>
					    <c:forEach var="user" items="${users }">
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
<jsp:include page="footer.jsp"></jsp:include>