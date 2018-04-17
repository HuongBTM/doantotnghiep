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
                    <c:choose>
				        <c:when test="${sector.sectorId == 0}">
				          <h2>Thêm lĩnh vực mới</h2>
				        </c:when>
				        <c:otherwise>
				          <h2>Chỉnh sửa thông tin lĩnh vực</h2>
				        </c:otherwise>
				      </c:choose>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Lĩnh vực
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <form:form id="updateRoleForm" action="/admin/role/saverole" method="post" modelAttribute="role" class="form-horizontal">
					          <div class="login-box-body">
							    <input type="hidden" id="idHidden" name="idHidden" value="${role.roleId}">
							    <div class="item form-group">
			                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="roleName">Tên quyền<span class="required">*</span>
			                        </label>
			                        <div class="col-md-6 col-sm-6 col-xs-12">
			                          <form:input id="roleName" class="form-control col-md-7 col-xs-12" name="roleName" placeholder="Tên quyền..." required="required" type="text" path="roleName"></form:input>
			                        	<div class="error" hidden="hidden"></div>
		                        </div>
		                      </div>
		                      <div class="item form-group">
		                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="roleDescrib">Mô tả quyền
		                        </label>
		                        <div class="col-md-6 col-sm-6 col-xs-12">
		                          <form:textarea id="roleDescrib" name="roleDescrib" rows="5" cols="30" placeholder="Mô tả quyền..." class="form-control col-md-7 col-xs-12" path="roleDescrib"></form:textarea>
		                        </div>
		                      </div>
					        </div>
					        <div class="form-group">
		                      <div class="col-md-6 col-md-offset-3">
					 			<button type="submit" class="btn btn-danger" id="btnSave">Lưu</button>
					 			<a href="/admin/role/allrole" class="btn btn-primary">Hủy</a>
					 			</div>
					 		</div>
				 			</form:form>
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

<jsp:include page="admin_footer.jsp"></jsp:include>