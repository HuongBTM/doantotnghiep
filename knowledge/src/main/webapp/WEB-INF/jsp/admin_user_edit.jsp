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
                    <h3 class="page-header">Cập nhật thông tin thành viên</h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <c:choose>
						        <c:when test="${user.userId == 0}">
						          Thêm thành viên mới
						        </c:when>
						        <c:otherwise>
						          Chỉnh sửa thông tin
						        </c:otherwise>
						      </c:choose>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <form:form class="form-horizontal form-label-left" action="/admin/user/save" method="post" modelAttribute="user">
								<input type="hidden" name="idHidden" value="${user.userId}">
		                      <div class="item form-group">
		                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="fullname">Tên hiển thị <span class="required">*</span>
		                        </label>
		                        <div class="col-md-6 col-sm-6 col-xs-12">
		                          <form:input id="sectorName" class="form-control col-md-7 col-xs-12" name="fullname" placeholder="Tên hiển thị..."
		                          		 required="required" type="text" path="fullname" title="Hãy nhập 8-25 ký tự. e.g: Bùi Hương"></form:input>
		                        	<form:errors path="fullname" cssClass="error" delimiter="<br><i class='fa fa-exclamation-circle'></i> "></form:errors>
		                        </div>
		                      </div>
		                      <div class="item form-group">
		                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Tên đăng nhập <span class="required">*</span>
		                        </label>
		                        <div class="col-md-6 col-sm-6 col-xs-12">
		                          <form:input id="username" class="form-control col-md-7 col-xs-12" name="username" placeholder="Tên đăng nhập..." 
		                          		required="required" type="text" path="username" title="Hãy nhập 8-25 ký tự. e.g: Bùi Hương"></form:input>
		                        	<form:errors path="username" cssClass="error" delimiter="<br><i class='fa fa-exclamation-circle'></i> "></form:errors>
		                        </div>
		                      </div>
		                      <div class="item form-group">
		                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Email <span class="required">*</span>
		                        </label>
		                        <div class="col-md-6 col-sm-6 col-xs-12">
		                          <form:input id="email" class="form-control col-md-7 col-xs-12" name="email" placeholder="Email..." required="required" type="email" path="email"></form:input>
		                        	<form:errors path="email" cssClass="error" delimiter="<br><i class='fa fa-exclamation-circle'></i> "></form:errors>
		                        </div>
		                      </div>
		                      <div class="item form-group">
		                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="phoneNum">Số điện thoại <span class="required">*</span>
		                        </label>
		                        <div class="col-md-6 col-sm-6 col-xs-12">
		                          <form:input id="phoneNum" class="form-control col-md-7 col-xs-12" name="phoneNum" placeholder="Số điện thoại..." required="required" type="text" path="phoneNum"></form:input>
		                        </div>
		                      </div>
		                       <div class="item form-group">
		                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Địa chỉ
		                        </label>
		                        <div class="col-md-6 col-sm-6 col-xs-12">
		                          <form:input id="address" class="form-control col-md-7 col-xs-12" name="address" placeholder="Địa chỉ..." type="text" path="address"></form:input>
		                        </div>
		                      </div>
		                      <div class="item form-group">
		                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="password">Mật khẩu <span class="required">*</span>
		                        </label>
		                        <div class="col-md-6 col-sm-6 col-xs-12">
		                          <form:input id="password" class="form-control col-md-7 col-xs-12" name="password" placeholder="Mật khẩu..." 
		                          		required="required" type="password" path="password" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"  
												title="Mật khẩu phải chứa ký tự hoa, ký tự thường, chữ số và ít nhất 8 ký tự"></form:input>
		                        	<form:errors path="password" cssClass="error" delimiter="<br><i class='fa fa-exclamation-circle'></i> "></form:errors>
		                        </div>
		                      </div>
		                      <div class="item form-group">
		                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="confirmpassword">Nhập lại mật khẩu <span class="required">*</span>
		                        </label>
		                        <div class="col-md-6 col-sm-6 col-xs-12">
		                          <form:input id="confirmPassword" class="form-control col-md-7 col-xs-12" name="confirmpassword" placeholder="Nhập lại mật khẩu..." required="required" type="password" path="confirmpassword"></form:input>
		                        	<form:errors path="confirmpassword" cssClass="error" delimiter="<br><i class='fa fa-exclamation-circle'></i> "></form:errors>
		                        </div>
		                      </div>
		                      <div class="item form-group">
		                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="abouts">Abouts
		                        </label>
		                        <div class="col-md-6 col-sm-6 col-xs-12">
		                          <form:textarea id="abouts" name="abouts" rows="5" cols="30" placeholder="Đôi điều về bạn..." class="form-control col-md-7 col-xs-12" path="abouts"></form:textarea>
		                        </div>
		                      </div>
		                      <div class="item form-group">
					              <label class="control-label col-md-3 col-sm-3 col-xs-12" for= "roleSelect">Quyền</label>
					              <div class="col-md-6 col-sm-6 col-xs-12">
					              <select id="roleSelect" name="roleSelect" class="form-control" onchange="showSector(value)">
					                  <option value="admin" ${user.admin eq true ? 'selected' : ''}>Admin</option>
					                  <option value="expect" ${user.expect eq true ? 'selected' : ''}>Expect</option>
					                  <option value="member" ${user.admin eq false and user.expect eq false ? 'selected' : ''}>Member</option>
					              </select>
					              </div>
					            </div>
					            
					            <div id="sector" class="item form-group">
						            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sectors">Lĩnh vực chuyên sâu <span class="required">*</span>
						            </label>
						            <div class="col-md-6 col-sm-6 col-xs-12">
						              	<form:select id="selectSector" class="form-control" path="sectors" multiple="true" items="${sectors}" itemValue="sectorId" itemLabel="sectorName" style="height:150px;"/>
						            	<form:errors path="sectors" cssClass="error" delimiter="<br><i class='fa fa-exclamation-circle'></i> "></form:errors>
						            </div>
						          </div>
		                      <div class="ln_solid"></div>
		                      <div class="form-group">
		                        <div class="col-md-6 col-md-offset-3">
		                          <button id="send" type="submit" class="btn btn-success">Lưu</button>
		                          <button type="reset" class="btn btn-primary">Reset</button>
		                          <a href="/admin/user/alluser" class="btn btn-primary">Hủy</a>
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
	<script type="text/javascript">
		function showSector(roleSelect) {
			var x = document.getElementById("sector");
			if(roleSelect=='expect') {
			     x.style.display = "block";
			} else {
				x.style.display = "none";
			}
		}
		window.addEventListener("load",function(){
			var roleSelect = $("#roleSelect").val();
			showSector(roleSelect);
        },false);
		
	</script>
	<jsp:include page="admin_footer.jsp"></jsp:include>