<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Knowledge | Admin</title>

    <!-- Bootstrap -->
    <link href="/resources/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/resources/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="/resources/assets/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">
    
    <!-- jQuery custom content scroller -->
    <link href="/resources/assets/css/jquery.mCustomScrollbar.min.css" rel="stylesheet"/>

    <!-- Custom Theme Style -->
    <link href="/resources/assets/css/admin.custom.min.css" rel="stylesheet">
    <link href="/resources/assets/css/admin-sb.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col menu_fixed">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>Knowledge Base!</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="/resources/assets/img/${CURRENT_USER.image}" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Xin chào,</span>
                <h2>${CURRENT_USER.username}</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                  <li><a href="/admin/dashboard"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                    
                    </li>
                  <li><a><i class="fa fa-check-square-o fa-fw"></i> Phê duyệt <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
					  <li><a href="/admin/pendingtag/allpendingtag">Danh mục trạng thái</a></li>
                     <!--  <li><a href="/admin/post/new">Bài viết mới</a></li> -->
                      <li><a href="/admin/question/new">Câu hỏi mới</a></li>
                     </ul>
                  </li>
                  <li><a><i class="fa fa-group"></i> Quản lý thành viên <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/admin/role/allrole">Danh mục quyền người dùng</a></li>
                      <li><a href="/admin/user/alluser">Danh sách thành viên</a></li>
                      <li><a href="/admin/user/adduser">Thêm thành viên mới</a></li>
                      <li><a href="/admin/user/print">In danh sách thành viên</a></li>
                      </ul>
                  </li>
                  <li><a><i class="fa fa-file-text-o"></i> Quản lý bài viết <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/admin/topic/alltopic">Danh mục chủ đề</a></li>
                      <li><a href="/admin/post/allpost">Danh sách bài viết</a></li>
                      <li><a href="/admin/post/addpost">Thêm bài viết mới</a></li>
                      <li><a href="/admin/post/print">In danh sách bài viết</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-question-circle"></i> Quản lý câu hỏi <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/admin/question/allquestion">Danh sách câu hỏi</a></li>
                      <li><a href="/admin/question/addquestion">Thêm câu hỏi mới</a></li>
                      <li><a href="/admin/question/print">In danh sách câu hỏi</a></li>
                    </ul>
                  </li>
				  <li><a><i class="fa fa-comments"></i> Quản lý câu trả lời <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/admin/answer/allanswer">Danh sách câu trả lời</a></li>
                      <li><a href="/admin/answer/print">In danh sách câu trả lời</a></li>
                    </ul>
                  </li>
				  <li><a href="/admin/sector/allsector"><i class="fa fa-reorder"></i> Quản lý lĩnh vực </a>
                   </li>
				   <li><a href="/admin/votetype/allvotetype"><i class="fa fa-cogs"></i> Quản lý vote </a>
                   </li>
                </ul>
              </div>
              <div class="menu_section">
                <h3>Giao diện</h3>
                <ul class="nav side-menu">
                  <li><a href="/app/home/feed"><i class="fa fa-bug"></i> Giao diện ứng dụng </a></li>
                  <li><a href="#"><i class="fa fa-bug"></i> Giao diện chuyên gia </a></li>
                  <li><a href="javascript:void(0)"><i class="fa fa-laptop"></i> Thống kê <span class="label label-success pull-right">Coming Soon</span></a></li>
                </ul>
              </div>

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="/login">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="/resources/assets/img/${CURRENT_USER.image}" alt=""> ${CURRENT_USER.username}
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="/admin/user/${CURRENT_USER.userId}/profile">Profile</a></li>
                    <li><a href="/admin/user/${CURRENT_USER.userId}/changeprofile">Cài đặt</a></li>
                    <li><a href="javascript:;">Trợ giúp</a></li>
                    <li><a href="/login"><i class="fa fa-sign-out pull-right"></i>Đăng xuất</a></li>
                  </ul>
                </li>

                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
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
                      <div class="text-center">
                        <a>
                          <strong>Xem tất cả</strong>
                          <i class="fa fa-angle-right"></i>
                        </a>
                      </div>
                    </li>
                   </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->
		