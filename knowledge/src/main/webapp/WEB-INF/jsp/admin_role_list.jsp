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
                    <h1 class="page-header">Danh sách quyền</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Bảng quyền
                        </div>
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <div>
                        	<a href="/admin/role/addrole" id="btnAddRole" class="btn btn-primary btn-xs btnAddRole" style="width: 100px; height: 30px; margin-bottom: 10px; padding-top: 5px;"><i class="fa fa-plus"></i> Thêm mới 
                        	</a>
                        </div>
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-role">
                                <thead>
                                    <tr>
                                    	<th align="center">STT</th>
                                        <th align="center">ID</th>
                                        <th align="center">Tên quyền</th>
                                        <th align="center">Mô tả quyền</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${lstRole}" var="role" varStatus="roleId">
                                    <tr class="odd gradeX">
                                    	<td align="right"><c:out value="${roleId.index+1}"></c:out></td>
                                        <td align="right"><c:out value="${role.roleId}"></c:out></td>
                                        <td><c:out value="${role.roleName}"></c:out></td>
                                        <td><c:out value="${role.roleDescrib}"></c:out></td>
                                        <td align="center">
				                            <%-- <a href="/admin/role/findone/${role.roleId}" data-id="${role.roleId}" class="btn btn-info btn-xs eRoleBtn"><i class="fa fa-pencil"></i> Sửa </a> --%>
				                            <a href="/admin/role/editrole/${role.roleId}" data-id="${role.roleId}" class="btn btn-info btn-xs editRoleBtn"><i class="fa fa-pencil"></i> Sửa </a>
				                            <a href="#" data-id="${role.roleId}" id="deleteRoleBtn" class="btn btn-danger btn-xs deleteRoleBtn"><i class="fa fa-trash-o"></i> Xóa </a>
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
            
        </div>
        </div>
        <!-- /#page-wrapper -->

	<!-- datamodal -->
		<div class="modal fade" id="modalUpdateRole" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content no 1-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">Role</h4>
		        </div>
		        <!-- ./modal-header -->
		        <div class="modal-body">
		         <form:form id="updateRoleForm" action="/admin/role/saverole" method="post" modelAttribute="role" class="form-horizontal">
			          <div class="login-box-body">
					    <input type="hidden" id="idHidden" name="idHidden" value="${role.roleId}">
					    <div class="item form-group">
	                        <label class="control-label col-xs-3" for="roleName">Tên quyền<span class="required">*</span>
	                        </label>
	                        <div class="col-xs-9">
	                          <form:input id="roleName" class="form-control col-md-7 col-xs-12" name="roleName" placeholder="Tên quyền..." required="required" type="text" path="roleName"></form:input>
	                        	<div class="error" hidden="hidden"></div>
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-xs-3" for="roleDescrib">Mô tả quyền
                        </label>
                        <div class="col-xs-9">
                          <form:textarea id="roleDescrib" name="roleDescrib" rows="5" cols="30" placeholder="Mô tả quyền..." class="form-control col-md-7 col-xs-12" path="roleDescrib"></form:textarea>
                        </div>
                      </div>
			        </div>
			        <!-- /.modal-body -->
			        <div class="modal-footer">
			 			<button type="submit" class="btn btn-danger" id="btnSave">Lưu</button>
			 			<button type="button" class="btn btn-basic" data-dismiss="modal">Hủy</button>
			 		</div>
		 		</form:form>
		 		<!-- /.modal-footer -->
		      </div>
		      <!-- ./modal-content -->
		      
		    </div>
	  	</div>
	  	</div>
		<!-- modal to delete -->
	  	<div class="modal fade" id="delRoleModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Xóa quyền</h4>
	        </div>
	        <div class="modal-body">
	        	<input type="hidden" id="idHidden" name="idHidden" value="0">
	          <p>Bạn chắc chắn xóa quyền này?</p>
	        </div>
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-danger" id="delRoleBtn"> Delete </button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
    <!-- /#wrapper -->
 
    <!-- jQuery -->
    <jsp:include page="admin_footer.jsp"></jsp:include>
