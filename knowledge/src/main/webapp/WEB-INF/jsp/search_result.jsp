<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="header.jsp"></jsp:include>

<!-- Content wrapper -->
<div class="question-container _full ">
<div id="question-content" class="snippet-hidden">

    <div class="inner-content clearfix">
        <div id="question-header">
           <h1 itemprop="name">Kết quả tìm kiếm cho "${q}"</h1>
		</div>
        <div id="mainbar" role="main" aria-label="question and answers">
            <!-- nav-tab-custom -->
            <div class="nav-tabs-custom">
		        <ul class="nav nav-tabs">
		          <li class="active"><a href="#questions" data-toggle="tab">Câu hỏi ${fn:length(questions)}</a></li>
		          <li><a href="#posts" data-toggle="tab">Bài viết ${fn:length(posts)}</a></li>
		        </ul>
		        <div class="tab-content">
		          <div class="active tab-pane" id="questions" style="width: 100%">
		          <c:choose>
		          <c:when test="${ empty questions}">
		          <c:out value="Không tìm thấy câu hỏi nào."></c:out>
		          </c:when>
		          <c:otherwise>
		            <c:forEach var="question" items="${questions}">
		              <!-- Post -->
		              <div class="post">
		                <div class="user-block">
		                  <img class="img-circle img-bordered-sm" 
		                       src="<c:url value="/resources/assets/img/${question.user.image}" />" alt="user image">
		                  <span class="username">
		                    <a href="<c:url value="/app/user/${question.user.userId}/info" />">${question.user.fullname}</a>
		                    <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
		                  </span>
		                  <span class="description">
		                    <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${question.creatAt}" />
		                  </span>
		                </div>
		                <!-- /.user-block -->
		                <p style="font-size: 15px"><b>${question.title}</b></p>
		                <p>${question.summary}</p>
		                <ul class="list-inline">
		                  <li>
		                    <a href="<c:url value="/app/question/${question.questionId}/detail" />" class="link-black text-sm">
		                      <i class="fa fa-share margin-r-5"></i> Xem chi tiết
		                    </a>
		                  </li>
		                </ul>
		                <div class="tags t-java t-nullpointerexception">
							<c:forEach items="${question.topics}" var="topic">
							<a href="/app/topic/${topic.topicId }/detail"
								class="btn btn btn-default btn-xs" style="background-color: #b4d3ea" title="" rel="tag"><i class="fa fa-tag"></i>${topic.topicName }</a> 
							</c:forEach>
						</div>
		                <div id="noti" style="clear: both; padding-top: 10px;">
			              	 <span class="question-upvote"><i class="glyphicon glyphicon-arrow-up"></i> ${question.upvotes } upvote</span>
			              	 <span class="question-downvote"><i class="glyphicon glyphicon-arrow-down"></i> ${question.downvotes } downvote</span>
				              <span class="question-date"><i class="fa fa-clock-o"></i> ${question.ago}</span>
				              <span class="question-comment">
				                  <i class="fa fa-comment"></i> ${fn:length(question.answers)} câu trả lời
				              </span>
				              <span class="question-view"><i class="fa fa-eye"></i> ${question.views} lượt xem</span>
				              <div class="clearfix" style="background-color: #dedcdc;"></div>
			              </div>
		              </div>
		              <!-- /.post -->
		              
		            </c:forEach>
		            </c:otherwise>
		            </c:choose>
		          </div>
		          <!-- /.tab-pane -->
		          <div class="tab-pane" id="posts" style="width: 100%">
		            <c:choose>
			          <c:when test="${empty posts}">
			          <c:out value="Không tìm thấy bài viết nào."></c:out>
			          </c:when>
			          <c:otherwise>
			          <c:forEach var="post" items="${posts}" >
		              <!-- Post -->
		              <div class="post">
		                <div class="user-block">
		                  <img class="img-circle img-bordered-sm" 
		                       src="<c:url value="/resources/assets/img/${post.user.image}" />" alt="user image">
		                  <span class="username">
		                    <a href="/app/user/${post.user.userId }/info">${post.user.fullname}</a>
		                    <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
		                  </span>
		                  <span class="description">
		                    <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${post.creatAt}" />
		                  </span>
		                </div>
		                <!-- /.user-block -->
		                <p style="font-size: 15px"><b>${post.postTitle}</b></p>
		                <p>${post.summary}</p>
		                <ul class="list-inline">
		                  <li>
		                    <a href="<c:url value="/app/post/${post.postId}/detail" />" class="link-black text-sm">
		                      <i class="fa fa-share margin-r-5"></i> Xem chi tiết
		                    </a>
		                  </li>
		                </ul>
		                <div class="tags t-java t-nullpointerexception">
							<c:forEach items="${post.topics}" var="topic">
							<a href="/app/topic/${topic.topicId }/detail"
								class="post-tag" title="" rel="tag"><i class="fa fa-tag"></i>${topic.topicName }</a> 
							</c:forEach>
						</div>
		                <div id="noti" style="clear: both; padding-top: 10px;">
			              	 <span class="question-upvote"><i class="glyphicon glyphicon-arrow-up"></i> ${post.upvotes } upvote</span>
			              	 <span class="question-downvote"><i class="glyphicon glyphicon-arrow-down"></i> ${post.downvotes } downvote</span>
				              <span class="question-date"><i class="fa fa-clock-o"></i> ${post.ago}</span>
				              <span class="question-comment">
				                  <i class="fa fa-comment"></i> ${fn:length(post.questions)} câu hỏi
				              </span>
				              <span class="question-view"><i class="fa fa-eye"></i> ${question.views} lượt xem</span>
				              <div class="clearfix" style="background-color: #dedcdc;"></div>
			              </div>
		              </div>
		              <!-- /.post -->
		            </c:forEach>
		            </c:otherwise>
		            </c:choose>
		          </div>
		          <!-- /.tab-pane -->
		        </div>
		        <!-- /.tab-content -->
		      </div>
    	
     	</div>
     	
     	<!-- right content -->
       	<div id="sidebar" class="show-votes" role="complementary" aria-label="sidebar">  
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

<jsp:include page="footer.jsp"></jsp:include>