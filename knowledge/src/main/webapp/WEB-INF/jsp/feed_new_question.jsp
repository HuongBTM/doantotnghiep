<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp"></jsp:include>

<!-- Content wrapper -->
<div class="container">
	<c:if test="${not empty success}">
	    <div class="alert alert-success alert-dismissible">
	      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
	      <i class="icon fa fa-check"></i> ${success}
	    </div>
	  </c:if>
	<div class="FeedMain HomeMain">
		<div class="grid_page">
			<div class="layout_3col_left" id="home_feed_left_col">
				<div class="row section" style='position: fixed'>
					<div class="EditableList HomeNavList NavList" id="feed_edit">
						<a href="#" class="nav-tabs-dropdown btn btn-block btn-default">Feed</a>
						<a href="#" class="nav-tabs-dropdown btn btn-block btn-success">Câu hỏi mới</a>
						<a href="#" class="nav-tabs-dropdown btn btn-block btn-default">Bài viết mới</a>
					</div>
				</div>
			</div>
			<div class="layout_3col_center" id="home_feed_center_col">
			<!-- <div class="question-desc">Post</div> -->
				  <div id="new-questions">
			        <c:forEach var="question" items="${questions}">
			          <article class="question question-type-normal">
			            <h2>
			              <a href="<c:url value="/question/detail/${question.questionId}" />">${question.title}</a>
			            </h2>
			            <div class="question-author">
			              <a href="<c:url value="/user/${question.user.userId}" />" title="${question.user.fullname}" class="question-author-img tooltip-n">
			                <span></span><img alt="" src="<c:url value="/resources/assets/img/${question.user.image}" />">
			              </a>
			            </div>
			            <div class="question-inner">
			              <div class="clearfix"></div>
			              <div class="question-desc">${question.questionContent}
			              </div>
			              <div id="tag-lst" style="width: 400px; float: left">
				              <span class="question-category">
				              	<c:forEach var="topic" items="${question.topics}">
						            <button type="button" class="btn btn-default btn-xs" style="background-color: #ccc">
						              <i class="fa fa-tag"></i> ${topic.topicName}
						            </button>
						          </c:forEach>
				              </span>
			              </div>
			              <div id="noti" style="clear: both; padding-top: 10px;">
			              	 <span class="question-upvote"><i class="glyphicon glyphicon-arrow-up"></i> 3 upvote</span>
			              	 <span class="question-downvote"><i class="glyphicon glyphicon-arrow-down"></i> 3 downvote</span>
				              <span class="question-date"><i class="fa fa-clock-o"></i> ${question.ago}</span>
				              <span class="question-comment">
				                <a href="<c:url value="/question/detail/${question.questionId}" />">
				                  <i class="fa fa-comment"></i> ${fn:length(question.answers)} answers
				                </a>
				              </span>
				              <span class="question-view"><i class="fa fa-eye"></i> ${question.views} views</span>
				              <div class="clearfix"></div>
			              </div>
			            </div>
			          </article>
			        </c:forEach>
			      </div>
				  
			</div>
			<div class="layout_3col_right home_feed_right_col" id="home_feed_right_col">
			      <p>ADS</p>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>