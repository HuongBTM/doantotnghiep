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
  <script language="javascript" type="text/javascript" src="/resources/assets/js/custom.js"></script>
 
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
        <a class="navbar-brand" href="/app/home/feed">K<span>nowledge</span></a>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav navbar-left">
          <li><a href="/app/home/feed"><i class="fa fa-home"></i> Home</a><div></div></li>
          <li><a href="/app/question/all"><i class="fa fa-question-circle"></i> Câu hỏi</a><div></div></li>
          <li><a href="/app/post/all"><i class= "fa fa-file-text-o"></i> Bài viết</a></li>
          <li role="presentation" class="navbar-nav dropdown">
              <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                <i class="fa fa-bell"></i> Thông báo
                <span class="badge bg-green">2</span>
              </a>
              <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                <li>
                  <a>
                    <span class="image"><img src="/resources/assets/img/9.png" alt="Profile Image" /></span>
                    <span>
                      <span>John Smith</span>
                      <span class="time">3 mins ago</span>
                    </span>
                    <span class="message">
                      Film festivals used to be do-or-die moments for movie makers. They were where...
                    </span>
                  </a>
                </li>
                <li>
                  <div class="text-center" style="margin-left: 80px">
                    <a href="/app/user/${CURRENT_USER.userId }/notify">
                      <strong>Xem tất cả</strong>
                      <i class="fa fa-angle-right"></i>
                    </a>
                  </div>
                </li>
               </ul>
            </li>
          </ul>
       	 
       	 <ul class="nav navbar-nav navbar-right">
       	 <li>
            <form:form class="navbar-form" role="search" action="/app/search" method="Get">
            <div class="input-group">
                <input type="text" class="form-control search-input" placeholder="Tìm kiếm..." name="q">
                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit" style='border-radius: 0px; padding: 9px; width: 34px; height: 34px;'><i class="fa fa-search"></i></button>
                </div>
            </div>
            </form:form>    
       	 </li>
       	 <c:if test="${not empty CURRENT_USER }">
			<li class="dropdown">
		      <a class="dropdown-toggle btn-ask" data-toggle="dropdown" href="#"><i class= "fa fa-user"></i> ${CURRENT_USER.username} <span class="caret"></span></a>
		        <ul class="dropdown-menu">
		          <li><a href="/app/user/${CURRENT_USER.userId }/info">Profile</a></li>
		          <li><a href="/app/user/${CURRENT_USER.userId }/changeprofile">Cập nhật thông tin</a></li>
		          <li><a href="/app/user/${CURRENT_USER.userId }/bookmark">Đánh dấu</a></li>
		          <li role="separator" class="divider"></li>
                 <li><a href="/login">Đăng xuất &nbsp;<i class="fa fa-sign-out" aria-hidden="true"></i></a></li>
	        </ul>
	      </li>
	      </c:if>
	      <c:if test="${empty CURRENT_USER }"><li><a href="/login">Đăng nhập</a></li></c:if>
          <li class="btn-ask"><a href="/app/question/ask">Đặt câu hỏi</a></li>
        </ul>
      </div>
    </div>
  </nav>