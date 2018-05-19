<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp"></jsp:include>

<div class="question-container _full ">
<div id="question-content" class="snippet-hidden">

    <div class="inner-content clearfix">
        <div id="question-header">
           <h1 itemprop="name"><b>${post.postTitle}</b></h1>
		</div>
        <div id="mainbar" role="main" aria-label="question and answers">
            <div class="question-detail" data-questionid="43651814" id="question">
				<div class="post-layout">
            		<div class="postcell post-layout--right">
    					<div class="post-text" itemprop="text">
							<p>${post.postContent }</p>
    					</div>
    					<div id="tag-lst" style="width: 400px; float: left">
				              <span class="question-category">
				              	<c:forEach var="topic" items="${post.topics}">
						            <button type="button" class="btn btn-default btn-xs" style="background-color: #b4d3ea; border-color: #b4d3ea;">
						              <a href="/app/topic/${topic.topicId }/detail"><i class="fa fa-tag"></i> ${topic.topicName}</a>
						            </button>
						          </c:forEach>
				              </span>
			              </div>
    					<div class="grid mb0 fw-wrap ai-start jc-end gs8 gsy" style="clear: both">
    						<div class="grid--cell mr16" style="flex: 1 1 100px;">
								<div class="post-menu">
									<c:if test="${CURRENT_USER.userId eq post.user.userId }"><a href="/app/post/${post.postId }/edit" class="suggest-edit-post" title="revise and improve this post">Chỉnh sửa</a></c:if>
								</div>        
    						</div>
							<div class="post-signature owner grid--cell fl0">
	        					<div class="user-info ">
	    							<div class="user-action-time">
	        							Ngày đăng <span title="2017-04-27 07:54:43Z" class="relativetime">${post.creatAt }</span>
	    							</div>
	    							<div class="user-gravatar32">
								        <a href=""><div class="gravatar-wrapper-32"><img src="/resources/assets/img/${post.user.image }" alt="" width="32" height="32"></div></a>
								    </div>
								    <div class="user-details">
								        <a href="/app/user/${post.user.userId }/info">${post.user.fullname }</a>
								        <div class="-flair">
								            <span class="reputation-score" title="reputation score " dir="ltr">68</span>
								        </div>
								    </div>
								</div>
						    </div>
					   </div>
						<div class="action_bar_inner u-flex">
						<c:choose>
							<c:when test="${voteDetail.voteTypeId == 1}">
								<span id="rgptQp" style="margin-right: 10px">
									<a class="upvote icon_action_bar-button blue_icon btn btn btn-default" style="background-color: #1bc364"
											href="#?pid=${post.postId}&oid=${post.user.userId}&uid=${CURRENT_USER.userId}&action=upvote" id="upBtn">
										<div class="icon_action_bar-label">
											<span class="glyphicon glyphicon-arrow-up">Upvote |</span>
											<span id="upvote_count" class="upvote icon_action_bar-count">${post.upvotes }</span>
										</div>
									</a>
								</span>
								<span id="rgptQp" style="margin-right: 10px">
									<a class="downvote secondary_action icon_action_bar-button btn btn btn-default" disabled="disabled"
											href="#?pid=${post.postId}&oid=${post.user.userId}&uid=${CURRENT_USER.userId}&action=downvote" id="downBtn">
										<div class="icon_action_bar-label">
											<span class="glyphicon glyphicon-arrow-down">Downvote |</span>
											<span id="downvote_count" class="downvote icon_action_bar-count">${post.downvotes }</span>
										</div>
									</a>
								</span>
							</c:when>
							<c:when test="${voteDetail.voteTypeId == 2}">
								<span id="rgptQp" style="margin-right: 10px">
									<a class="upvote icon_action_bar-button blue_icon btn btn btn-default" disabled="disabled"
											href="#?pid=${post.postId}&oid=${post.user.userId}&uid=${CURRENT_USER.userId}&action=upvote" id="upBtn">
										<div class="icon_action_bar-label">
											<span class="glyphicon glyphicon-arrow-up">Upvote |</span>
											<span id="upvote_count" class="upvote icon_action_bar-count">${post.upvotes }</span>
										</div>
									</a>
								</span>
								<span id="rgptQp" style="margin-right: 10px">
									<a class="downvote secondary_action icon_action_bar-button btn btn btn-default" style="background-color: #1bc364"
											href="#?pid=${post.postId}&oid=${post.user.userId}&uid=${CURRENT_USER.userId}&action=downvote" id="downBtn">
										<div class="icon_action_bar-label">
											<span class="glyphicon glyphicon-arrow-down">Downvote |</span>
											<span id="downvote_count" class="downvote icon_action_bar-count">${post.downvotes }</span>
										</div>
									</a>
								</span>
							</c:when>
							<c:otherwise>
								<span id="rgptQp" style="margin-right: 10px">
									<a class="upvote icon_action_bar-button blue_icon btn btn btn-default" href="#?pid=${post.postId}&oid=${post.user.userId}&uid=${CURRENT_USER.userId}&action=upvote" id="upBtn">
										<div class="icon_action_bar-label">
											<span class="glyphicon glyphicon-arrow-up">Upvote |</span>
											<span id="upvote_count" class="upvote icon_action_bar-count">${post.upvotes }</span>
										</div>
									</a>
								</span>
								<span id="rgptQp" style="margin-right: 10px">
									<a class="downvote secondary_action icon_action_bar-button btn btn btn-default" href="#?pid=${post.postId}&oid=${post.user.userId}&uid=${CURRENT_USER.userId}&action=downvote" id="downBtn">
										<div class="icon_action_bar-label">
											<span class="glyphicon glyphicon-arrow-down">Downvote |</span>
											<span id="downvote_count" class="downvote icon_action_bar-count">${post.downvotes }</span>
										</div>
									</a>
								</span>
							</c:otherwise>
						</c:choose>
							<span class="question-date"><i class="fa fa-clock-o"></i> ${post.ago}</span>
				              <span class="question-comment">
				                  <i class="fa fa-comment"></i> ${fn:length(post.questions)} câu hỏi
				              </span>
				              <span class="question-view"><i class="fa fa-eye"></i> ${post.views } lượt xem</span>
				              <div class="clearfix"></div>
						</div>
					</div>
                 <div class="post-layout--right">
	    			<div id="comments-43651814" class="comments js-comments-container "></div>
					<div id="comments-link-43651814" data-rep="50" data-reg="true"></div>         
    			</div>        
    		</div>
			</div>
        	<div id="answers">

				<a name="new-answer"></a>
				<c:choose>
				<c:when test="${not empty CURRENT_USER }">
				<h3 class="space">Đặt câu hỏi về bài viết này?</h3>
	            <form:form id="post-form" action="/app/question/post/${post.postId }/ask/${CURRENT_USER.userId}" method="post" modelAttribute="question">
	            <div class="item form-group">
		            <label class="required control-label col-md-2 col-sm-1 col-xs-12" for="title" style="text-align: left">Tiêu đề <span class="required">*</span>
		            </label>
		            <div class="col-md-10 col-sm-3 col-xs-12">
		              <form:input id="title" class="form-control" name="title" placeholder="Tiêu đề..."
		              		 required="required" type="text" path="title" title="Hãy nhập tiêu đề câu hỏi"></form:input>
		            	<form:errors path="title" cssClass="error" delimiter="<br><i class='fa fa-exclamation-circle'></i> "></form:errors>
		            </div>
		          </div>
		          <div id="form-textarea" class="item form-group" style="float: left; padding-top: 10px">
		             <label class="required control-label col-md-2 col-sm-1 col-xs-12" style="text-align: left">Nội dung <span>*</span></label>
		             <div class="col-md-10 col-sm-3 col-xs-12">
	            	 <form:textarea required="required" class="form-control" id="question-details" path="questionContent" cols="50" rows="8"></form:textarea>
	                 
	                 <div style="position: relative;">
	                 	<div class="col-md-10 col-sm-3 col-xs-12">
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
                 </div>
                 <div class="form-group">
		             <div class="col-md-3 col-md-offset-2">
		               <button id="send" type="submit" class="btn btn-success">Post</button>
		               <button type="reset" class="btn btn-primary">Reset</button>
		             </div>
		           </div>
	             </form:form>
	             </c:when>
	             <c:otherwise>
	             <h3 class="space" style="color: #2d2c2c">Bạn phải <a href="/login">Đăng nhập</a> để đặt câu hỏi về bài viết này</h3>
	             </c:otherwise>
	             </c:choose>
	     	</div>
     	</div>
       	<div id="sidebar" class="show-votes" role="complementary" aria-label="sidebar">                          
			<div class="module community-bulletin widget" data-tracker="cb=1">
				<div class="sidebar-related">
                    <img class="profile-user-img img-responsive img-circle" 
               			src="<c:url value="/resources/assets/img/${post.user.image}" />" alt="User profile picture">
                    <h3 class="profile-username text-center">${post.user.fullname}</h3>
			          <h5 class="profile-username text-center">${post.user.address}</h5>
						<h5 class="profile-username text-center">
						<c:choose>
			                <c:when test="${post.user.admin}">
			                  <span class="label bg-red" style="color: red">Quản trị viên</span>
			                </c:when>
			                <c:when test="${post.user.expect}">
			                  <span class="label bg-yellow" style="color: green">Chuyên gia</span>
			                </c:when>
			                <c:otherwise>
			                  <span class="label bg-green" style="color: blue">Thành viên</span>
			                </c:otherwise>
			              </c:choose>
						</h5>
			
						<div style="background-color: #6bc7e8; text-align: center">Điểm uy tín: ${post.user.points}</div>
			
			          <ul class="list-group list-group-unbordered" style="margin-bottom: 0px; padding-top: 5px;">
			          	<c:if test="${post.user.expect }"><li class="list-group-item">
							<i class="fa fa-graduation-cap">
							<b><c:forEach items="${post.user.sectors}" var="sector">
								<c:out value="${sector.sectorName},"></c:out>
							</c:forEach></b></i>
						</li></c:if>
			             <li class="list-group-item">
			              <b>Câu hỏi</b> 
			              <span class="pull-right badge bg-blue">${fn:length(post.user.questions)}</span>
			            </li>
			            <li class="list-group-item">
			              <b>Câu trả lời</b>
			              <span class="pull-right badge bg-yellow">${fn:length(post.user.answers)}</span>
			            </li>
			            <li class="list-group-item">
			              <b>Bài viết</b> 
			              <span class="pull-right badge bg-green">${fn:length(post.user.posts)}</span>
			            </li>
			            <li class="list-group-item">
			              <b>Câu trả lời hữu ích</b> 
			              <span class="pull-right badge bg-green">${countBestAnswer}</span>
			            </li>
			           <c:if test="${not empty post.user.abouts }"><li class="list-group-item">
			              ${post.user.abouts }
			            </li></c:if>
			          </ul>
                </div>
	            <!-- thông tin -->
			</div>
         	<div class="module community-bulletin widget" data-tracker="cb=1">
				<div class="sidebar-related">
                    <h3 class="widget_title">Câu hỏi liên quan</h3>
                    <div class="related js-gps-related-questions" data-tracker="rq=1"></div>
                </div>
                <c:choose>
	                <c:when test="${empty post.questions }">
	                	<c:out value="Không có câu hỏi liên quan"></c:out>
	                </c:when>
	                <c:otherwise>
		                <c:forEach items="${post.questions}" var="question">
		                <c:if test="${question.check==1 }">
			            <li>
			                <div class="favicon favicon-writing" title="Writing Stack Exchange" style="display: inline-block;"></div>
			                <a href="/app/question/${question.questionId }/detail" class="js-gps-track" data-gps-track="site.switch({ item_type:11, target_site:166 }); posts_hot_network.click({ item_type:2, location:11 })">
			                    ${question.title }
			                </a>
			            </li>
			            </c:if>
		            	</c:forEach>
		            </c:otherwise>
	            </c:choose>
			</div>
			
         <div class="module community-bulletin" data-tracker="cb=1">
			<div class="widget widget_tag_cloud">
			  <h3 class="widget_title">Chủ đề nổi bật</h3>
			  <c:forEach var="topic" items="${topics}">
			    <a href="<c:url value="/app/topic/${topic.topicId }/detail" />">${topic.topicName }</a>
			  </c:forEach>
			</div>
         </div>
    </div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function () {

	$("#upBtn").click(function (e) {
		var upvote = parseInt($("#upvote_count").text());
		var href = $(this).attr('href');
    	var pid = getURLParameter(href, 'pid');
    	var oid = getURLParameter(href, 'oid');
    	var uid = getURLParameter(href, 'uid');
    	var action = getURLParameter(href, 'action');
		var url = "<c:url value="/app/post/vote" />";
		
		$.ajax({
			type: "GET",
      		contentType: "application/json",
      		url: url,
      		data: {pid: pid, oid: oid, uid: uid, action: action},
      		success: function (response) {
      			if(response=="success") {
	      			console.log(response);
	      			document.getElementById('upBtn').style.backgroundColor='#1bc364';
	      			document.getElementById('downBtn').setAttribute('disabled','disabled');
	      			$("#upvote_count").text(upvote+1);
      			} else {
      				console.log(response);
	      			document.getElementById('upBtn').style.backgroundColor='#fff';
	      			document.getElementById('downBtn').removeAttribute("disabled");
	      			$("#upvote_count").text(upvote-1);
      			}
      		}
		})
	});
	
	$("#downBtn").click(function (e) {
		var downvote = parseInt($("#downvote_count").text());
		var href = $(this).attr('href');
    	var pid = getURLParameter(href, 'pid');
    	var oid = getURLParameter(href, 'oid');
    	var uid = getURLParameter(href, 'uid');
    	var action = getURLParameter(href, 'action');
		var url = "<c:url value="/app/post/vote" />";
		
		$.ajax({
			type: "GET",
      		contentType: "application/json",
      		url: url,
      		data: {pid: pid, oid: oid, uid: uid, action: action},
      		success: function (response) {
      			if(response=="success") {
	      			console.log(response);
	      			document.getElementById('downBtn').style.backgroundColor='#1bc364';
	      			document.getElementById('upBtn').setAttribute('disabled','disabled');
	      			$("#downvote_count").text(downvote+1);
      			} else {
      				console.log(response);
      				document.getElementById('downBtn').style.backgroundColor='#fff';
	      			document.getElementById('upBtn').removeAttribute("disabled");
	      			$("#downvote_count").text(downvote-1);
      			}
      		}
		})
	});
	function getURLParameter(url, name) {
    	return (RegExp(name + '=' + '(.+?)(&|$)').exec(url)||[,null])[1];
  	}
});
</script>
<jsp:include page="footer.jsp"></jsp:include>