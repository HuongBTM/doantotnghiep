<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<jsp:include page="admin_layout.jsp"></jsp:include>
<!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Danh sách thành viên</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Bảng thành viên
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
                         <div>
                        	<a href="/admin/user/adduser" id="btnAddUser" class="btn btn-primary btn-xs addBtn" style="width: 100px; height: 30px; margin-bottom: 10px; padding-top: 5px;"><i class="fa fa-plus"></i> Thêm mới 
                        	</a>
                        </div>
                             <table width="100%" id="dataTables-user" class="table table-bordered table-striped table-hover">
				                <thead>
				                  <tr>
				                  	<th align="center">STT</th>
				                    <th align="center">ID</th>
				                    <th align="center">Tên đăng nhập</th>
				                    <th align="center">Tên hiển thị</th>
				                    <th align="center">Email</th>
				                    <th align="center">Số điện thoại</th>
				                    <th align="center">Ngày đăng ký</th>
				                    <th align="center">Địa chỉ</th>
				                    <th align="center">Quyền</th>
				                    <th></th>
				                  </tr>
				                </thead>
				                <tbody>
				                  <c:forEach items="${users}" var="user" varStatus="userId">
				                    <tr>
				                    	<td align="right">${userId.index+1}</td>
				                      <td align="right">${user.userId}</td>
				                      <td>
				                        <img src="<c:url value='/resources/assets/img/${user.image}' />" class="avatar-table" alt="User avatar">
				                        <a href="<c:url value="/admin/user/${user.userId}" />">${user.username}</a>
				                      </td>
				                      <td align="left">${user.fullname}</td>
				                      <td>${user.email}</td>
				                      <td align="right">${user.phoneNum}</td>
				                      <td align="left">${user.createDate}</td>
				                      <td align="left">${user.address}</td>
				                      <td align="center">
				                        <c:choose>
				                          <c:when test="${user.admin}">
				                            <span class="label bg-red">Admin</span>
				                          </c:when>
				                          <c:when test="${user.expect}">
				                            <span class="label bg-yellow">Expect</span>
				                          </c:when>
				                          <c:otherwise>
				                            <span class="label bg-green">Member</span>
				                          </c:otherwise>
				                        </c:choose>
				                      </td>
				                      <td align="center">
				                            <a href="/admin/user/edit/${user.userId}" id="editUser" data-id="${user.userId}" class="btn btn-info btn-xs eBtn"><i class="fa fa-pencil"></i> Sửa </a>
				                            <a href="#" class="btn btn-danger btn-xs deleteUser" id="deleteUser" data-id="${user.userId}"><i class="fa fa-trash-o"></i> Xóa </a>
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
	  	<div class="modal fade" id="delUserModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Xóa thành viên</h4>
	        </div>
	        <div class="modal-body">
	        	<input type="hidden" id="idHidden" name="idHidden" value="0">
	          <p>Bạn chắc chắn xóa người dùng này?</p>
	        </div>
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-danger" id="delUserBtn"> Xóa </button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
    <!-- jQuery -->
    <jsp:include page="admin_footer.jsp"></jsp:include>