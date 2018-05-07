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
                             <table width="100%" id="datatable-buttons" class="table table-bordered table-striped table-hover">
				                <thead>
				                  <tr>
				                  <th align="center">STT</th>
				                    <th align="center">ID</th>
				                    <th align="center">Tiêu đề</th>
				                    <th align="center">Nội dung</th>
				                    <th align="center">Người đăng</th>
				                    <th align="center">Ngày đăng</th>
				                    <th align="center">Lượt xem</th>
				                    <th align="center">Bình chọn</th>
				                    <th align="center">Số câu trả lời</th>
				                  </tr>
				                </thead>
				                <tbody>
				                  <c:forEach items="${questions}" var="question" varStatus="questionId">
				                    <tr>
				                     <td align="right">${questionId.index+1}</td>
				                      <td align="right">${question.questionId}</td>
				                      <td>${question.title}</td>
				                      <td>${question.questionContent}</td>
				                      <td>${question.user.fullname}</td>
				                      <td>${question.creatAt}</td>
				                      <td align="right">${question.views}</td>
				                      <td align="right">${question.upvotes}</td>
				                      <td align="right">${fn:length(question.answers)}</td>
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
<jsp:include page="admin_footer.jsp"></jsp:include>