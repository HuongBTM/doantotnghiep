<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Knowledge - Nơi chia sẻ kiến thức cho sinh viên CNTT</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="/resources/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="/resources/assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="/resources/assets/css/form-elements.css">
        <link rel="stylesheet" href="/resources/assets/css/style.css">   
    </head>

    <body>

        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                   
                    <div class="row">
                        <div class="col-sm-4 col-sm-offset-4 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>Đăng ký tài khoản</h3>              
                        		</div>

                            </div>
                            <div class="form-bottom">
								<form:form action="/register" method="post" class="login-form" modelAttribute="user">
									<form:errors path="email" cssStyle="color:red;display:block"></form:errors>
									<div class="form-group">
										<label class="sr-only" for="form-fullname">Họ tên</label>
										<form:input path="fullname" type="text" name="form-fullname" placeholder="Họ tên..." 
												title="Hãy nhập 8-25 ký tự. e.g: Bùi Hương" 
												class="form-username form-control" id="l-form-fullname" />
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-username">Tên hiển thị</label>
										<form:input path="username" type="text" name="form-username" placeholder="Tên hiển thị..."
												title="Hãy nhập 8-25 ký tự. e.g: HuongBTM" 
												class="form-username form-control" id="l-form-username" />
									</div>
									<div class="form-group">
										<label class="sr-only" for="form-email">Email</label>
										<form:input path="email" type="text" name="form-email" placeholder="Email..." 
												pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-z]{2,7}$" 
												title="Hãy nhập email hợp lệ. e.g: huongbt@gmail.com" 
												class="form-username form-control" id="l-form-email" />
									</div>
									<div class="form-group">
										<label class="sr-only" for="l-form-password">Mật khẩu</label>
										<form:input path="password" type="password" name="form-password" placeholder="Mật khẩu..." 
												pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"  
												title="Mật khẩu phải chứa ký tự hoa, ký tự thường, chữ số và ít nhất 8 ký tự"
												class="form-password form-control" id="l-form-password" />
									</div>
									<div class="form-group">
										<label class="sr-only" for="l-form-password-confirm">Nhập lại mật khẩu</label>
										<form:input path="confirmpassword" type="password" name="form-password" placeholder="Nhập lại mật khẩu..." 
												class="form-password form-control" id="l-form-password-confirm" />
									</div>
									<label class="validation-message"><c:out value="${errMessage}"></c:out></label>
									
									<button type="submit" class="btn">Đăng ký!</button>
							</form:form>
						</div>
                        </div>
                    </div>
					<div class="row">
						<div class="col-sm-4 col-sm-offset-4 social-login">
							<p class="change_link">
								Bạn đã có tài khoản? <a href="/login" class="to_register">Đăng nhập </a>
							</p>
						</div>
					</div>
				</div>
            </div>
            
        </div>

        <!-- Javascript -->
        <script src="/resources/assets/bootstrap/js/jquery.min.js"></script>
        <script src="/resources/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="/resources/assets/bootstrap/js/jquery.backstretch.min.js"></script>
        <script src="/resources/assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>