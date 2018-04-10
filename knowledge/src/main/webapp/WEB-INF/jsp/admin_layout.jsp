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
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Knowledge - Admin</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/assets/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/assets/css/admin-sb.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="/resources/assets/metisMenu/morris.css" rel="stylesheet">

	<!-- DataTables CSS -->
    <link href="/resources/assets/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">
    
    <!-- Custom Fonts -->
    <link href="/resources/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href=""><span>Knowledge</span></a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
						</ul>
                    <!-- /.dropdown-messages -->
                </li>
                <!-- /.dropdown -->
                
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        
                        <li>
                            <a href="/admin/dashboard"><i class="fa fa-dashboard fa-fw"></i> <span>Dashboard</span></a>
                        </li>
                       
                        <li>
                        	<a href="#"><i class="fa fa-check-square-o fa-fw"></i> <span>Phê duyệt</span><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/admin/"><span>Câu hỏi mới</span></a>
                                </li>
                                <li>
                                    <a href="/admin/"><span>Bài viết mới</span></a>
                                </li>
                            </ul>
                        </li>
                       
                        <li>
                            <a href="#"><i class="fa fa-table fa-fw"></i> <span>Static Tables</span><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/admin/votetype/allvotetype"><span>Quản lý vote</span></a>
                                </li>
                                <li>
                                    <a href="/admin/role/allrole"><span>Quản lý quyền</span></a>
                                </li>
                                <li>
                                    <a href="/admin/sector/allsector"><span>Lĩnh vực - sector</span></a>
                                </li>
                                <li>
                                    <a href="/admin/pendingtag/allpendingtag"><span>Trạng thái câu hỏi</span></a>
                                </li>
                                <li>
                                    <a href="/admin/topic/alltopic"><span>Quản lý chủ đề</span></a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        <li>
                            <a href="#"><i class="fa fa-table fa-fw"></i> <span>Dynamic Tables</span><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                
                                <li>
                                    <a href="/admin/user/alluser"><span>Quản lý thành viên</span></a>
                                </li>
                                <li>
                                    <a href="/admin/question/allquestion"><span>Quản lý câu hỏi </span></span></a>
                                    <!-- <ul class="nav nav-third-level">
                                        <li>
                                            <a href="#"><span>Danh mục câu hỏi</span></a>
                                        </li>
                                        <li>
                                            <a href="#"><span>Danh mục câu trả lời</span></a>
                                        </li>
                                        <li>
                                            <a href="#"><span>Comment</span></a>
                                        </li>
                                        
                                    </ul> -->
                                    <!-- /.nav-third-level -->
                                </li>
                                <li>
                                    <a href="#"><span>Quản lý bài viết </span></a>
                                    <!-- /.nav-third-level -->
                                </li>
                                
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bell fa-fw"></i> <span>Member notification</span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="blank.html"><span>Bookmark</span></a>
                                </li>
                               	
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> <span>Thống kê</span></a>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="/home"><i class="fa fa-globe fa-fw"></i> <span>Go to website</span></a>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
    
    <!-- /#wrapper -->
    <div id="page-wrapper" style="min-height: 386px; background-color: #ecf0f5">
