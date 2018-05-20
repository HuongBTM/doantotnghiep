<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<jsp:include page="header.jsp"></jsp:include>
<!-- page content -->
<div class="container">
<div class="right_col" role="main" style="margin-top: 90px;">
<div class="">
<div class="row">
	<div class="col-md-3">

      <!-- Profile Image -->
      <div class="box box-primary">
        <div class="box-body box-profile">
          <img class="profile-user-img img-responsive img-circle" 
               src="<c:url value="/resources/assets/img/${user.image}" />" alt="User profile picture">

          <h3 class="profile-username text-center">${user.fullname}</h3>
          <h5 class="profile-username text-center">${user.address}</h5>
			<h5 class="profile-username text-center">
			<c:choose>
                <c:when test="${user.admin}">
                  <span class="label bg-red">Quản trị viên</span>
                </c:when>
                <c:when test="${user.expect}">
                  <span class="label bg-yellow">Chuyên gia</span>
                </c:when>
                <c:otherwise>
                  <span class="label bg-green">Thành viên</span>
                </c:otherwise>
              </c:choose>
			</h5>
			
			<div style="background-color: #6bc7e8; text-align: center">Điểm uy tín: ${user.points}</div>
			
          <ul class="list-group list-group-unbordered" style="margin-bottom: 0px; padding-top: 5px;">
          	<c:if test="${user.expect }"><li class="list-group-item">
				<i class="fa fa-graduation-cap">
				<b><c:forEach items="${user.sectors}" var="sector">
					<c:out value="${sector.sectorName},"></c:out>
				</c:forEach></b></i>
			</li></c:if>
             <li class="list-group-item">
              <b>Câu hỏi</b> 
              <span class="pull-right badge bg-blue">${fn:length(user.questions)}</span>
            </li>
            <li class="list-group-item">
              <b>Câu trả lời</b>
              <span class="pull-right badge bg-yellow">${fn:length(user.answers)}</span>
            </li>
            <li class="list-group-item">
              <b>Bài viết</b> 
              <span class="pull-right badge bg-green">${fn:length(user.posts)}</span>
            </li>
            <li class="list-group-item">
              <b>Câu trả lời hữu ích</b> 
              <span class="pull-right badge bg-green">${countBestAnswer}</span>
            </li>
           <c:if test="${not empty user.abouts }"><li class="list-group-item">
              ${user.abouts }
            </li></c:if>
          </ul>
          <c:if test="${CURRENT_USER.userId eq user.userId }">
          <div style="padding-top: 5px; text-align: center"><a href="/app/user/${user.userId}/changeprofile">
          	<i class="fa fa-pencil"></i> Cập nhật thông tin cá nhân</a></div></c:if>
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
    </div>
    <!-- /.col -->

    <div class="col-md-9">
      <div class="nav-tabs-custom">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#questions" data-toggle="tab">Câu hỏi (${fn:length(user.questions)})</a></li>
          <li><a href="#answers" data-toggle="tab">Câu trả lời (${fn:length(user.answers)})</a></li>
          <li><a href="#posts" data-toggle="tab">Bài viết (${fn:length(user.posts)})</a></li>
        </ul>
        <div class="tab-content">
          <div class="active tab-pane" id="questions">
          <c:choose>
          <c:when test="${empty questions }">
          	<c:out value="Không có câu hỏi nào."></c:out>
          </c:when>
          <c:otherwise>
            <c:forEach var="question" items="${questions}">
              <!-- Post -->
              <div class="post" style="margin-bottom: 0px; margin-left: 10px; margin-right: 10px;">
                <h4><b>${question.title }</b></h4>
                <p>${question.summary}</p>
                
                <ul class="list-inline">
                  <li>
                    <a href="<c:url value="/app/question/${question.questionId}/detail" />" class="link-black text-sm">
                      <i class="fa fa-share margin-r-5"></i> Xem chi tiết
                    </a>
                  </li>
                </ul>
                <div id="tag-lst" style="width: 400px; float: left">
		              <span class="question-category">
		              	<c:forEach var="topic" items="${question.topics}">
				            <button type="button" class="btn btn-default btn-xs" style="background-color: #b4d3ea; border-color: #b4d3ea;">
				              <a href="/app/topic/${topic.topicId }/detail"><i class="fa fa-tag"></i> ${topic.topicName}</a>
				            </button>
				          </c:forEach>
		              </span>
	              </div>
                <div id="noti" style="clear: both; padding-top: 10px;">
	              	 <span class="question-upvote"><i class="glyphicon glyphicon-arrow-up"></i> ${question.upvotes } upvote</span>
	              	 <span class="question-downvote"><i class="glyphicon glyphicon-arrow-down"></i> ${question.downvotes } downvote</span>
		              <span class="question-date"><i class="fa fa-clock-o"></i> ${question.ago}</span>
		              <span class="question-comment">
		                  <i class="fa fa-comment"></i> ${fn:length(question.answers)} câu trả lời
		              </span>
		              <span class="question-view"><i class="fa fa-eye"></i> ${question.views} lượt xem</span>
		              <span class="question-view" style="float: right"><a href="#" data-id="${question.questionId}" class="delQuestionBtn"><i class="fa fa-trash-o"></i></a></span>
		              <span class="question-view" style="float: right"><a href="/app/question/findone/${question.questionId}" data-id="${question.user.userId}" class="editQuestionBtn"><i class="fa fa-pencil"></i></a></span>
		              <div class="clearfix" style="background-color: #dedcdc;"></div>
	              </div>
              </div>
              <!-- /.post -->
            </c:forEach>
            </c:otherwise>
            </c:choose>
          </div>
          <!-- /.tab-pane -->
          <div class="tab-pane" id="answers">
          <c:choose>
          <c:when test="${empty answers }">
          	<c:out value="Không có câu trả lời nào."></c:out>
          </c:when>
          <c:otherwise>
            <c:forEach var="answer" items="${answers}">
              <!-- Post -->
              <div class="post" style="margin-bottom: 0px; margin-left: 10px; margin-right: 10px;">
                <p>${answer.answerContent}</p>
                <ul class="list-inline">
                  <li>
                    <a href="<c:url value="/app/question/${answer.question.questionId}/detail" />" class="link-black text-sm">
                      <i class="fa fa-share margin-r-5"></i> Xem chi tiết
                    </a>
                  </li>
                </ul>
                <div id="noti" style="clear: both; padding-top: 10px;">
	              	 <span class="question-upvote"><i class="glyphicon glyphicon-arrow-up"></i> ${answer.upvotes } upvote</span>
	              	 <span class="question-downvote"><i class="glyphicon glyphicon-arrow-down"></i> ${answer.downvotes } downvote</span>
		              <span class="question-date"><i class="fa fa-clock-o"></i> ${answer.ago}</span>
		              <span class="question-comment">
		                  <i class="fa fa-comment"></i> ${fn:length(answer.comments)} comment
		              </span>
		              <span class="question-view" style="float: right">
		              		<a href="#" data-id="${user.userId}" class="delAnswerBtn"><i class="fa fa-trash-o"></i></a></span>
		              <span class="question-view" style="float: right">
		              		<a href="/app/answer/findone/${answer.answerId }" data-id="${user.userId}" class="editAnswerBtn"><i class="fa fa-pencil"></i></a></span>
		              <div class="clearfix" style="background-color: #dedcdc;"></div>
	              </div>
	            </div>
              <!-- /.post -->
            </c:forEach>
            </c:otherwise>
            </c:choose>
          </div>
          <!-- /.tab-pane -->

          <div class="tab-pane" id="posts">
          <c:choose>
          <c:when test="${empty posts }">
          	<c:out value="Không có bài viết nào."></c:out>
          </c:when>
          <c:otherwise>
            <c:forEach var="post" items="${posts}">
              <!-- Post -->
              <div class="post" style="margin-bottom: 0px; margin-left: 10px; margin-right: 10px;">
                <div class="user-block">
                  <img class="img-circle img-bordered-sm" 
                       src="<c:url value="/resources/assets/img/${post.user.image}" />" alt="user image">
                  <span class="username">
                    <a href="#">${post.user.fullname}</a>
                    <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                  </span>
                  <span class="description">
                    <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${post.creatAt}" />
                  </span>
                </div>
                <!-- /.user-block -->
                <p>${post.summary}</p>
                <ul class="list-inline">
                  <li>
                    <a href="<c:url value="/admin/post/detail/${post.postId}" />" class="link-black text-sm">
                      <i class="fa fa-share margin-r-5"></i> Xem chi tiết
                    </a>
                  </li>
                </ul>
                <div id="noti" style="clear: both; padding-top: 10px;">
	              	 <span class="question-upvote"><i class="glyphicon glyphicon-arrow-up"></i> ${post.upvotes } upvote</span>
	              	 <span class="question-downvote"><i class="glyphicon glyphicon-arrow-down"></i> ${post.downvotes } downvote</span>
		              <span class="question-date"><i class="fa fa-clock-o"></i> ${post.ago}</span>
		              <span class="question-comment">
		                  <i class="fa fa-comment"></i> ${fn:length(post.questions)} câu hỏi
		              </span>
		              <span class="question-view" style="float: right"><a href="#" data-id="${post.postId}" class="delPostBtn"><i class="fa fa-trash-o"></i></a></span>
		              <span class="question-view" style="float: right"><a href="#" data-id="${post.postId}" class="editPostBtn"><i class="fa fa-pencil"></i></a></span>
		              <div class="clearfix" style="background-color: #dedcdc;"></div>
	              </div>
              </div>
              <!-- /.post -->
            </c:forEach>
            </c:otherwise>
            </c:choose>
          </div>
          <!-- /.tab-pane -->
        </div>
        <!-- /.tab-content -->
      </div>
      <!-- /.nav-tabs-custom -->
    </div>
    <!-- /.col -->
  </div>
  
  </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="modalUpdateQuestionInfo" topic="dialog">
    <div class="modal-dialog">
      <!-- Modal content no 1-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Chỉnh sửa câu hỏi</h4>
        </div>
        <!-- ./modal-header -->
        <div class="modal-body">
         <form:form id="updateQuestionInfoForm" action="/app/question/savequestion" method="post" modelAttribute="question" class="form-horizontal">
	          <div class="login-box-body">
			    <input type="hidden" id="idHidden" name="idHidden" value="${question.questionId}">
			    <input type="hidden" id="idUserHidden" name="idUserHidden" value="${question.questionId}">
                  <div class="item form-group">
		            <label class="required control-label col-md-2 col-sm-1 col-xs-12" for="title" style="text-align: left">Tiêu đề <span class="required">*</span>
		            </label>
		            <div class="col-md-10 col-sm-3 col-xs-12">
		              <form:input id="title" class="form-control" name="title" placeholder="Tiêu đề..."
		              		 required="required" type="text" path="title" title="Hãy nhập tiêu đề câu hỏi"></form:input>
		            	<form:errors path="title" cssClass="error" delimiter="<br><i class='fa fa-exclamation-circle'></i> "></form:errors>
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
 	 	
 <div class="modal fade" id="modalUpdateAnswerInfo" topic="dialog">
    <div class="modal-dialog">
      <!-- Modal content no 1-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Chỉnh sửa câu trả lời</h4>
        </div>
        <!-- ./modal-header -->
        <div class="modal-body">
         <form:form id="updateAnswerInfoForm" action="/app/answer/saveanswer" method="post" modelAttribute="answer" class="form-horizontal">
	          <div class="login-box-body">
			    <input type="hidden" id="idAnswerHidden" name="idAnswerHidden" value="${answer.answerId}">
			    <input type="hidden" id="idUserAnswerHidden" name="idUserHidden" value="${answer.answerId}">
		        <div id="form-textarea" class="item form-group">
		            <label class="required control-label col-md-2 col-sm-1 col-xs-12" style="text-align: left">Nội dung <span>*</span></label>
		            <div class="col-md-10 col-sm-3 col-xs-12">
		            <form:textarea required="required" class="form-control" path="answerContent" id="answerContent" cols="58" rows="8" />
			            <script src="<c:url value="/resources/ckeditor/ckeditor.js" />"></script>
			            <script>
			              CKEDITOR.replace('answerContent');
			            </script>
			            <c:set var="contentError"><form:errors path="answerContent"/></c:set>
			            <c:if test="${not empty contentError}">
			              <span class="form-description">
			                <i class="icon-exclamation-sign"></i> 
			                <form:errors path="answerContent" cssClass="field-error" />
			              </span>
			            </c:if>
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
 
<div class="modal fade" id="delQuestionModal" topic="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Xóa câu hỏi</h4>
	        </div>
	        <div class="modal-body">
	        	<input type="hidden" id="idQuestionHidden" name="idQuestionHidden" value="0">
	          <p>Bạn chắc chắn xóa câu hỏi này?</p>
	        </div>
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-danger" id="delQuestionBtn"> Xóa </button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
<div class="modal fade" id="delAnswerModal" topic="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Xóa câu trả lời</h4>
	        </div>
	        <div class="modal-body">
	        	<input type="hidden" id="idAnswerHidden" name="idAnswerHidden" value="0">
	          <p>Bạn chắc chắn xóa câu trả lời này?</p>
	        </div>
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-danger" id="delAnswerBtn"> Xóa </button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
<jsp:include page="footer.jsp"></jsp:include>