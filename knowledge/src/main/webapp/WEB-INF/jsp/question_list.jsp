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
	          <li class="active"><a href="#newquestions" data-toggle="tab">Mới nhất</a></li>
	          <li><a href="#hotquestions" data-toggle="tab">Nổi bật</a></li>
	          <li><a href="#noanswer" data-toggle="tab">Chưa trả lời</a></li>
	        </ul>
			<div class="tab-content">
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
											title="reputation score 493,596" dir="ltr">494</span><!-- <span
											title="112 gold badges"><span class="badge1"></span><span
											class="badgecount">112</span></span><span title="788 silver badges"><span
											class="badge2"></span><span class="badgecount">788</span></span><span
											title="833 bronze badges"><span class="badge3"></span><span
											class="badgecount">833</span></span>  -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>

				<br class="cbt">
				<div class="page-sizer fr">
					<a
						href="/questions?pagesize=15&amp;sort=frequent"
						title="show 15 items per page" class="page-numbers current">15</a>
					<a
						href="/questions?pagesize=30&amp;sort=frequent"
						title="show 30 items per page" class="page-numbers ">30</a> <a
						href="/questions?pagesize=50&amp;sort=frequent"
						title="show 50 items per page" class="page-numbers ">50</a> <span
						class="page-numbers desc">per page</span>
				</div>
				<div class="pager fl">
					<span class="page-numbers current">1</span> <a
						href="/questions?page=2&amp;sort=frequent"
						title="go to page 2"> <span class="page-numbers">2</span>
					</a> <a
						href="/questions?page=3&amp;sort=frequent"
						title="go to page 3"> <span class="page-numbers">3</span>
					</a> <a
						href="/questions?page=4&amp;sort=frequent"
						title="go to page 4"> <span class="page-numbers">4</span>
					</a> <a
						href="/questions?page=5&amp;sort=frequent"
						title="go to page 5"> <span class="page-numbers">5</span>
					</a> <span class="page-numbers dots">…</span> <a
						href="/questions?page=98946&amp;sort=frequent"
						title="go to page 98946"> <span class="page-numbers">100</span>
					</a> <a
						href="/questions?page=2&amp;sort=frequent"
						rel="next" title="go to page 2"> <span
						class="page-numbers next"> next</span>
					</a>

				</div>
			</div>
			</div>
		</div>
		</div>
		
		<!-- right content -->
       	<div id="sidebar" class="show-votes" role="complementary" aria-label="sidebar">  
       		<div class="module community-bulletin" data-tracker="cb=1">
			<div class="widget widget_tag_cloud">
			  <h3 class="widget_title">Chủ đề</h3>
			  <%-- <c:forEach var="tag" items=""> --%>
			    <a href="">Tên chủ đề</a>
			    <a href="">Java</a>
			    <a href="">Question</a>
			    <a href="">Test</a>
			    <a href="">Cuộc đua số</a>
			  <%-- </c:forEach> --%>
			</div>
         	</div>                        
			<div class="module community-bulletin" data-tracker="cb=1">
			<div class="widget widget_highest_points">
				<div class="sidebar-related">
                    <h3 class="widget_title">Top Point</h3>
					  <ul>
					    <%-- <c:forEach var="topUser" items=""> --%>
					    <li>
					      <div class="author-img">
					        <a href="<c:url value="/user/" />">
					          <%-- <img width="60" height="60" src="<c:url value="/upload/" />" alt=""> --%>
					        </a>
					      </div> 
					      <h6><a href="">User name</a></h6>
					      <span class="comment"> point</span>
					    </li>
					    <%-- </c:forEach> --%>
					  </ul>
				</div>
			</div>
         </div>
         
    </div>
	</div>
	</div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>