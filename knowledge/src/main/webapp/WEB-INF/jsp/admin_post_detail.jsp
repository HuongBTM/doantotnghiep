<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<!-- page content -->
        <div class="right_col" role="main">
          <div class="">
        	<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"></h1>
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
                            Question
                        </div>
                        <div class="panel-body">
                        <c:choose>
				            <c:when test="${empty post.questions}">
				              <p>No questions for this post.</p>
				            </c:when>
				            <c:otherwise>
                             <table width="100%" id="dataTables-topic-question" class="table table-bordered table-striped table-hover">
				                <thead>
				                  <tr>
				                    <th align="center">ID</th>
				                    <th align="center">Title</th>
				                    <th align="center">User</th>
				                    <th align="center">Views</th>
				                    <th align="center">Votes</th>
				                    <th align="center">Answers</th>
				                    <th align="center">Detail</th>
				                    <th align="center">Delete</th>
				                  </tr>
				                </thead>
				                <tbody>
				                  <c:forEach items="${post.questions}" var="question" >
				                    <tr>
				                      <td align="right">${question.questionId}</td>
				                      <td>${question.title}</td>
				                      <td>${question.user.fullname}</td>
				                      <td align="right">${question.views}</td>
				                      <td align="right">${question.upvotes}</td>
				                      <td align="right">${fn:length(question.answers)}</td>
				                      <td align="center">
				                        <a href="<c:url value="/admin/question/detail/${question.questionId}" />" title="View question detail">
				                          <i class="fa fa-search"></i></a>
				                      </td>
				                      <td align="center">
				                        <a href="#" class="btn btn-danger btn-xs deleteQuestionTopic" id="deleteQuestionTopic" data-id="${question.questionId}">
				                          <i class="fa fa-trash"></i></a>
				                      </td>
				                    </tr>
				                  </c:forEach>
				                </tbody>
				              </table>
                            <!-- /.table-responsive -->
                            </c:otherwise>
                            </c:choose>
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
 
 	<!-- modal to delete -->
	  	<div class="modal fade" id="delAnswerModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Delete answer</h4>
	        </div>
	        <div class="modal-body">
	        	<input type="hidden" id="idHidden" name="idHidden" value="0">
	        	<input type="hidden" id="idQuestionHidden" name="idHidden" value="0">
	          <p>Bạn chắc chắn xóa bản ghi này?</p>
	        </div>
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-danger" id="delAnswerBtn"> Delete </button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
<jsp:include page="admin_footer.jsp"></jsp:include>