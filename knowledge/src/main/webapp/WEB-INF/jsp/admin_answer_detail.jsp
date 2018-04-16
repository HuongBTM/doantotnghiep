<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<jsp:include page="admin_layout.jsp"></jsp:include>

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
			            <img class="img-circle" src="<c:url value="/resources/assets/img/${answer.user.image}" />" alt="User Image">
			            <span class="username">
			              <a href="<c:url value="/admin/user/${answer.user.userId}" />">${answer.user.fullname}</a>
			            </span>
			            <span class="description"><fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${answer.creatAt}" /></span>
			          </div>
			          <!-- /.user-block -->
			        </div>
			        <!-- /.box-header -->
			        
			        <div class="box-body">
			        	<p><h3><b>${answer.question.title}</b></h3></p>
			          <p>${answer.answerContent}</p>
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
			          <h3 class="box-title">Comments</h3>
			        </div>
			        <!-- /.box-header -->
			        
			        <div class="box-body">
			          <c:choose>
			            <c:when test="${empty answer.comments}">
			              <p>No comment for this answer.</p>
			            </c:when>
			            <c:otherwise>
			              <table id="dataTables-comment" class="table table-bordered">
			                <thead>
			                  <tr>
			                    <th align="center">User</th>
			                    <th align="center">Posted</th>
			                    <th align="center">Comment content</th>
			                    <th align="center">Delete</th>
			                  </tr>
			                </thead>
			                <tbody>
			                  <c:forEach var="comment" items="${answer.comments}">
			                    <tr>
			                      <td align="center">
			                        <img class="img-circle img-sm" src="<c:url value="/resources/assets/img/${comment.user.image}" />"
			                          alt="User Image" title="${comment.user.fullname}" />
			                      </td>
			                      <td align="left">
			                        <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${comment.creatAt}" />
			                      </td>
			                      <td> ${comment.cmtContent} </td>
			                      <td align="center">
			                      	<input type="hidden" id="idAnswer" name="idHidden" value="${answer.answerId }">
			                        <a href="#" title="Delete comment" id="${comment.commentId }" class="deleteCommentBtn" data-id="${comment.commentId}">
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
        </div>
    <!-- /#wrapper -->
 
 	<!-- modal to delete -->
	  	<div class="modal fade" id="delCommentModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Delete comment</h4>
	        </div>
	        <div class="modal-body">
	        	<input type="hidden" id="idHidden" name="idHidden" value="0">
	        	<input type="hidden" id="idAnswerHidden" name="idHidden" value="0">
	          <p>Bạn chắc chắn xóa bản ghi này?</p>
	        </div>
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-danger" id="delCommentBtn"> Delete </button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
    
<jsp:include page="admin_footer.jsp"></jsp:include>
        