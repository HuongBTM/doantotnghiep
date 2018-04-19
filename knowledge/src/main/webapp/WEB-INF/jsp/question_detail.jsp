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
	             <a name="43652564"></a>
	            	<div id="answer-43652564" class="answer accepted-answer" data-answerid="43652564" itemscope="" itemtype="http://schema.org/Answer" itemprop="acceptedAnswer">
						<div class="post-layout">
	        				<div class="votecell post-layout--left">
	            				<div class="vote">
							        <input type="hidden" name="_id_" value="43652564">
									<span><i class="fa fa-chevron-circle-up"></i>Upvote</span>
							        <span itemprop="upvoteCount" class="vote-count-post ">1</span>
									<span><i class="fa fa-chevron-circle-up"></i>Downvote</span>									
								</div>
							</div>
							<div class="answercell post-layout--right">
								<div class="post-text" itemprop="text">
									<p>The Spring Security Reference provides an <a href="/form-javaconfig.html" rel="nofollow noreferrer">extensive guide</a> on how to implement your custom login page.</p>
									
									<p>I put together a small example in <a href="/src" rel="nofollow noreferrer">this repo</a></p>
							    </div>
							    <div class="grid mb0 fw-wrap ai-start jc-end gs8 gsy">
							    	<div class="grid--cell mr16" style="flex: 1 1 100px;">
										<div class="post-menu">
											<a href="/a/43652564/8900408" title="short permalink to this answer" class="short-link" id="link-post-43652564">share</a>
											<span class="lsep">|</span>
											<a href="/edit" class="suggest-edit-post" title="revise and improve this post">edit</a>
										</div>                    
									</div>
									<div class="post-signature grid--cell fl0">
										<div class="user-info ">
											<div class="user-action-time">
										        answered <span title="2017-04-27 08:29:54Z" class="relativetime">Apr 27 '17 at 8:29</span>
											 </div>
										    <div class="user-gravatar32">
										        <a href="/p%c3%a4r-nilsson"><div class="gravatar-wrapper-32"><img src="./Answer-Stack Overflow_files/2ac03d2bcfc8383c1c953f0abf9dacb7" alt="" width="32" height="32"></div></a>
										    </div>
										    <div class="user-details">
										        <a href="/4165604/p%c3%a4r-nilsson">Pär Nilsson</a>
										        <div class="-flair">
										            <span class="reputation-score" title="reputation score " dir="ltr">847</span><span title="6 silver badges"><span class="badge2"></span><span class="badgecount">6</span></span><span title="13 bronze badges"><span class="badge3"></span><span class="badgecount">13</span></span>
										        </div>
										    </div>
										</div>
								    </div>
								</div>
							</div>
	
							<div class="post-layout--right">
							    <div id="comments-43652564" class="comments js-comments-container ">
						            <ul class="comments-list js-comments-list" data-remaining-comments-count="0" data-canpost="false" data-cansee="true" data-comments-unavailable="false" data-addlink-disabled="true">
						            	<li id="comment-74352620" class="comment js-comment " data-comment-id="74352620">
									        <div class="js-comment-actions comment-actions">
									            <div class="comment-score"></div>
				                						</div>
									        <div class="comment-text js-comment-text-and-form">
									            <div style="display: block;" class="comment-body">
									                <span class="comment-copy">Do we need to use WebSecurityConfigurerAdapter class on. Can't we use application.properties instead of WebSecurityConfigurerAdapter class?</span>
									                    –&nbsp;<a href="/kabindra-shrestha" title="68 reputation" class="comment-user owner">Kabindra Shrestha</a>
									                <span class="comment-date" dir="ltr">
										                <a class="comment-link" href="/74352620_43652564">
										                	<span title="2017-04-27 08:33:38Z" class="relativetime-clean">Apr 27 '17 at 8:33</span>
										                </a></span>
									             </div>
									        </div>
											</li>
									    <li id="comment-74354397" class="comment js-comment " data-comment-id="74354397">
									        <div class="js-comment-actions comment-actions">
									            <div class="comment-score"> </div>
								            </div>
									        <div class="comment-text js-comment-text-and-form">
									            <div style="display: block;" class="comment-body">
									                <span class="comment-copy">There is no way to accomplish this solely with <code>application.properties</code> <b>that I'm aware of</b>, I doubt there is.  And the approach that I suggested is the recommended way by the spring team.</span>
									                    –&nbsp;<a href="/p%c3%a4r-nilsson" title="847 reputation" class="comment-user">Pär Nilsson</a>
									                <span class="comment-date" dir="ltr"><a class="comment-link" href="/comment74354397_43652564"><span title="2017-04-27 09:14:36Z" class="relativetime-clean">Apr 27 '17 at 9:14</span></a></span>
									                <span class="edited-yes" title="this comment was edited 1 time"></span>
									             </div>
									        </div>
								    	</li>
				        			</ul>
				 				</div>
				
			 					<div id="comments-link-43652564" data-rep="50" data-reg="true" style="padding-left: 25px;">
			 						<button id="send" type="submit" class="btn btn-success">Comment</button>
						        	<div class="col-md-10 col-sm-3 col-xs-12">
						              <input id="title" class="form-control" name="comment" placeholder="Comment..."
						              		 required="required" type="text"/>
						            </div>
						        </div>         
							</div>    				
						</div>
					</div>
						
				<!-- <a name="48025451"></a>
				<div id="answer-48025451" class="answer" data-answerid="48025451" itemscope="" itemtype="http://schema.org/Answer">
	 				<div class="post-layout">
	 				</div>
				</div> -->
				<a name="new-answer"></a>
				<h3 class="space">Your Answer</h3>
	            <form:form id="post-form" action="/answer/submit" method="post" class="post-form">
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
	                 <div class="form-submit cbt">
	                      <input id="submit-button" class="btn btn-primary" type="submit" value="Post Your Answer" tabindex="110">
	                  </div>
	             </form:form>
	     	</div>
     	</div>
       	<div id="sidebar" class="show-votes" role="complementary" aria-label="sidebar">                          
			
         	<div class="module community-bulletin widget" data-tracker="cb=1">
				<div class="sidebar-related">
                    <h3>Thông tin người hỏi</h3>
                    <div class="related js-gps-related-questions" data-tracker="rq=1"></div>
                </div>
	            <!-- thông tin -->
			</div>
			<div class="module community-bulletin" data-tracker="cb=1">
			<div class="widget widget_tag_cloud">
			  <h3 class="widget_title">Chủ đề</h3>
			  <%-- <c:forEach var="tag" items=""> --%>
			    <a href="<c:url value="/tag/" />">Tên chủ đề</a>
			    <a href="<c:url value="/tag/" />">Java</a>
			    <a href="<c:url value="/tag/" />">Question</a>
			    <a href="<c:url value="/tag/" />">Test</a>
			    <a href="<c:url value="/tag/" />">Cuộc đua số</a>
			  <%-- </c:forEach> --%>
			</div>
         	</div>
			<div class="module community-bulletin" data-tracker="cb=1">
			<div class="widget widget_highest_points">
				<div class="sidebar-related">
                    <h3 class="widget_title">Top Point</h3>
					  <ul>
					    <%-- <c:forEach var="topUser" items=""> --%>
					    <li>
					      <div class="author-img">
					        <a href="<c:url value="/user/" />">
					          <img width="60" height="60" src="<c:url value="/upload/" />" alt="">
					        </a>
					      </div> 
					      <h6><a href="<c:url value="/user/" />">User name</a></h6>
					      <span class="comment"> point</span>
					    </li>
					    <%-- </c:forEach> --%>
					  </ul>
				</div>
			</div>
         </div>
         
    </div>
</div>
</div>
<!-- </div>
</div> -->

<jsp:include page="footer.jsp"></jsp:include>