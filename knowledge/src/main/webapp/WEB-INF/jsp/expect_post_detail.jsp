<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<jsp:include page="expect_layout.jsp"></jsp:include>
<!-- page content -->
        <div class="right_col" role="main">
          <div class="">
        	<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Chi tiết bài viết</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
        	<c:if test="${not empty success}">
			    <div class="alert alert-success alert-dismissible">
			      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
			      <i class="icon fa fa-check"></i> ${success}
			    </div>
			  </c:if>
			
			  <c:if test="${not empty error}">
			    <div class="alert alert-danger alert-dismissible">
			      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
			      <i class="icon fa fa-exclamation-triangle"></i> ${error}
			    </div>
			  </c:if>
			
			  <div class="row">
			    <div class="col-md-12">
			      <!-- Box Comment -->
			      <div class="box box-widget">
			        <div class="box-header with-border">
			          <div class="user-block">
			            <img class="img-circle" src="<c:url value="/resources/assets/img/${post.user.image}" />" alt="User Image">
			            <span class="username">
			              <a href="<c:url value="/admin/user/${post.user.userId}" />">${post.user.fullname}</a>
			            </span>
			            <span class="description"><fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${post.creatAt}" /></span>
			          </div>
			          <!-- /.user-block -->
			        </div>
			        <!-- /.box-header -->
			        
			        <div class="box-body">
			        	<p><h3><b>${post.postTitle}</b></h3></p>
			          <p>${post.postContent}</p>
			          <c:forEach var="topic" items="${post.topics}">
			            <button type="button" class="btn btn-default btn-xs" style="background-color: #ccc">
			              <i class="fa fa-tag"></i> ${topic.topicName}
			            </button>
			          </c:forEach>
			        </div>
			        <!-- /.box-body -->
			      </div>
			      <!-- /.box -->
			    </div>
			    <!-- /.col -->
			  </div>
			  <!-- /.row -->
			  
			  <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Câu hỏi liên quan
                        </div>
                        <div class="panel-body">
                        <!-- nav tab custom -->
	                      <div class="nav-tabs-custom">
	                        <ul class="nav nav-tabs">
					          <li class="active"><a href="#questions" data-toggle="tab">Tất cả câu hỏi</a></li>
					          <li><a href="#noanswers" data-toggle="tab">Câu hỏi chưa trả lời</a></li>
					        </ul>
                        	<div class="tab-content">
          						<div class="active tab-pane" id="questions">
			                        <c:choose>
							            <c:when test="${empty post.questions}">
							              <p>Không có câu hỏi nào cho bài viết này</p>
							            </c:when>
							            <c:otherwise>
			                             <table width="100%" id="dataTables-topic-question" class="table table-bordered table-striped table-hover">
							                <thead>
							                  <tr>
							                    <th align="center">ID</th>
							                    <th align="center">Tiêu đề</th>
							                    <th align="center">Nội dung</th>
							                    <th align="center">Người đăng</th>
							                    <th align="center">Ngày đăng</th>
							                    <th align="center">Lượt xem</th>
							                    <th align="center">Bình chọn</th>
							                    <th align="center">Số câu trả lời</th>
							                    <th align="center">Trả lời</th>
							                  </tr>
							                </thead>
							                <tbody>
							                  <c:forEach items="${post.questions}" var="question" >
							                    <tr>
							                      <td align="right">${question.questionId}</td>
							                      <td>${question.title}</td>
							                      <td>${question.questionContent}</td>
							                      <td align="left">${question.creatAt}</td>
							                      <td>${question.user.fullname}</td>
							                      <td align="right">${question.views}</td>
							                      <td align="right">${question.upvotes}</td>
							                      <td align="right">${fn:length(question.answers)}</td>
							                      <td align="center">
							                        <a href="<c:url value="/expect/question/detail/${question.questionId}" />" title="Xem chi tiết và trả lời">
							                          <i class="fa fa-reply"></i></a>
							                      </td>
							                    </tr>
							                  </c:forEach>
							                </tbody>
							              </table>
			                            <!-- /.table-responsive -->
			                            </c:otherwise>
			                            </c:choose>
			                           </div>
			                         </div>
          						<div class="tab-pane" id="noanswers">
			                        <%-- <c:choose>
							            <c:when test="${empty questions}">
							              <p>Không có câu hỏi nào cho bài viết này</p>
							            </c:when>
							            <c:otherwise>
			                             <table width="100%" id="dataTables-topic-question" class="table table-bordered table-striped table-hover">
							                <thead>
							                  <tr>
							                    <th align="center">ID</th>
							                    <th align="center">Tiêu đề</th>
							                    <th align="center">Nội dung</th>
							                    <th align="center">Người đăng</th>
							                    <th align="center">Ngày đăng</th>
							                    <th align="center">Lượt xem</th>
							                    <th align="center">Bình chọn</th>
							                    <th align="center">Số câu trả lời</th>
							                    <th align="center">Trả lời</th>
							                  </tr>
							                </thead>
							                <tbody>
							                  <c:forEach items="${questions}" var="question" >
							                    <tr>
							                      <td align="right">${question.questionId}</td>
							                      <td>${question.title}</td>
							                      <td>${question.questionContent}</td>
							                      <td align="left">${question.creatAt}</td>
							                      <td>${question.user.fullname}</td>
							                      <td align="right">${question.views}</td>
							                      <td align="right">${question.upvotes}</td>
							                      <td align="right">${fn:length(question.answers)}</td>
							                      <td align="center">
							                        <a href="<c:url value="/expect/question/detail/${question.questionId}" />" title="Xem chi tiết và trả lời">
							                          <i class="fa fa-reply"></i></a>
							                      </td>
							                    </tr>
							                  </c:forEach>
							                </tbody>
							              </table>
			                            <!-- /.table-responsive -->
			                            </c:otherwise>
			                            </c:choose> --%>
			                       </div>
                        	</div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        
        </div>
        </div>
    <!-- /#wrapper -->
 
<jsp:include page="admin_footer.jsp"></jsp:include>