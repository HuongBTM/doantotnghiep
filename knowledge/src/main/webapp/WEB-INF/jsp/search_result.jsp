<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="header.jsp"></jsp:include>

<!-- Content wrapper -->
<div class="question-container _full ">
<div id="question-content" class="snippet-hidden">

    <div class="inner-content clearfix">
        <div id="question-header">
           <h1 itemprop="name">Kết quả tìm kiếm cho "+key tìm kiếm"</h1>
		</div>
        <div id="mainbar" role="main" aria-label="question and answers">
            <!-- nav-tab-custom -->
            <div class="nav-tabs-custom">
		        <ul class="nav nav-tabs">
		          <li class="active"><a href="#questions" data-toggle="tab">Câu hỏi</a></li>
		          <li><a href="#posts" data-toggle="tab">Bài viết</a></li>
		        </ul>
		        <div class="tab-content">
		          <div class="active tab-pane" id="questions">
		            <%-- <c:forEach var="question" items="${questions}">
		              <!-- Post -->
		              <div class="post">
		                <div class="user-block">
		                  <img class="img-circle img-bordered-sm" 
		                       src="<c:url value="/resources/assets/img/${user.image}" />" alt="user image">
		                  <span class="username">
		                    <a href="<c:url value="/admin/user/${user.userId}" />">${user.fullname}</a>
		                    <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
		                  </span>
		                  <span class="description">
		                    <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${question.creatAt}" />
		                  </span>
		                </div>
		                <!-- /.user-block -->
		                <p>${question.questionContent}</p>
		                <ul class="list-inline">
		                  <li>
		                    <a href="<c:url value="/admin/question/detail/${question.questionId}" />" class="link-black text-sm">
		                      <i class="fa fa-share margin-r-5"></i> Xem chi tiết
		                    </a>
		                  </li>
		                </ul>
		              </div>
		              <!-- /.post -->
		            </c:forEach> --%>
		          </div>
		          <!-- /.tab-pane -->
		          <div class="tab-pane" id="posts">
		            <%-- <c:forEach var="post" items="${posts}">
		              <!-- Post -->
		              <div class="post">
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
		                <p>${post.postContent}</p>
		                <ul class="list-inline">
		                  <li>
		                    <a href="<c:url value="/admin/post/detail/${post.postId}" />" class="link-black text-sm">
		                      <i class="fa fa-share margin-r-5"></i> Xem chi tiết
		                    </a>
		                  </li>
		                </ul>
		              </div>
		              <!-- /.post -->
		            </c:forEach> --%>
		          </div>
		          <!-- /.tab-pane -->
		        </div>
		        <!-- /.tab-content -->
		      </div>
            
            
        	
     	</div>
     	
     	<!-- right content -->
       	<div id="sidebar" class="show-votes" role="complementary" aria-label="sidebar">  
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
					          <%-- <img width="60" height="60" src="<c:url value="/upload/" />" alt=""> --%>
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

<jsp:include page="footer.jsp"></jsp:include>