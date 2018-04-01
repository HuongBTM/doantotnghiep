<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Knowledge - Nơi chia sẻ kiến thức cho sinh viên CNTT</title>
  <meta name="description" content="Free Bootstrap Theme by BootstrapMade.com">
  <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Candal|Alegreya+Sans">
  <link rel="stylesheet" type="text/css" href="/resources/assets/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="/resources/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="/resources/assets/css/style.css">
  <link rel="stylesheet" type="text/css" href="/resources/assets/css/question.css">
  <script language="javascript" type="text/javascript" src="/resources/assets/bootstrap/js/bootstrap.min.js"></script>
  <script language="javascript" type="text/javascript" src="/resources/assets/bootstrap/js/jquery.min.js"></script>
  <script language="javascript" type="text/javascript" src="/resources/assets/bootstrap/js/custom.js"></script>
 
</head>

<body class="body_feed_card_on">
  <!--Navigation bar-->
  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/home">K<span>nowledge</span></a>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav navbar-left">
          <li><a href="/home"><i class="fa fa-home"></i> Home</a><div></div></li>
          <li><a href="/question"><i class="fa fa-question-circle"></i> Câu hỏi</a><div></div></li>
          <li><a href="/post"><i class= "fa fa-file-text-o"></i> Bài viết</a></li>
          <li><a href="/notification"><i class="fa fa-bell"></i> Thông báo</a></li>
          </ul>
       	 
       	 <ul class="nav navbar-nav navbar-right">
       	 <li>
            <form class="navbar-form" role="search">
            <div class="input-group">
                <input type="text" class="form-control search-input" placeholder="Search" name="q">
                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit" style='border-radius: 0px; padding: 9px'><i class="fa fa-search"></i></button>
                </div>
            </div>
            </form>    
       	 </li>
			<li class="dropdown">
		      <a class="dropdown-toggle btn-ask" data-toggle="dropdown" href="#"><i class= "fa fa-user"></i> UserName <span class="caret"></span></a>
		        <ul class="dropdown-menu">
		          <li><a href="#">Profile</a></li>
		          <li><a href="#">Page 1-2</a></li>
		          <li><a href="#">Page 1-3</a></li>
		          <li role="separator" class="divider"></li>
                 <li><a href="#">Logout &nbsp;<i class="fa fa-sign-out" aria-hidden="true"></i></a></li>
	        </ul>
	      </li>
	      <!-- <li><a href="#" data-target="#login" data-toggle="modal">Sign in</a></li> -->
          <li class="btn-ask"><a href="#footer">Đặt câu hỏi</a></li>
        </ul>
      </div>
    </div>
    <script language="javascript" type="text/javascript" src="/resources/assets/bootstrap/js/bootstrap.min.js"></script>
  	<script language="javascript" type="text/javascript" src="/resources/assets/bootstrap/js/jquery.min.js"></script>
  	<script language="javascript" type="text/javascript" src="/resources/assets/bootstrap/js/custom.js"></script>
  </nav>