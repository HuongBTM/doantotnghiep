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
                <h2 class="page-header">Danh sách bài viết</h2>
                </div>
                <!-- /.col-lg-12 -->
            </div>
			
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Bảng bài viết
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
				            <c:when test="${empty posts}">
				              <p>Không có bài viết nào.</p>
				            </c:when>
				            <c:otherwise>
                             <table width="100%" id="datatable-buttons" class="table table-bordered table-striped table-hover">
				                <thead>
				                  <tr>
				                    <th align="center">STT</th>
				                    <th align="center">ID</th>
				                    <th align="center">Tiêu đề</th>
				                    <th align="center">Người đăng</th>
				                    <th align="center">Ngày đăng</th>
				                    <th align="center">Lượt xem</th>
				                    <th align="center">Bình chọn</th>
				                    <th align="center">Sô câu hỏi</th>
				                  </tr>
				                </thead>
				                <tbody>
				                  <c:forEach items="${posts}" var="post" varStatus="postId">
				                    <tr>
				                      <td align="right">${postId.index+1}</td>
				                      <td align="right">${post.postId}</td>
				                      <td>${post.postTitle}</td>
				                      <td align="center">${post.user.fullname}</td>
				                      <td align="left">${post.creatAt}</td>
				                      <td align="right">${post.views}</td>
				                      <td align="right">${post.upvotes}</td>
				                      <td align="right">${fn:length(post.questions)}</td>
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
<jsp:include page="admin_footer.jsp"></jsp:include>