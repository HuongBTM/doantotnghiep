<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<jsp:include page="admin_layout.jsp"></jsp:include>
<!-- page content -->
        <div class="right_col" role="main">
          <div class="">
           <div class="row">
                <div class="col-lg-12">
                <h2 class="page-header">
                	<c:choose>
				        <c:when test="${question.questionId == 0}">
				          Thêm câu hỏi mới
				        </c:when>
				        <c:otherwise>
				          Chỉnh sửa thông tin câu hỏi
				        </c:otherwise>
				      </c:choose>
                </h2>
                
                </div>
                <!-- /.col-lg-12 -->
            </div>
			
            <div class="row">
                <div class="col-lg-12"> <!-- style="background-color: #f9f9f9; border: 1px solid #dedede; color: #555;" -->
                	<div class="form-style form-style-3" id="question-submit">
				      <c:url var="action" value="/admin/question/savequestion" />
				      <form:form action="${action}" method="POST" modelAttribute="question" class="form-horizontal form-label-left">
				        <input type="hidden" name="questionId" value="${question.questionId }"/>
				        <div class="item form-group">
				            <label class="required control-label col-md-2 col-sm-1 col-xs-12" for="title" style="text-align: left">Tiêu đề <span class="required">*</span>
				            </label>
				            <div class="col-md-10 col-sm-3 col-xs-12">
				              <form:input id="title" class="form-control" name="title" placeholder="Tiêu đề..."
				              		 required="required" type="text" path="title" title="Hãy nhập tiêu đề câu hỏi"></form:input>
				            	<form:errors path="title" cssClass="error" delimiter="<br><i class='fa fa-exclamation-circle'></i> "></form:errors>
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
				        
				        <div id="form-textarea" class="item form-group">
				            <label class="required control-label col-md-2 col-sm-1 col-xs-12" style="text-align: left">Nội dung <span>*</span></label>
				            <div class="col-md-10 col-sm-3 col-xs-12">
				            <form:textarea required="required" class="form-control" path="questionContent" id="question-details" cols="58" rows="8" />
					            <script src="<c:url value="/resources/ckeditor/ckeditor.js" />"></script>
					            <script>
					              CKEDITOR.replace('question-details');
					            </script>
					            <c:set var="contentError"><form:errors path="questionContent"/></c:set>
					            <c:if test="${not empty contentError}">
					              <span class="form-description">
					                <i class="icon-exclamation-sign"></i> 
					                <form:errors path="questionContent" cssClass="field-error" />
					              </span>
					            </c:if>
					          </div>
				        </div>
				        <div class="form-group">
				             <div class="col-md-6 col-md-offset-4">
				               <button id="send" type="submit" class="btn btn-success">Post</button>
				               <button type="reset" class="btn btn-primary">Reset</button>
				               <a href="/admin/question/allquestion" class="btn btn-primary">Cancel</a>
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
<jsp:include page="admin_footer.jsp"></jsp:include>