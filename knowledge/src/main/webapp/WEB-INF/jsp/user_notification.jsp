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
               src="<c:url value="/resources/assets/img/1.png" />" alt="avata">

          <h3 class="profile-username text-center">${user.fullname}</h3>
			<!-- thông tin user -->
          <ul class="list-group list-group-unbordered">
            <li class="list-group-item">
              <b>Thông báo</b> 
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
          <li class="active"><a href="#questions" data-toggle="tab">Tất cả thông báo</a></li>
          <li><a href="#answers" data-toggle="tab">Chưa đọc</a></li>
        </ul>
        <div class="tab-content">
          <div class="active tab-pane" id="questions">
            <c:forEach var="question" items="${questions}">
              <!-- Post -->
              <div class="post">
                <div class="user-block">
                  <img class="img-circle img-bordered-sm" 
                       src="<c:url value="/resources/assets/img/${user.image}" />" alt="user image">
                  <span class="username">
                    <a href="<c:url value="/admin/user/${user.userId}" />">${user.fullname}</a>
                    <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                  </span>
                  <span class="description">
                    <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${question.creatAt}" />
                  </span>
                </div>
                <!-- /.user-block -->
                <p>${question.questionContent}</p>
                <ul class="list-inline">
                  <li>
                    <a href="<c:url value="/admin/question/detail/${question.questionId}" />" class="link-black text-sm">
                      <i class="fa fa-share margin-r-5"></i> Xem chi tiết
                    </a>
                  </li>
                </ul>
              </div>
              <!-- /.post -->
            </c:forEach>
          </div>
          <!-- /.tab-pane -->
          <div class="tab-pane" id="answers">
            <c:forEach var="answer" items="${answers}">
              <!-- Post -->
              <div class="post">
                <div class="user-block">
                  <img class="img-circle img-bordered-sm" 
                       src="<c:url value="/resources/assets/img/${answer.user.image}" />" alt="user image">
                  <span class="username">
                    <a href="<c:url value="/admin/user/${answer.user.userId}" />">${answer.user.fullname}</a>
                    <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                  </span>
                  <span class="description">
                    <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${answer.creatAt}" />
                  </span>
                </div>
                <!-- /.user-block -->
                <p>${answer.answerContent}</p>
                <ul class="list-inline">
                  <li>
                    <a href="<c:url value="/admin/question/detail/${answer.question.questionId}" />" class="link-black text-sm">
                      <i class="fa fa-share margin-r-5"></i> Xem chi tiết
                    </a>
                  </li>
                </ul>
              </div>
              <!-- /.post -->
            </c:forEach>
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