<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<jsp:include page="expect_layout.jsp"></jsp:include>
<!-- page content -->
        <div class="right_col" role="main">
          <div class="">
           <div class="row">
                <div class="col-lg-12">
                <h2 class="page-header">
                	<c:choose>
				        <c:when test="${post.postId == 0}">
				          Thêm bài viết mới
				        </c:when>
				        <c:otherwise>
				          Chỉnh sửa thông tin bài viết
				        </c:otherwise>
				      </c:choose>
                </h2>
                
                </div>
                <!-- /.col-lg-12 -->
            </div>
			
            <div class="row">
                <div class="col-lg-12">
                	<div class="form-style form-style-3" id="question-submit">
				      <c:url var="action" value="/expect/post/save" />
				      <form:form action="${action}" method="POST" modelAttribute="post" class="form-horizontal form-label-left">
				        <input type="hidden" name="postId" value="${post.postId }"/>
				        <div class="item form-group">
				            <label class="required control-label col-md-2 col-sm-1 col-xs-12" for="title" style="text-align: left">Tiêu đề <span class="required">*</span>
				            </label>
				            <div class="col-md-10 col-sm-3 col-xs-12">
				              <form:input id="title" class="form-control" name="postTitle" placeholder="Tiêu đề..."
				              		 required="required" type="text" path="postTitle" title="Hãy nhập tiêu đề bài viết"></form:input>
				            	<form:errors path="postTitle" cssClass="error" delimiter="<br><i class='fa fa-exclamation-circle'></i> "></form:errors>
				            </div>
				          </div>
				          <div class="item form-group">
				            <label class="required control-label col-md-2 col-sm-1 col-xs-12" for="topics" style="text-align: left">Chủ đề <span class="required">*</span>
				            </label>
				            <div class="col-md-10 col-sm-3 col-xs-12">
				              	<form:select required="required" class="form-control" path="topics" multiple="true" items="${topics}" itemValue="topicId" itemLabel="topicName" style="height:150px;"/>
				            	<form:errors path="topics" cssClass="error" delimiter="<br><i class='fa fa-exclamation-circle'></i> "></form:errors>
				            </div>
				          </div>
				          <c:if test="${post.postId == 0}">
					          <div class="item form-group">
					            <div class="col-md-10 col-sm-3 col-xs-12">
					            	<a href="#" id="btnAddtopicEx" class="btn btn-primary btn-xs btnAddTopicEx" 
					            		style="width: 100px; height: 30px; margin-bottom: 2px; padding-top: 5px; margin-left: 180px;"><i class="fa fa-plus"></i> Thêm chủ đề </a>
					            </div>
					          </div>
				          </c:if>
				        <div id="form-textarea" class="item form-group">
				            <label class="required control-label col-md-2 col-sm-1 col-xs-12" style="text-align: left">Nội dung <span>*</span></label>
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
				               <button id="send" type="submit" class="btn btn-success">Lưu</button>
				               <button type="reset" class="btn btn-primary">Reset</button>
				               <a href="/expect/post/all" class="btn btn-primary">Hủy</a>
				             </div>
				           </div>
				      </form:form>
				    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
    </div>
    
    <!-- modal to add topic -->
    <div class="modal fade" id="modalUpdateTopicEx" topic="dialog">
	    <div class="modal-dialog">
	      <!-- Modal content no 1-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Thêm chủ đề mới</h4>
	        </div>
	        <!-- ./modal-header -->
	        <div class="modal-body">
	         <form:form id="updateTopicExForm" action="/admin/topic/savetopic" method="post" modelAttribute="topic" class="form-horizontal">
		          <div class="login-box-body">
		          	<input type="hidden" id="idHidden" name="idHidden" value="${topic.topicId}">
				    <div class="item form-group">
                        <label class="control-label col-xs-3" for="topicName">Tên chủ đề<span class="required">*</span>
                        </label>
                        <div class="col-xs-9">
                          <form:input id="topicName" class="form-control col-md-7 col-xs-12" name="topicName" placeholder="Tên chủ đề..." required="required" type="text" path="topicName"></form:input>
                        	<div class="error" hidden="hidden"></div>
                       </div>
                     </div>
                     <div class="item form-group">
                       <label class="control-label col-xs-3" for="topicDescribe">Mô tả chủ đề
                       </label>
                       <div class="col-xs-9">
                         <form:textarea id="topicDescribe" name="topicDescribe" rows="5" cols="30" placeholder="Mô tả chủ đề..." class="form-control col-md-7 col-xs-12" path="topicDescribe"></form:textarea>
                       </div>
                     </div>
		        </div>
		        <!-- /.modal-body -->
		        <div class="modal-footer">
		 			<button type="submit" class="btn btn-danger" id="btnSave">Lưu</button>
		 			<button type="button" class="btn btn-basic" data-dismiss="modal">Hủy</button>
		 		</div>
	 		</form:form>
	 		<!-- /.modal-footer -->
	      </div>
	      <!-- ./modal-content -->
	      
	    </div>
	  </div>
	</div>
<jsp:include page="admin_footer.jsp"></jsp:include>