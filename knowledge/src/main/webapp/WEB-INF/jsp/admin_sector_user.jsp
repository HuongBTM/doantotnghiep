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
                    <h1 class="page-header">Danh sách thành viên thuộc lĩnh vực ${sector.sectorName}</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            
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
				                  </tr>
				                </thead>
				                <tbody>
				                  <c:forEach items="${sector.users}" var="user" varStatus="userId">
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
    <!-- jQuery -->
    <jsp:include page="admin_footer.jsp"></jsp:include>