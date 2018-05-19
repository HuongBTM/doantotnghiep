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
                    <h1 class="page-header">Danh sách câu hỏi</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
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
                         <div>
                        	<a href="/admin/question/addquestion" id="btnAddUser" class="btn btn-primary btn-xs addBtn" style="width: 100px; height: 30px; margin-bottom: 10px; padding-top: 5px;"><i class="fa fa-plus"></i> Thêm mới 
                        	</a>
                        	<a href="/admin/question/print" id="btnPrintUser" class="btn btn-primary btn-xs addBtn" style="width: 100px; height: 30px; margin-bottom: 10px; padding-top: 5px"><i class="fa fa-print"></i> In danh sách 
                        	</a>
                        </div>
                             <table width="100%" id="dataTables-question" class="table table-bordered table-striped table-hover">
				                <thead>
				                  <tr>
				                   <th align="center">STT</th>
				                    <th align="center">ID</th>
				                    <th align="center">Tiêu đề</th>
				                    <th align="center">Người đăng</th>
				                    <th align="center">Ngày đăng</th>
				                    <th align="center">Lượt xem</th>
				                    <th align="center">Bình chọn</th>
				                    <th align="center">Số câu trả lời</th>
				                    <th align="center">Chi tiết</th>
				                    <th align="center"></th>
				                  </tr>
				                </thead>
				                <tbody>
				                  <c:forEach items="${questions}" var="question" varStatus="questionId">
				                    <tr>
				                      <td align="right">${questionId.index+1}</td>
				                      <td align="right">${question.questionId}</td>
				                      <td>${question.title}</td>
				                      <td>${question.user.fullname}</td>
				                      <td>${question.creatAt}</td>
				                      <td align="right">${question.views}</td>
				                      <td align="right">${question.upvotes}</td>
				                      <td align="right">${fn:length(question.answers)}</td>
				                      <td align="center">
				                        <a href="<c:url value="/admin/question/detail/${question.questionId}" />" title="View question detail">
				                          <i class="fa fa-search"></i></a>
				                      </td>
				                      <td align="center">
				                      	<a href="/admin/question/edit/${question.questionId}" id="editPost" data-id="${post.postId}" class="btn btn-info btn-xs ePostBtn" title="Sửa"><i class="fa fa-pencil"></i> </a>
				                        <a href="#" class="btn btn-danger btn-xs deleteQuestion" id="deleteQuestion" data-id="${question.questionId}" title="Xóa">
				                          <i class="fa fa-trash"></i></a>
				                      </td>
				                    </tr>
				                  </c:forEach>
				                </tbody>
				              </table>
                            <!-- /.table-responsive -->
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        <!-- /#page-wrapper -->

    </div>
    </div>
    <!-- /#wrapper -->
 
 	<!-- modal to delete -->
	  	<div class="modal fade" id="delQuestionModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Xóa câu hỏi</h4>
	        </div>
	        <div class="modal-body">
	        	<input type="hidden" id="idHidden" name="idHidden" value="0">
	          <p>Bạn chắc chắn xóa bản ghi này?</p>
	        </div>
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-danger" id="delQuestionBtn"> Xóa </button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
    <!-- jQuery -->
<jsp:include page="admin_footer.jsp"></jsp:include>
