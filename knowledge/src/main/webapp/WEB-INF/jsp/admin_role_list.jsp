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
                            Role: Quyền
                        </div>
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <div style="padding-left: 20px;">
                        	<a href="/admin/role/addrole" id="btnAddRole" class="btn btn-primary btn-xs addBtn" style="width: 100px; height: 30px; margin-bottom: 10px; padding-top: 5px;"><i class="fa fa-plus"></i> Add 
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
				                            <%-- <a href="/admin/role/editrole/${role.roleId}" data-id="${role.roleId}" class="btn btn-info btn-xs eBtn" data-target="#editrole" data-toggle="modal"><i class="fa fa-pencil"></i> Edit </a> --%>
				                            <a href="/admin/role/editrole/${role.roleId}" data-id="${role.roleId}" class="btn btn-info btn-xs eBtn"><i class="fa fa-pencil"></i> Edit </a>
				                            <a href="javascript:showConfirm(${role.roleId})" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
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
        <!-- /#page-wrapper -->

	<!-- datamodal -->
	<%-- 
		<div class="modal fade" id="editrole" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content no 1-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">Thêm/ sửa lĩnh vực</h4>
		        </div>
		        <!-- ./modal-header -->
		         <form:form id="updateroleForm" action="/admin/role/saverole" method="post" modelAttribute="role" class="form-horizontal">
		        <div class="modal-body">
			       
			          <div class="login-box-body">
					    <div class="form-group">
					        <label for="roleName" class="col-xs-3 control-label">Tên lĩnh vực</label>
					        <div class="col-xs-9">
					            <form:input type="text" class="form-control" placeholder="Tên lĩnh vực..." id="roleName" name="roleName" path="roleName"/>
					        </div>
					    </div>
					    <div class="form-group">
					        <label for="describerole" class="col-xs-3 control-label">Mô tả</label>
					        <div class="col-xs-9">
					            <form:textarea type="text" class="form-control" rows="5" cols="30" placeholder="Mô tả lĩnh vực..." name="describerole" id="describerole" path="describerole"/>
					        </div>
					    </div>
					    
		            </div>
		            
		        </div>
		        <!-- /.modal-body -->
		        <div class="modal-footer">
		 			<button type="submit" class="btn btn-success" id="btnSave">Save</button>
		 			<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
		 		</div>
		 		</form:form>
		 		<!-- /.modal-footer -->
		      </div>
		      <!-- ./modal-content -->
		      
		    </div>
	  	</div> --%>
	

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
    <script src="/resources/assets/js/admin-add-edit.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    
</body>

</html>
