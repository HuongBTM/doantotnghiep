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
                <h2 class="page-header"></h2>
                
                </div>
                <!-- /.col-lg-12 -->
            </div>
			
            <div class="row">
                <div class="col-lg-12" style="background-color: #f9f9f9; border: 1px solid #dedede; color: #555;">
                	<div class="form-style form-style-3" id="question-submit">
                		<h2 class="page-header">Thêm/ Sửa bài viết</h2>
				      <c:url var="action" value="/admin/post/addpost" />
				      <form:form action="${action}" method="POST" modelAttribute="post" class="form-horizontal form-label-left">
				        <form:hidden path="postId" />
				        <!-- TODO -->
				        <div class="item form-group">
				            <label class="required control-label col-md-2 col-sm-1 col-xs-12" for="title" style="text-align: left">Title <span class="required">*</span>
				            </label>
				            <div class="col-md-10 col-sm-3 col-xs-12">
				              <form:input id="title" class="form-control" name="postTitle" placeholder="Title..."
				              		 required="required" type="text" path="postTitle" title="Hãy nhập tiêu đề bài viết"></form:input>
				            	<form:errors path="postTitle" cssClass="error" delimiter="<br><i class='fa fa-exclamation-circle'></i> "></form:errors>
				            </div>
				          </div>
				          <div class="item form-group">
				            <label class="required control-label col-md-2 col-sm-1 col-xs-12" for="topics" style="text-align: left">Topics <span class="required">*</span>
				            </label>
				            <div class="col-md-10 col-sm-3 col-xs-12">
				              	<form:select required="required" class="form-control" path="topics" multiple="true" items="${topics}" itemValue="topicId" itemLabel="topicName" />
				            	<form:errors path="topics" cssClass="error" delimiter="<br><i class='fa fa-exclamation-circle'></i> "></form:errors>
				            </div>
				          </div>
				        <div id="form-textarea" class="item form-group">
				            <label class="required control-label col-md-2 col-sm-1 col-xs-12" style="text-align: left">Content <span>*</span></label>
				            <div class="col-md-10 col-sm-3 col-xs-12">
				            <form:textarea required="required" class="form-control" path="postContent" id="post-details" cols="58" rows="8" />
					            <script src="<c:url value="/resources/ckeditor/ckeditor.js" />"></script>
					            <script>
					              CKEDITOR.replace('post-details');
					            </script>
					            <c:set var="contentError"><form:errors path="postContent"/></c:set>
					            <c:if test="${not empty contentError}">
					              <span class="form-description">
					                <i class="icon-exclamation-sign"></i> 
					                <form:errors path="postContent" cssClass="field-error" />
					              </span>
					            </c:if>
					          </div>
				        </div>
				        <div class="form-group">
				             <div class="col-md-6 col-md-offset-4">
				               <button id="send" type="submit" class="btn btn-success">Public</button>
				               <button type="reset" class="btn btn-primary">Reset</button>
				               <a href="/home" class="btn btn-primary">Cancel</a>
				             </div>
				           </div>
				      </form:form>
				    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
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