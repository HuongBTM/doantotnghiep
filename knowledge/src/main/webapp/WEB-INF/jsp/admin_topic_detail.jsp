<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<jsp:include page="admin_layout.jsp"></jsp:include>
<!-- page content -->
        <div class="right_col" role="main">
          <div class="">
           
			<div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header">Chủ đề ${topic.topicName}</h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Posts
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
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                         
                        <c:choose>
				            <c:when test="${empty topic.posts}">
				              <p>Không có bài viết thuộc chủ đề này.</p>
				            </c:when>
				            <c:otherwise>
                             <table width="100%" id="dataTables-topic-post" class="table table-bordered table-striped table-hover">
				                <thead>
				                  <tr>
				                    <th align="center">ID</th>
				                    <th align="center">Title</th>
				                    <th align="center">Người đăng</th>
				                    <th align="center">Ngày đăng</th>
				                    <th align="center">Lượt xem</th>
				                    <th align="center">Bình chọn</th>
				                    <th align="center">Số câu hỏi</th>
				                    <th align="center">Chi tiết</th>
				                    <th align="center">Xóa</th>
				                  </tr>
				                </thead>
				                <tbody>
				                  <c:forEach items="${topic.posts}" var="post" >
				                    <tr>
				                      <td align="right">${post.postId}</td>
				                      <td>${post.postTitle}</td>
				                      <td align="center">
				                        <img class="img-circle img-sm" src="<c:url value="/resources/assets/img/${post.user.image}" />"
				                          alt="User Image" title="${post.user.fullname}" />
				                      </td>
				                      <td align="left">${post.creatAt}</td>
				                      <td align="right">${post.views}</td>
				                      <td align="right">${post.upvotes}</td>
				                      <td align="right">${fn:length(post.questions)}</td>
				                      <td align="center">
				                        <a href="<c:url value="/admin/post/detail/${post.postId}" />" title="View post detail">
				                          <i class="fa fa-search"></i></a>
				                      </td>
				                      <td align="center">
				                        <a href="#" class="btn btn-danger btn-xs deleteTopicPost" id="deleteTopicPost" data-id="${post.postId}">
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
			<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Câu hỏi
                        </div>
                        <div class="panel-body">
                        <c:choose>
				            <c:when test="${empty topic.questions}">
				              <p>Không có câu hỏi thuộc chủ đề này.</p>
				            </c:when>
				            <c:otherwise>
                             <table width="100%" id="dataTables-topic-question" class="table table-bordered table-striped table-hover">
				                <thead>
				                  <tr>
				                    <th align="center">ID</th>
				                    <th align="center">Title</th>
				                    <th align="center">Người đăng</th>
				                    <th align="center">Ngày đăng</th>
				                    <th align="center">Lượt xem</th>
				                    <th align="center">Bình chọn</th>
				                    <th align="center">Số câu trả lời</th>
				                    <th align="center">Chi tiết</th>
				                    <th align="center">Xóa</th>
				                  </tr>
				                </thead>
				                <tbody>
				                  <c:forEach items="${topic.questions}" var="question" >
				                    <tr>
				                      <td align="right">${question.questionId}</td>
				                      <td>${question.title}</td>
				                      <td>${question.user.fullname}</td>
				                      <td align="left">${question.creatAt}</td>
				                      <td align="right">${question.views}</td>
				                      <td align="right">${question.upvotes}</td>
				                      <td align="right">${fn:length(question.answers)}</td>
				                      <td align="center">
				                        <a href="<c:url value="/admin/question/detail/${question.questionId}" />" title="View question detail">
				                          <i class="fa fa-search"></i></a>
				                      </td>
				                      <td align="center">
				                      	<input type="hidden" id="idTopic" name="idTopic" value="${topic.topicId }">
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
 
 	<!-- modal to delete post -->
	  	<div class="modal fade" id="delPostTopicModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Xóa bài viết</h4>
	        </div>
	        <div class="modal-body">
	        	<input type="hidden" id="idHidden" name="idHidden" value="0">
	        	<input type="hidden" id="idTopicHidden" name="idTopicHidden" value="0">
	          <p>Bạn chắc chắn xóa bản ghi này?</p>
	        </div>
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-danger" id="delPostTopicBtn"> Xóa </button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
 	<!-- modal to delete question -->
	  	<div class="modal fade" id="delQuestionTopicModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Xóa câu hỏi</h4>
	        </div>
	        <div class="modal-body">
	        	<input type="hidden" id="idHidden" name="idHidden" value="0">
	        	<input type="hidden" id="idTopicHidden" name="idTopicHidden" value="0">
	          <p>Bạn chắc chắn xóa bản ghi này?</p>
	        </div>
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-danger" id="delQuestionTopicBtn"> Xóa </button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
    <!-- jQuery -->
<jsp:include page="admin_footer.jsp"></jsp:include>