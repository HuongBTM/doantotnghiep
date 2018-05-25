<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<jsp:include page="admin_layout.jsp"></jsp:include>
<!-- page content -->
<div class="right_col" role="main">
<div class="">
	<div class="row">
       <div class="col-lg-12">
           <h2 class="page-header">Chi tiết thành viên</h2>
       </div>
       <!-- /.col-lg-12 -->
   </div>
	<div class="row">
	<div class="col-md-3">

      <!-- Profile Image -->
      <div class="box box-primary">
        <div class="box-body box-profile">
          <img class="profile-user-img img-responsive img-circle" 
               src="<c:url value="/resources/assets/img/${user.image}" />" alt="User profile picture">

          <h3 class="profile-username text-center">${user.fullname}</h3>
          <h5 class="profile-username text-center">${user.address}</h5>
			<h5 class="profile-username text-center">
			<c:choose>
                <c:when test="${user.admin}">
                  <span class="label bg-red">Quản trị viên</span>
                </c:when>
                <c:when test="${user.expect}">
                  <span class="label bg-yellow">Chuyên gia</span>
                </c:when>
                <c:otherwise>
                  <span class="label bg-green">Thành viên</span>
                </c:otherwise>
              </c:choose>
			</h5>
			
			<div style="background-color: #6bc7e8; text-align: center">Điểm uy tín: ${user.points}</div>
			
          <ul class="list-group list-group-unbordered" style="margin-bottom: 0px; padding-top: 5px;">
          	<c:if test="${user.expect }"><li class="list-group-item">
				<i class="fa fa-graduation-cap">
				<b><c:forEach items="${user.sectors}" var="sector">
					<c:out value="${sector.sectorName},"></c:out>
				</c:forEach></b></i>
			</li></c:if>
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
            <li class="list-group-item">
              <b>Câu trả lời hữu ích</b> 
              <span class="pull-right badge bg-green">${countBestAnswer}</span>
            </li>
           <c:if test="${not empty user.abouts }"><li class="list-group-item">
              ${user.abouts }
            </li></c:if>
          </ul>
          <c:if test="${CURRENT_USER.userId eq user.userId }">
          <div style="padding-top: 5px; text-align: center"><a href="/admin/user/${user.userId}/changeprofile">
          	<i class="fa fa-pencil"></i> Cập nhật thông tin cá nhân</a></div></c:if>
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
                <p>${question.summary}</p>
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

          <div class="tab-pane" id="posts">
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
          </div>
          <!-- /.tab-pane -->
        </div>
        <!-- /.tab-content -->
      </div>
      <!-- /.nav-tabs-custom -->
    </div>
    <!-- /.col -->
  </div>
  <!-- /.row -->
  
</div>
</div>
<!-- /#wrapper -->
<!-- jQuery -->
<jsp:include page="admin_footer.jsp"></jsp:include>