<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <!-- <meta charset="utf-8"> -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Knowledge - Nơi chia sẻ kiến thức cho sinh viên</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="/resources/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="/resources/assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="/resources/assets/css/form-elements.css">
        <link rel="stylesheet" href="/resources/assets/css/style.css">

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="/resources/assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/resources/assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/resources/assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/resources/assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="/resources/assets/ico/apple-touch-icon-57-precomposed.png">

    </head>

    <body>

        <!-- Top content -->
       <div class="top-content">
        	<div class="container">
                	
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2 text">
                        <h1>Chào mừng bạn đến với MTA-Knowledge Sharing</h1>
                        <!-- <div class="description">
                        	<p>
	                         	Free responsive template made with Bootstrap. 
	                         	Download it on <a href="http://azmind.com" target="_blank">AZMIND</a>, 
	                         	customize and use it as you like!
                        	</p>
                        </div> -->
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-4 show-forms">
                    	<span class="show-register-form active">Register</span> 
                    	<span class="show-forms-divider">/</span> 
                    	<span class="show-login-form">Login</span>
                    </div>
                </div>
                
                <div class="row register-form">
                    <div class="col-sm-4 col-sm-offset-4">
						<form:form action="/register" method="post" class="l-form" modelAttribute="user">
	                    	<div class="form-group">
	                    		<label class="sr-only" for="r-form-first-name">Full name</label>
	                        	<form:input type="text" path="fullname" name="r-form-first-name" placeholder="Full name..." class="r-form-first-name form-control" id="r-form-first-name"/>
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="r-form-user-name">Last name</label>
	                        	<form:input type="text" path="username" name="r-form-user-name" placeholder="Tên đăng nhập..." class="r-form-last-name form-control" id="r-form-last-name"/>
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="r-form-email">Email</label>
	                        	<form:input type="text" path="email" name="r-form-email" placeholder="Email..." class="r-form-email form-control" id="r-form-email"/>
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="r-form-password">Password</label>
	                        	<form:input type="password" path="password" name="r-form-password" placeholder="Password..." class="r-form-email form-control" id="r-form-email"/>
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="r-form-password-confirm">Confirm password</label>
	                        	<form:input type="password" path="confirmpassword" name="r-form-password-confirm" placeholder="Confirm password..." class="r-form-email form-control" id="r-form-email"/>
	                        </div>
	                        <!-- <div class="form-group">
	                        	<label class="sr-only" for="r-form-about-yourself">About yourself</label>
	                        	<textarea name="r-form-about-yourself" placeholder="About yourself..." 
	                        				class="r-form-about-yourself form-control" id="r-form-about-yourself"></textarea>
	                        </div> -->
				            <button type="submit" class="btn">Sign me up!</button>
						</form:form>
                    </div>
                    <!-- <div class="col-sm-6 forms-right-icons">
						<div class="row">
							<div class="col-sm-2 icon"><i class="fa fa-pencil"></i></div>
							<div class="col-sm-10">
								<h3>Beautiful Forms</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-2 icon"><i class="fa fa-commenting"></i></div>
							<div class="col-sm-10">
								<h3>Awesome Login</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-2 icon"><i class="fa fa-magic"></i></div>
							<div class="col-sm-10">
								<h3>Great Registration</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.</p>
							</div>
						</div>
                    </div> -->
                </div>
                
                <div class="row login-form">
                    <div class="col-sm-4 col-sm-offset-1">
				    	<form:form action="/login" method="post" class="l-form" modelAttribute="user">
					    	<div class="form-group">
	                    		<label for="l-form-username"><c:out value="${emailmessage}">${emailmessage}</c:out></label>
	                        	<form:input path="email" type="text" name="l-form-username" placeholder="Email..." class="l-form-username form-control" id="l-form-username"/>
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="l-form-password">Password</label>
	                        	<form:input path="password" type="password" name="l-form-password" placeholder="Password..." class="l-form-password form-control" id="l-form-password"/>
	                        </div>
				            <button type="submit" class="btn">Sign in!</button>
				    	</form:form>
				    	<div class="social-login">
                        	<p>Or login with:</p>
                        	<div class="social-login-buttons">
	                        	<a class="btn btn-link-1" href="#"><i class="fa fa-facebook"></i></a>
	                        	<a class="btn btn-link-1" href="#"><i class="fa fa-twitter"></i></a>
	                        	<a class="btn btn-link-1" href="#"><i class="fa fa-google-plus"></i></a>
                        	</div>
                        </div>
                    </div>
                    <div class="col-sm-6 forms-right-icons">
						<div class="row">
							<div class="col-sm-2 icon"><i class="fa fa-user"></i></div>
							<div class="col-sm-10">
								<h3>New Features</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-2 icon"><i class="fa fa-eye"></i></div>
							<div class="col-sm-10">
								<h3>Easy To Use</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-2 icon"><i class="fa fa-twitter"></i></div>
							<div class="col-sm-10">
								<h3>Social Integrated</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.</p>
							</div>
						</div>
                    </div>
                </div>
                    
        	</div>
        </div>

        <!-- Footer -->
        <!-- <footer>
        	<div class="container">
        		<div class="row">
        			
        			<div class="col-sm-8 col-sm-offset-2">
        				<div class="footer-border"></div>
        				<p>Made by <a href="http://azmind.com" target="_blank">AZMIND</a>.</p>
        			</div>
        			
        		</div>
        	</div>
        </footer> -->

        <!-- Javascript -->
        <script src="/resources/assets/js/jquery-1.11.1.min.js"></script>
        <script src="/resources/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="/resources/assets/js/jquery.backstretch.min.js"></script>
        <script src="/resources/assets/js/scripts.js"></script>
        
       <!--  [if lt IE 10]> -->
            <script src="assets/js/placeholder.js"></script>
        <!-- <![endif]> -->

    </body>

</html>