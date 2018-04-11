<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp"></jsp:include>

<!-- Content wrapper -->
<div class="container">

<div class="main-content page-content ask-question" style="margin-top: 90px; margin-left: 90px; width: 800px;">
    <h2 class="page-header">Đặt câu hỏi</h2></div>

    <div class="form-style form-style-3" id="question-submit">
      <c:url var="action" value="/question/ask" />
      <form:form action="${action}" method="POST" modelAttribute="question" class="form-horizontal form-label-left">
        <form:hidden path="questionId" />
        <div class="item form-group">
            <label class="required control-label col-md-2 col-sm-1 col-xs-12" for="title" style="text-align: left">Title <span class="required">*</span>
            </label>
            <div class="col-md-10 col-sm-3 col-xs-12">
              <form:input id="title" class="form-control" name="title" placeholder="Title..."
              		 required="required" type="text" path="title" title="Hãy nhập tiêu đề câu hỏi"></form:input>
            	<form:errors path="title" cssClass="error" delimiter="<br><i class='fa fa-exclamation-circle'></i> "></form:errors>
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
        <%-- <div class="form-inputs clearfix">
          <p>
            <label class="required">Title<span>*</span></label>
            <form:input path="title" id="question-title" />
            <c:set var="titleError"><form:errors path="title"/></c:set>
            <c:if test="${not empty titleError}">
              <span class="form-description">
                <i class="icon-exclamation-sign"></i> 
                <form:errors path="title" cssClass="field-error" />
              </span>
            </c:if>
          </p>
          <p>
            <label class="required">Topic<span>*</span></label>
            <span class="styled-select">
              <form:select path="topics" multiple="true" items="${topics}" itemValue="topicId" itemLabel="topicName" />
            </span>
            <c:set var="topicsError"><form:errors path="topics"/></c:set>
            <c:if test="${not empty topicsError}">
              <span class="form-description">
                <i class="icon-exclamation-sign"></i> 
                <form:errors path="topics" cssClass="field-error" />
              </span>
            </c:if>
          </p>
        </div> --%>

        <div id="form-textarea" class="item form-group">
            <label class="required control-label col-md-2 col-sm-1 col-xs-12" style="text-align: left">Content <span>*</span></label>
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
               <a href="/home" class="btn btn-primary">Cancel</a>
             </div>
           </div>
      </form:form>
    </div>
  </div>
</div>
</body>
</html>  