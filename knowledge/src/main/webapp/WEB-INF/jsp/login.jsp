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
                        			<h3>Login to our site</h3>              
                        		</div>
                        		<!-- <div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div> -->
                            </div>
                            <div class="form-bottom">
								<form:form action="/login" method="post" class="login-form" modelAttribute="user">
									<form:errors path="email" cssStyle="color:red;display:block"></form:errors>
									<div class="form-group">
										<label class="sr-only" for="email">Email</label>
										<form:input path="email" type="text" name="email" placeholder="Email..." pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-z]{2,7}$"  
												title="Hãy nhập email hợp lệ. e.g: huongbt@gmail.com" 
												class="form-username form-control" id="l-form-username" />
									</div>
									<div class="form-group"> 
										<label class="sr-only" for="password">Password</label>
										<form:input path="password" type="password" name="password" placeholder="Password..." 
												pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"  
												title="Mật khẩu phải chứa ký tự hoa, ký tự thường, chữ số và ít nhất 8 ký tự"
												class="form-password form-control" id="l-form-password" />
										
									</div>
									<c:if test="${not empty emailmessage}">
										<label class="validation-message"><c:out value="${emailmessage}"></c:out></label>
									</c:if> 
									
									<button type="submit" class="btn">Sign in!</button>
							</form:form>
						</div>
                        </div>
                    </div>
                    <div class="row login_with">
                        <div class="col-sm-4 col-sm-offset-4 social-login">
                        	<h3>...or login with:</h3>
                        	<div class="social-login-buttons">
	                        	<a class="btn btn-link-2 btn-link-1-facebook" href="#">
	                        		<i class="fa fa-facebook"></i>
	                        	</a>
	                        	<a class="btn btn-link-2 btn-link-1-twitter" href="#">
	                        		<i class="fa fa-twitter"></i>
	                        	</a>
	                        	<a class="btn btn-link-2 btn-link-1-google-plus" href="#">
	                        		<i class="fa fa-google-plus"></i>
	                        	</a>
                        	</div>
                        </div>
	                    </div>
					<div class="row">
						<div class="col-sm-4 col-sm-offset-4 social-login">
							<p class="change_link">
								Not a member yet? <a href="/register" class="to_register"> Đăng ký </a>
							</p>
							<p></p>
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