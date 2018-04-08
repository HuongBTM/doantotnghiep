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
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                         <div style="padding-left: 20px;">
                        	<a href="/admin/user/adduser" id="btnAddUser" class="btn btn-primary btn-xs addBtn" style="width: 100px; height: 30px; margin-bottom: 10px; padding-top: 5px;"><i class="fa fa-plus"></i> Add 
                        	</a>
                        </div>
                             <table width="100%" id="dataTables-user" class="table table-bordered table-striped table-hover">
				                <thead>
				                  <tr>
				                    <th>ID</th>
				                    <th>Tên hiển thị</th>
				                    <th>Email</th>
				                    <th>Số điện thoại</th>
				                    <th>Ngày đăng ký</th>
				                    <th>Role</th>
				                    <th>Edit</th>
				                    <th>Delete</th>
				                  </tr>
				                </thead>
				                <tbody>
				                  <c:forEach items="${users}" var="user" >
				                    <tr>
				                      <td align="center">${user.userId}</td>
				                      <td>
				                        <%-- <img src="<c:url value='/upload/${user.avatar}' />" class="avatar-table" alt="User avatar"> --%>
				                        <a href="<c:url value="/admin/user/${user.userId}" />">${user.fullname}</a>
				                      </td>
				                      <td>${user.email}</td>
				                      <td align="center">${user.phoneNum}</td>
				                      <td align="center">${user.creatDate}</td>
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
				                        <a href="<c:url value="/admin/user/${user.userId}/edit" />" title="Edit user">
				                          <i class="fa fa-pencil"></i>
				                        </a>
				                      </td>
				                      <td align="center">
				                        <a href="<c:url value="/admin/user/${user.userId}/delete" />" title="Delete user"
				                           onclick="return confirmDelete('user');">
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
