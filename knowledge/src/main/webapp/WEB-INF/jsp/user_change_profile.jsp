<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp"></jsp:include>

<!-- Content wrapper -->
<div class="container">

<div class="main-content page-content ask-question" style="margin-top: 90px; margin-left: 90px; width: 800px;">
    <h3 class="page-header">Cập nhật thông tin cá nhân</h3>

    <div class="form-style form-style-3" id="question-submit">
      <form:form class="form-horizontal form-label-left" action="/admin/user/save" method="post" modelAttribute="user">
			<input type="hidden" name="idHidden" value="${user.userId}">
             <div class="item form-group">
               <label class="control-label col-md-3 col-sm-3 col-xs-12" for="fullname">Tên hiển thị <span class="required">*</span>
               </label>
               <div class="col-md-8 col-sm-6 col-xs-12">
                 <form:input id="sectorName" class="form-control col-md-7 col-xs-12" name="fullname" placeholder="Tên hiển thị..."
                 		 required="required" type="text" path="fullname" title="Hãy nhập 8-25 ký tự. e.g: Bùi Hương"></form:input>
               	<form:errors path="fullname" cssClass="error" delimiter="<br><i class='fa fa-exclamation-circle'></i> "></form:errors>
               </div>
             </div>
             <div class="item form-group">
               <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Tên đăng nhập <span class="required">*</span>
               </label>
               <div class="col-md-8 col-sm-6 col-xs-12">
                 <form:input id="username" class="form-control col-md-7 col-xs-12" name="username" placeholder="Tên đăng nhập..." 
                 		required="required" type="text" path="username" title="Hãy nhập 8-25 ký tự. e.g: Bùi Hương"></form:input>
               	<form:errors path="username" cssClass="error" delimiter="<br><i class='fa fa-exclamation-circle'></i> "></form:errors>
               </div>
             </div>
             <div class="item form-group">
               <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Email <span class="required">*</span>
               </label>
               <div class="col-md-8 col-sm-6 col-xs-12">
                 <form:input id="email" class="form-control col-md-7 col-xs-12" name="email" placeholder="Email..." required="required" type="email" path="email"></form:input>
               	<form:errors path="email" cssClass="error" delimiter="<br><i class='fa fa-exclamation-circle'></i> "></form:errors>
               </div>
             </div>
             <div class="item form-group">
               <label class="control-label col-md-3 col-sm-3 col-xs-12" for="phoneNum">Số điện thoại <span class="required">*</span>
               </label>
               <div class="col-md-8 col-sm-6 col-xs-12">
                 <form:input id="email" class="form-control col-md-7 col-xs-12" name="phoneNum" placeholder="Số điện thoại..." required="required" type="text" path="phoneNum"></form:input>
               </div>
             </div>
              <div class="item form-group">
               <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Địa chỉ
               </label>
               <div class="col-md-8 col-sm-6 col-xs-12">
                 <form:input id="email" class="form-control col-md-7 col-xs-12" name="address" placeholder="Số điện thoại..." type="text" path="address"></form:input>
               </div>
             </div>
             <div class="item form-group">
               <label class="control-label col-md-3 col-sm-3 col-xs-12" for="password">Mật khẩu <span class="required">*</span>
               </label>
               <div class="col-md-8 col-sm-6 col-xs-12">
                 <form:input id="email" class="form-control col-md-7 col-xs-12" name="password" placeholder="Mật khẩu..." 
                 		required="required" type="password" path="password" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"  
						title="Mật khẩu phải chứa ký tự hoa, ký tự thường, chữ số và ít nhất 8 ký tự"></form:input>
               	<form:errors path="password" cssClass="error" delimiter="<br><i class='fa fa-exclamation-circle'></i> "></form:errors>
               </div>
             </div>
             <div class="item form-group">
               <label class="control-label col-md-3 col-sm-3 col-xs-12" for="confirmpassword">Nhập lại mật khẩu <span class="required">*</span>
               </label>
               <div class="col-md-8 col-sm-6 col-xs-12">
                 <form:input id="email" class="form-control col-md-7 col-xs-12" name="confirmpassword" placeholder="Nhập lại mật khẩu..." required="required" type="password" path="confirmpassword"></form:input>
               	<form:errors path="confirmpassword" cssClass="error" delimiter="<br><i class='fa fa-exclamation-circle'></i> "></form:errors>
               </div>
             </div>
             <div class="item form-group">
             	<label class="control-label col-md-3 col-sm-3 col-xs-12" >Ảnh đại diện</span>
               </label>
               <div class="col-md-8 col-sm-6 col-xs-12">
             		<div class="user-profile-img"><img id="avatar" src="<c:url value="/resources/assets/img/${CURRENT_USER.image}" />" alt="admin"></div>
					<input id="file-upload" type="file"/>
				</div>
			</div>
             <div class="item form-group">
               <label class="control-label col-md-3 col-sm-3 col-xs-12" for="abouts">Abouts
               </label>
               <div class="col-md-8 col-sm-6 col-xs-12">
                 <form:textarea id="abouts" name="abouts" rows="5" cols="30" placeholder="Đôi điều về bạn..." class="form-control col-md-7 col-xs-12" path="abouts"></form:textarea>
               </div>
             </div>
             <!-- image -->
             <div class="ln_solid"></div>
             <div class="form-group">
               <div class="col-md-8 col-md-offset-3">
                 <button id="send" type="submit" class="btn btn-success">Lưu</button>
                 <button type="reset" class="btn btn-primary">Reset</button>
                 <a href="/app/user/${CURRENT_USER.userId }/info" class="btn btn-primary">Hủy</a>
               </div>
             </div>
           </form:form>
    	</div>
  	</div>
</div>
	<script type="text/javascript">
	document.getElementById('file-upload').onchange = function (evt) {
        var tgt = evt.target || window.event.srcElement,
            files = tgt.files;

        // FileReader support
        if (FileReader && files && files.length) {
            var fr = new FileReader();
            fr.onload = function () {
                document.getElementById('avatar').src = fr.result;
            }
            fr.readAsDataURL(files[0]);
            //document.getElementById("avatar_url").value = "0";
        }
    }
	</script>
<jsp:include page="footer.jsp"></jsp:include>
  