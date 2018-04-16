<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<jsp:include page="admin_layout.jsp"></jsp:include>
    <div class="right_col" role="main">
          <div class="">
        	<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Chi tiết câu hỏi</h1>
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
			            <img class="img-circle" src="<c:url value="/resources/assets/img/${question.user.image}" />" alt="User Image">
			            <span class="username">
			              <a href="<c:url value="/admin/user/${question.user.userId}" />">${question.user.fullname}</a>
			            </span>
			            <span class="description"><fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${question.creatAt}" /></span>
			          </div>
			          <!-- /.user-block -->
			        </div>
			        <!-- /.box-header -->
			        
			        <div class="box-body">
			        	<p><h3><b>${question.title}</b></h3></p>
			          	<p>${question.questionContent}</p>
			          <c:forEach var="topic" items="${question.topics}">
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
			    <div class="col-md-12">
			      <!-- Box Comment -->
			      <div class="box box-widget">
			        <div class="box-header with-border">
			          <h3 class="box-title">Câu trả lời</h3>
			        </div>
			        <!-- /.box-header -->
			        
			        <div class="box-body">
			          <c:choose>
			            <c:when test="${empty question.answers}">
			              <p>Chưa có câu trả lời.</p>
			            </c:when>
			            <c:otherwise>
			              <table id="dataTables-answer" class="table table-bordered">
			                <thead>
			                  <tr>
			                  	<th align="center">ID</th>
			                  	<th align="center">Nội dung</th>
			                    <th align="center">Người đăng</th>
			                    <th align="center">Ngày đăng</th>
			                    <th align="center">Bình chọn</th>
			                    <th align="center">Số comment</th>
			                    <th align="center">Chi tiết</th>
			                    <th align="center">Xóa</th>
			                  </tr>
			                </thead>
			                <tbody>
			                  <c:forEach var="answer" items="${question.answers}">
			                  	
			                    <tr>
			                    	<td align="right">${answer.answerId}</td>
			                    	<td> ${answer.answerContent} </td>
			                      <td align="center">
			                        <img class="img-circle img-sm" src="<c:url value="/resources/assets/img/${answer.user.image}" />"
			                          alt="User Image" title="${answer.user.fullname}" />
			                      </td>
			                      <td align="left">
			                        <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${answer.creatAt}" />
			                      </td>
			                      <td align="right"> ${answer.upvotes}</td>
			                      <td align="right">${fn:length(answer.comments)}</td>
			                      <td align="center">
				                        <a href="<c:url value="/admin/answer/detail/${answer.answerId}" />" title="View answer detail">
				                          <i class="fa fa-search"></i></a>
				                      </td>
			                      <td align="center">
			                      	<input type="hidden" id="idQuestion" name="idHidden" value="${question.questionId }">
			                        <a href="#" title="Delete answer" class="deleteAnswerBtn" data-id="${answer.answerId}">
			                          <i class="fa fa-trash"></i>
			                        </a>
			                      </td>
			                    </tr>
			                  </c:forEach>
			                </tbody>
			              </table>
			            </c:otherwise>
			          </c:choose>
			        </div>
			        <!-- /.box-body -->
			        
			      </div>
			      <!-- /.box -->
			    </div>
			    <!-- /.col -->
			  </div>
        
        </div>
    <!-- /#wrapper -->
 	</div>
 	<!-- modal to delete -->
	  	<div class="modal fade" id="delAnswerModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Xóa câu trả lời</h4>
	        </div>
	        <div class="modal-body">
	        	<input type="hidden" id="idHidden" name="idHidden" value="0">
	        	<input type="hidden" id="idQuestionHidden" name="idHidden" value="0">
	          <p>Bạn chắc chắn xóa bản ghi này?</p>
	        </div>
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-danger" id="delAnswerBtn"> Xóa </button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
    <!-- jQuery -->
<jsp:include page="admin_footer.jsp"></jsp:include>
        