<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp"></jsp:include>

<!-- Content wrapper -->
<div class="container" style="width: 1175px;">
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
						<a href="/app/home/feed" class="nav-tabs-dropdown btn btn-block btn-default">Feed</a>
						<a href="/app/home/question" class="nav-tabs-dropdown btn btn-block btn-success">Câu hỏi mới</a>
						<a href="/app/home/post" class="nav-tabs-dropdown btn btn-block btn-default">Bài viết mới</a>
					</div>
				</div>
			</div>
			<div class="layout_3col_center" id="home_feed_center_col">
			<!-- <div class="question-desc">Post</div> -->
				  <div id="new-questions">
			        <c:forEach var="question" items="${questions}">
			          <article class="question question-type-normal">
			            <h2>
			              <a href="<c:url value="/app/question/${question.questionId}/detail" />">${question.title}</a>
			            </h2>
			            <div class="question-author">
			              <a href="<c:url value="/app/user/${question.user.userId}/info" />" title="${question.user.fullname}" class="question-author-img tooltip-n">
			                <span></span><img alt="" src="<c:url value="/resources/assets/img/${question.user.image}" />">
			              </a>
			            </div>
			            <div class="question-inner">
			              <div class="clearfix"></div>
			              <div class="question-desc">${question.summary}
			              </div>
			              <div id="tag-lst" style="width: 400px; float: left">
				              <span class="question-category">
				              	<c:forEach var="topic" items="${question.topics}">
						            <button type="button" class="btn btn-default btn-xs" style="background-color: #ccc">
						              <a href="/app/topic/${topic.topicId }/detail"><i class="fa fa-tag"></i> ${topic.topicName}</a>
						            </button>
						          </c:forEach>
				              </span>
			              </div>
			              <div id="noti" style="clear: both; padding-top: 10px;">
			              	 <span class="question-upvote"><i class="glyphicon glyphicon-arrow-up"></i> ${question.upvotes } upvote</span>
			              	 <span class="question-downvote"><i class="glyphicon glyphicon-arrow-down"></i> ${question.downvotes } downvote</span>
				              <span class="question-date"><i class="fa fa-clock-o"></i> ${question.ago}</span>
				              <span class="question-comment">
				                  <i class="fa fa-comment"></i> ${fn:length(question.answers)} câu trả lời
				              </span>
				              <span class="question-view"><i class="fa fa-eye"></i> ${question.views} lượt xem</span>
				              <div class="clearfix"></div>
			              </div>
			            </div>
			          </article>
			        </c:forEach>
			      </div>
				  
			</div>
			<!-- right column -->
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
<jsp:include page="footer.jsp"></jsp:include>