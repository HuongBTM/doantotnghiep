<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp"></jsp:include>

<!-- Content wrapper -->
<div class="container" style="width: 1175px;">
	<c:if test="${not empty success}">
	    <div class="alert alert-success alert-dismissible">
	      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
	      <i class="icon fa fa-check"></i> ${success}
	    </div>
	  </c:if>
	<div class="FeedMain HomeMain">
		<div class="grid_page">
			<div class="layout_3col_left" id="home_feed_left_col">
				<div class="row section" style='position: fixed'>
					<div class="EditableList HomeNavList NavList" id="feed_edit">
						<a href="/app/home/feed" class="nav-tabs-dropdown btn btn-block btn-default">Feed</a>
						<a href="/app/home/question" class="nav-tabs-dropdown btn btn-block btn-default">Câu hỏi mới</a>
						<a href="/app/home/post" class="nav-tabs-dropdown btn btn-block btn-default">Bài viết mới</a>
						<a href="/app/home/topic" class="nav-tabs-dropdown btn btn-block btn-success">Danh sách chủ đề</a>
					</div>
				</div>
			</div>
			<div id="home_feed_center_col">
				  <div class="grid-layout">
				<c:forEach var="topic" items="${topics}">
				<div class="grid-layout--cell user-info" style="background-color: #fff">
				<div id="expect-${topic.topicId }" style="margin: 3px;">
					<a href="/app/topic/${topic.topicId}/detail" style="color: #0d65ec">${topic.topicName}</a>
					<div class="user-location">${topic.topicDescribe }</div>
					<div class="-flair" style="color: #4a4848">
						<span class="reputation-score">Câu hỏi (${fn:length(topic.questions)})</span>
						<span class="reputation-score">Bài viết (${fn:length(topic.posts)})</span>
					</div>
				</div>
				</div>
				</c:forEach>
			</div>
			</div>
			
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>