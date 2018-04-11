<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<jsp:include page="admin_layout.jsp"></jsp:include>

           <div class="row">
                <div class="col-lg-12">
                <h5 class="page-header"></h5>
                </div>
                <!-- /.col-lg-12 -->
            </div>
			<div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header">Post Manager</h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Posts
                        </div>
                        <c:if test="${not empty success}">
						    <div class="alert alert-success alert-dismissible">
						      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
						      <i class="icon fa fa-check"></i> ${success}
						    </div>
						  </c:if>
						
						  <c:if test="${not empty error}">
						    <div class="alert alert-danger alert-dismissible">
						      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
						      <i class="icon fa fa-exclamation-triangle"></i> ${error}
						    </div>
						  </c:if>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                         <div style="padding-left: 20px;">
                        	<a href="/admin/post/addpost" id="btnAddPost" class="btn btn-primary btn-xs addBtn" style="width: 100px; height: 30px; margin-bottom: 10px; padding-top: 5px;"><i class="fa fa-plus"></i> Add post 
                        	</a>
                        </div>
                        <c:choose>
				            <c:when test="${empty posts}">
				              <p>No post.</p>
				            </c:when>
				            <c:otherwise>
                             <table width="100%" id="dataTables-topic-post" class="table table-bordered table-striped table-hover">
				                <thead>
				                  <tr>
				                    <th>ID</th>
				                    <th>Title</th>
				                    <th>User</th>
				                    <th>Views</th>
				                    <th>Votes</th>
				                    <th>Questions</th>
				                    <th>Detail</th>
				                    <th></th>
				                  </tr>
				                </thead>
				                <tbody>
				                  <c:forEach items="${posts}" var="post" >
				                    <tr>
				                      <td align="right">${post.postId}</td>
				                      <td>${post.postTitle}</td>
				                      <td align="center">
				                        <img class="img-circle img-sm" src="<c:url value="/resources/assets/img/${post.user.image}" />"
				                          alt="User Image" title="${post.user.fullname}" />
				                      </td>
				                      <td align="right">${post.views}</td>
				                      <td align="right">${post.upvotes}</td>
				                      <td align="right">${fn:length(post.questions)}</td>
				                      <td align="center">
				                        <a href="<c:url value="/admin/post/detail/${post.postId}" />" title="View post detail">
				                          <i class="fa fa-search"></i></a>
				                      </td>
				                      <td align="center">
				                      	<a href="/admin/post/edit/${user.userId}" id="editPost" data-id="${post.postId}" class="btn btn-info btn-xs ePostBtn"><i class="fa fa-pencil"></i> Edit </a>
				                        <a href="#" class="btn btn-danger btn-xs deletePost" id="deletePost" data-id="${topic.topicId}">
				                          <i class="fa fa-trash"></i></a>
				                      </td>
				                    </tr>
				                  </c:forEach>
				                </tbody>
				              </table>
                            <!-- /.table-responsive -->
                            </c:otherwise>
			          		</c:choose>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
			
    <!-- /#wrapper -->
 
 	<!-- modal to delete post -->
	  	<div class="modal fade" id="delPostTopicModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Delete question</h4>
	        </div>
	        <div class="modal-body">
	        	<input type="hidden" id="idHidden" name="idHidden" value="0">
	          <p>Bạn chắc chắn xóa bản ghi này?</p>
	        </div>
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-danger" id="delPostTopicBtn"> Delete </button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
 	
    <!-- jQuery -->
    <script src="/resources/assets/bootstrap/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/assets/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/assets/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="/resources/assets/metisMenu/raphael.min.js"></script>
    <script src="/resources/assets/metisMenu/morris.min.js"></script>
    <script src="/resources/assets/metisMenu/morris-data.js"></script>

   <!--  DataTables JavaScript -->
    <script src="/resources/assets/bootstrap/js/jquery.dataTables.min.js"></script>
    <script src="/resources/assets/bootstrap/js/dataTables.bootstrap.min.js"></script> 
    
    <!-- Custom Theme JavaScript -->
    <script src="/resources/assets/js/admin-sb.js"></script>
	<script src="/resources/assets/js/admin-modal.js"></script>
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->

</body>

</html>