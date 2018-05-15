<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<jsp:include page="header.jsp"></jsp:include>
<!-- page content -->
<div class="container">
<div class="right_col" role="main" style="margin-top: 90px;">
<div class="">
<div class="row">
	<div class="col-md-3">

      <!-- Profile Image -->
      <div class="box box-primary">
        <div class="box-body box-profile">
          <img class="profile-user-img img-responsive img-circle" 
               src="<c:url value="/resources/assets/img/${user.image }" />" alt="avata">

          <h3 class="profile-username text-center">${user.fullname}</h3>

          <ul class="list-group list-group-unbordered">
            <li class="list-group-item">
              <b>Câu hỏi</b> 
              <span class="pull-right badge bg-blue">${fn:length(questions)}</span>
            </li>
            <li class="list-group-item">
              <b>Câu trả lời</b>
              <span class="pull-right badge bg-yellow">${fn:length(answers)}</span>
            </li>
            <li class="list-group-item">
              <b>Bài viết</b> 
              <span class="pull-right badge bg-green">${fn:length(posts)}</span>
            </li>
          </ul>
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
    </div>
    <!-- /.col -->

    <div class="col-md-9">
      <div class="nav-tabs-custom">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#questions" data-toggle="tab">Câu hỏi</a></li>
          <li><a href="#answers" data-toggle="tab">Câu trả lời</a></li>
          <li><a href="#posts" data-toggle="tab">Bài viết</a></li>
        </ul>
        <div class="tab-content">
          <div class="active tab-pane" id="questions">
          <c:choose>
          <c:when test="${empty questions }">
          	<c:out value="Không có câu hỏi nào."></c:out>
          </c:when>
          <c:otherwise>
            <c:forEach var="question" items="${questions}">
              <!-- Post -->
              <div class="post" style="margin-bottom: 0px; margin-left: 10px; margin-right: 10px;">
                <h4><b>${question.title }</b></h4>
                <p>${question.questionContent}</p>
                
                <ul class="list-inline">
                  <li>
                    <a href="<c:url value="/app/question/${question.questionId}/detail" />" class="link-black text-sm">
                      <i class="fa fa-share margin-r-5"></i> Xem chi tiết
                    </a>
                  </li>
                </ul>
                <div id="tag-lst" style="width: 400px; float: left">
		              <span class="question-category">
		              	<c:forEach var="topic" items="${question.topics}">
				            <button type="button" class="btn btn-default btn-xs" style="background-color: #b4d3ea; border-color: #b4d3ea;">
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
		              <span class="question-view" style="float: right"><a href="/app/user/${question.user.userId }/delete/question/${question.questionId}"><i class="fa fa-trash-o"></i></a></span>
		              <span class="question-view" style="float: right"><a href="/app/user/${question.user.userId }/edit/question/${question.questionId}"><i class="fa fa-pencil"></i></a></span>
		              <div class="clearfix" style="background-color: #dedcdc;"></div>
	              </div>
              </div>
              <!-- /.post -->
            </c:forEach>
            </c:otherwise>
            </c:choose>
          </div>
          <!-- /.tab-pane -->
          <div class="tab-pane" id="answers">
          <c:choose>
          <c:when test="${empty answers }">
          	<c:out value="Không có câu trả lời nào."></c:out>
          </c:when>
          <c:otherwise>
            <c:forEach var="answer" items="${answers}">
              <!-- Post -->
              <div class="post" style="margin-bottom: 0px; margin-left: 10px; margin-right: 10px;">
                <p>${answer.answerContent}</p>
                <ul class="list-inline">
                  <li>
                    <a href="<c:url value="/app/question/${answer.question.questionId}/detail" />" class="link-black text-sm">
                      <i class="fa fa-share margin-r-5"></i> Xem chi tiết
                    </a>
                  </li>
                </ul>
                <div id="noti" style="clear: both; padding-top: 10px;">
	              	 <span class="question-upvote"><i class="glyphicon glyphicon-arrow-up"></i> ${answer.upvotes } upvote</span>
	              	 <span class="question-downvote"><i class="glyphicon glyphicon-arrow-down"></i> ${answer.downvotes } downvote</span>
		              <span class="question-date"><i class="fa fa-clock-o"></i> ${answer.ago}</span>
		              <span class="question-comment">
		                  <i class="fa fa-comment"></i> ${fn:length(answer.comments)} comment
		              </span>
		              <span class="question-view" style="float: right"><a href="/app/user/${answer.user.userId }/delete/answer/${answer.answerId}"><i class="fa fa-trash-o"></i></a></span>
		              <span class="question-view" style="float: right"><a href="/app/user/${answer.user.userId }/edit/answer/${answer.answerId}"><i class="fa fa-pencil"></i></a></span>
		              <div class="clearfix" style="background-color: #dedcdc;"></div>
	              </div>
	            </div>
              <!-- /.post -->
            </c:forEach>
            </c:otherwise>
            </c:choose>
          </div>
          <!-- /.tab-pane -->

          <div class="tab-pane" id="posts">
          <c:choose>
          <c:when test="${empty posts }">
          	<c:out value="Không có bài viết nào."></c:out>
          </c:when>
          <c:otherwise>
            <c:forEach var="post" items="${posts}">
              <!-- Post -->
              <div class="post">
                <div class="user-block">
                  <img class="img-circle img-bordered-sm" 
                       src="<c:url value="/resources/assets/img/${post.user.image}" />" alt="user image">
                  <span class="username">
                    <a href="#">${post.user.fullname}</a>
                    <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                  </span>
                  <span class="description">
                    <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${post.creatAt}" />
                  </span>
                </div>
                <!-- /.user-block -->
                <p>${post.summary}</p>
                <ul class="list-inline">
                  <li>
                    <a href="<c:url value="/admin/post/detail/${post.postId}" />" class="link-black text-sm">
                      <i class="fa fa-share margin-r-5"></i> Xem chi tiết
                    </a>
                  </li>
                </ul>
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
      <!-- /.nav-tabs-custom -->
    </div>
    <!-- /.col -->
  </div>
  
  </div>
  </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>