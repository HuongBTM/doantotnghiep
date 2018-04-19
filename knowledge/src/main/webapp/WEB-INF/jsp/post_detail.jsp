<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp"></jsp:include>

<!-- Content wrapper -->
<!-- <div class="container">
<div class="QuestionMain NewGridQuestionPage"> -->

<div class="question-container _full ">
<div id="question-content" class="snippet-hidden">

    <div class="inner-content clearfix">
        <div id="question-header">
           <h1 itemprop="name">
           	<a href="#" class="question-hyperlink">How to use spring boot security for custom login page without configuration?</a></h1>
            <div class="pl8 aside-cta" role="navigation" aria-label="ask new question">
        		<a href="/questions/ask" class="ws-nowrap btn">Ask Question</a>
			</div>
		</div>
        <div id="mainbar" role="main" aria-label="question and answers">
            <div class="question-detail" data-questionid="43651814" id="question">
				<div class="post-layout">
            		<div class="postcell post-layout--right">
    					<div class="post-text" itemprop="text">
							<p>I am using spring security on spring boot app and I cannot use the custom login page I made. 
							I want to use custom login page by default without using configuration controller, instead I want to change configuration from application.properties.
							 Also I want to deny access to other pages until login successful. Please help me to log out of the application.</p>
    					</div>
    					<div class="post-taglist">
        					<a href="/questions/tagged/java" class="post-tag js-gps-track" title="" rel="tag">java</a> 
        					<a href="/questions/tagged/session" class="post-tag js-gps-track" title="" rel="tag">session</a>
        					 <a href="/questions/tagged/spring-boot" class="post-tag js-gps-track" title="" rel="tag">spring-boot</a> 
        					 <a href="/tagged/spring-security" class="post-tag js-gps-track" title="" rel="tag">spring-security</a> 
    					</div>
    					<div class="grid mb0 fw-wrap ai-start jc-end gs8 gsy">
    						<div class="grid--cell mr16" style="flex: 1 1 100px;">
								<div class="post-menu">
									<a href="m/q/43651814/8900408" title="short permalink to this question" class="short-link" id="link-post-43651814">share</a>
									<span class="lsep">|</span>
									<a href="/posts/43651814/edit" class="suggest-edit-post" title="revise and improve this post">edit</a>
								</div>        
    						</div>
							<div class="post-signature owner grid--cell fl0">
	        					<div class="user-info ">
	    							<div class="user-action-time">
	        							asked <span title="2017-04-27 07:54:43Z" class="relativetime">Apr 27 '17 at 7:54</span>
	    							</div>
	    							<div class="user-gravatar32">
								        <a href="/kabindra-shrestha"><div class="gravatar-wrapper-32"><img src="./Answer-Stack Overflow_files/photo.jpg" alt="" width="32" height="32"></div></a>
								    </div>
								    <div class="user-details">
								        <a href="/kabindra-shrestha">Kabindra Shrestha</a>
								        <div class="-flair">
								            <span class="reputation-score" title="reputation score " dir="ltr">68</span>
								            <span title="3 silver badges">
									            <span class="badge2"></span>
									            <span class="badgecount">3</span>
								            </span>
								            <span title="9 bronze badges">
								            	<span class="badge3"></span>
								            	<span class="badgecount">9</span>
								            </span>
								        </div>
								    </div>
								</div>
						    </div>
					   </div>
						<div class="action_bar_inner u-flex">
							<span id="rgptQp" style="margin-right: 10px">
								<a class="icon_action_bar-button blue_icon btn btn btn-default" href="#" onClick="AnswerUpvote" target="{"aid": 80102891, "type": "answer"}" id="upBtn">
									<div class="icon_action_bar-label">
										<span class="glyphicon glyphicon-arrow-up">Upvote |</span>
										<span class="icon_action_bar-count">0</span>
									</div>
								</a>
							</span>
							<span id="rgptQp" style="margin-right: 10px">
								<a class="secondary_action icon_action_bar-button btn btn btn-default" href="#" onClick="AnswerDownvote" target="{"aid": 80102891, "type": "answer"}" id="upBtn">
									<div class="icon_action_bar-label">
										<span class="glyphicon glyphicon-arrow-down">Downvote |</span>
										<span class="icon_action_bar-count">0</span>
									</div>
								</a>
							</span>
							<span class="question-date"><i class="fa fa-clock-o"></i> 3 phút trước</span>
				              <span class="question-comment">
				                <a href="<c:url value="/question/detail/" />">
				                  <i class="fa fa-comment"></i> 8 answers
				                </a>
				              </span>
				              <span class="question-view"><i class="fa fa-eye"></i> 9 views</span>
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
				<a name="tab-top"></a>
	             <div id="answers-header">
	                 <div class="subheader answers-subheader">
	                     <h2 data-answercount="3" style="line-height: 20px;">
	                        3 Answers
	                        <span style="display:none;" itemprop="answerCount">3</span>
	                     </h2>
	                     <div>
	                         <div id="tabs">
	     						<a href="/oldest" data-nav-xhref="" title="Answers in the order they were provided" data-value="oldest" data-shortcut="O">
				            oldest</a>
				        <a class="youarehere" href="/tab-top" data-nav-xhref="" title="Answers with the highest score first" data-value="votes" data-shortcut="V">
				            votes</a>
				    </div>
	                     </div>
	                 </div>
	             </div>
	             
						

				<a name="new-answer"></a>
				<h3 class="space">Đặt câu hỏi về bài viết này?</h3>
	            <form:form id="post-form" action="/answer/submit" method="post" class="post-form">
	            <div class="item form-group">
		            <label class="required control-label col-md-2 col-sm-1 col-xs-12" for="title" style="text-align: left">Tiêu đề <span class="required">*</span>
		            </label>
		            <div class="col-md-10 col-sm-3 col-xs-12">
		              <input id="title" class="form-control" name="title" placeholder="Tiêu đề..."
		              		 required="required" type="text" path="title" title="Hãy nhập tiêu đề câu hỏi">
		            	<%-- <form:errors path="title" cssClass="error" delimiter="<br><i class='fa fa-exclamation-circle'></i> "></form:errors> --%>
		            </div>
		          </div>
		          <div id="form-textarea" class="item form-group" style="float: left; padding-top: 10px">
		             <label class="required control-label col-md-2 col-sm-1 col-xs-12" style="text-align: left">Nội dung <span>*</span></label>
		             <div class="col-md-10 col-sm-3 col-xs-12">
	            	 <textarea required="required" class="form-control" id="question-details" cols="50" rows="8"></textarea>
	                 <input type="hidden" id="post-id" value="43651814">
	                 <input type="hidden" id="qualityBanWarningShown" name="qualityBanWarningShown" value="false">
	                 <input type="hidden" name="referrer" value="https://www.google.com.vn/">
	                 
	                 <div style="position: relative;">
	                 	<div class="col-md-10 col-sm-3 col-xs-12">
				            <script src="<c:url value="/resources/ckeditor/ckeditor.js" />"></script>
				            <script>
				              CKEDITOR.replace('question-details');
				            </script>
				            <c:set var="contentError"><%-- <form:errors path="questionContent"/ --%></c:set>
				            <c:if test="${not empty contentError}">
				              <span class="form-description">
				                <i class="icon-exclamation-sign"></i> 
				                <%-- <form:errors path="questionContent" cssClass="field-error" /> --%>
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
	     	</div>
     	</div>
       	<div id="sidebar" class="show-votes" role="complementary" aria-label="sidebar">                          
			<div class="module community-bulletin widget" data-tracker="cb=1">
				<div class="sidebar-related">
                    <h3>Thông tin chuyên gia hỏi</h3>
                    <div class="related js-gps-related-questions" data-tracker="rq=1"></div>
                </div>
	            <!-- thông tin -->
			</div>
         	<div class="module community-bulletin widget" data-tracker="cb=1">
				<div class="sidebar-related">
                    <h3 class="widget_title">Câu hỏi liên quan</h3>
                    <div class="related js-gps-related-questions" data-tracker="rq=1"></div>
                </div>
	            <li>
	                <div class="favicon favicon-writing" title="Writing Stack Exchange" style="display: inline-block;"></div>
	                <a href="#" class="js-gps-track" data-gps-track="site.switch({ item_type:11, target_site:166 }); posts_hot_network.click({ item_type:2, location:11 })">
	                    How to prevent seeming like a Marty Stu-ish villain is cheating?
	                </a>
	
	            </li>
	            <li>
	                <div class="favicon favicon-writing" title="Writing Stack Exchange" style="display: inline-block;"></div>
	                <a href="#" class="js-gps-track" data-gps-track="site.switch({ item_type:11, target_site:166 }); posts_hot_network.click({ item_type:2, location:11 })">
	                    How to prevent seeming like a Marty Stu-ish villain is cheating? question 2
	                </a>
	
	            </li>
			</div>
			
         <div class="module community-bulletin" data-tracker="cb=1">
			<div class="widget widget_tag_cloud">
			  <h3 class="widget_title">Tags</h3>
			  <%-- <c:forEach var="tag" items=""> --%>
			    <a href="<c:url value="/tag/" />">Tên chủ đề</a>
			    <a href="<c:url value="/tag/" />">Java</a>
			    <a href="<c:url value="/tag/" />">Question</a>
			    <a href="<c:url value="/tag/" />">Test</a>
			    <a href="<c:url value="/tag/" />">Cuộc đua số</a>
			  <%-- </c:forEach> --%>
			</div>
         </div>
    </div>
</div>
</div>
<!-- </div>
</div> -->

<jsp:include page="footer.jsp"></jsp:include>