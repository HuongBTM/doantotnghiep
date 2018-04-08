<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<jsp:include page="admin_layout.jsp"></jsp:include>

        <div id="page-wrapper" style="min-height: 386px;">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            User Manager
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
                         <div style="padding-left: 20px;">
                        	<a href="/admin/user/adduser" id="btnAddUser" class="btn btn-primary btn-xs addBtn" style="width: 100px; height: 30px; margin-bottom: 10px; padding-top: 5px;"><i class="fa fa-plus"></i> Add 
                        	</a>
                        </div>
                             <table width="100%" id="dataTables-user" class="table table-bordered table-striped table-hover">
				                <thead>
				                  <tr>
				                  	 <th align="center">STT</th>
				                    <th align="center">ID</th>
				                    <th align="center">Tên hiển thị</th>
				                    <th align="center">Email</th>
				                    <th align="center">Số điện thoại</th>
				                    <th align="center">Ngày đăng ký</th>
				                    <th align="center">Role</th>
				                    <th></th>
				                  </tr>
				                </thead>
				                <tbody>
				                  <c:forEach items="${users}" var="user" varStatus="userId">
				                    <tr>
				                      <td align="right">${user.userId}</td>
				                      <td>
				                        <img src="<c:url value='/resources/assets/img/${user.image}' />" class="avatar-table" alt="User avatar">
				                        <a href="<c:url value="/admin/user/${user.userId}" />">${user.fullname}</a>
				                      </td>
				                      <td>${user.email}</td>
				                      <td align="right">${user.phoneNum}</td>
				                      <td align="left">${user.createDate}</td>
				                      <td align="center">
				                        <c:choose>
				                          <c:when test="${user.admin}">
				                            <span class="label bg-red">Admin</span>
				                          </c:when>
				                          <c:otherwise>
				                            <span class="label bg-green">Member</span>
				                          </c:otherwise>
				                        </c:choose>
				                      </td>
				                      <td align="center">
				                            <a href="/admin/user/edit/${user.userId}" id="editUser" data-id="${user.userId}" class="btn btn-info btn-xs eBtn"><i class="fa fa-pencil"></i> Edit </a>
				                            <a href="#" class="btn btn-danger btn-xs delVoteTypeBtn" id="delete" data-id="${user.userId}"><i class="fa fa-trash-o"></i> Delete </a>
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
    <!-- /#wrapper -->
 
    <!-- jQuery -->
    <script src="/resources/assets/bootstrap/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/assets/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/assets/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="/resources/assets/metisMenu/raphael.min.js"></script>
    <script src="/resources/assets/metisMenu/morris.min.js"></script>
    <script src="/resources/assets/metisMenu/morris-data.js"></script>

   <!--  DataTables JavaScript -->
    <script src="/resources/assets/bootstrap/js/jquery.dataTables.min.js"></script>
    <script src="/resources/assets/bootstrap/js/dataTables.bootstrap.min.js"></script> 
    
    <!-- Custom Theme JavaScript -->
    <script src="/resources/assets/js/admin-sb.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->

</body>

</html>
