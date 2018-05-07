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
                    <h1 class="page-header">Danh sách câu trả lời</h1>
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
                        </div>
                             <table width="100%" id="dataTables-question" class="table table-bordered table-striped table-hover">
				                <thead>
				                  <tr>
				                  <th align="center">STT</th>
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
				                  <c:forEach var="answer" items="${answers}" varStatus="answerId">
				                  	
				                    <tr>
				                    	<td align="right">${answerId.index+1}</td>
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
				                        <a href="#" title="Delete answer" class="deleteAnswerBtn" data-id="${answer.answerId}">
				                          <i class="fa fa-trash"></i>
				                        </a>
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
	          <p>Bạn chắc chắn xóa bản ghi này?</p>
	        </div>
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-danger" id="delAnswerListBtn"> Xóa </button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
    <!-- jQuery -->
<jsp:include page="admin_footer.jsp"></jsp:include>
