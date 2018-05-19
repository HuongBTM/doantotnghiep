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
                    <h1 class="page-header">Dashboard</h1>
                </div>
               <!--  /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-user fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${countUsers}</div>
                                    <div>Thành viên</div>
                                </div>
                            </div>
                        </div>
                        <a href="/admin/user/alluser">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-question-circle fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${countQuestions}</div>
                                    <div>Câu hỏi</div>
                                </div>
                            </div>
                        </div>
                        <a href="/admin/question/allquestion">
                            <div class="panel-footer">
                                <span class="pull-left">Xem chi tiết</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-folder-open-o fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${countPosts}</div>
                                    <div>Bài viết</div>
                                </div>
                            </div>
                        </div>
                        <a href="/admin/post/allpost">
                            <div class="panel-footer">
                                <span class="pull-left">Xem chi tiết</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tags fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${countTopics}</div>
                                    <div>Chủ đề</div>
                                </div>
                            </div>
                        </div>
                        <a href="/admin/topic/alltopic">
                            <div class="panel-footer">
                                <span class="pull-left">Xem chi tiết</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
			    <div class="col-md-8">
			      <!-- LATEST QUESTIONS -->
			      <div class="box box-info">
			        <div class="box-header with-border">
			          <h3 class="box-title">Câu hỏi mới</h3>
			        </div>
			        <!-- /.box-header -->
			        <div class="box-body">
			          <div class="table-responsive">
			            <table class="table no-margin">
			              <thead>
			                <tr>
			                  <th>Tiêu đề</th>
			                  <th>Người đăng</th>
			                </tr>
			              </thead>
			              <tbody>
			                <c:forEach var="question" items="${newQuestions}">
			                    <tr>
			                      <td><a href="<c:url value="/admin/question/detail/${question.questionId}" />">${question.title}</a></td>
			                      <td><a href="<c:url value="/admin/user/${question.user.userId}" />">${question.user.fullname}</a></td>
			                    </tr>
			                </c:forEach>
			              </tbody>
			            </table>
			          </div>
			          <!-- /.table-responsive -->
			        </div>
			        <!-- /.box-body -->
			        <div class="box-footer clearfix">
			          <a href="<c:url value="/admin/question/allquestion" />" class="btn btn-sm btn-default btn-flat pull-right">Xem chi tiết</a>
			        </div>
			        <!-- /.box-footer -->
			      </div>
			      <!-- /.box -->
			    </div>
			
			    <div class="col-md-4">
			      <!-- USERS LIST -->
			      <div class="box box-danger">
			        <div class="box-header with-border">
			          <h3 class="box-title">Thành viên mới</h3>
			        </div>
			        <!-- /.box-header -->
			        <div class="box-body no-padding">
			          <ul class="users-list clearfix">
			            <c:forEach var="user" items="${newUsers}">
			            <li style="margin-top: 15px">
			              <img src="<c:url value="/resources/assets/img/${user.image}" />" style="width: 66px; height: 66px" alt="User Image">
			              <a class="countUsers-list-name" href="<c:url value="/admin/user/${user.userId}" />">${user.fullname}</a>
			            </li>
			            </c:forEach>
			          </ul>
			          <!-- /.countUsers-list -->
			        </div>
			        <!-- /.box-body -->
			        <div class="box-footer text-center">
			          <a href="<c:url value="/admin/user/alluser" />" class="uppercase">Xem chi tiết</a>
			        </div>
			        <!-- /.box-footer -->
			      </div>
			      <!--/.box -->
			    </div>
			  </div>
           <!--  /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#right_col -->
<jsp:include page="admin_footer.jsp"></jsp:include>