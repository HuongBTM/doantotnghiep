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
                    <h1 class="page-header">Danh sách chủ đề</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Bảng chủ đề
                        </div>
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-topic">
                                <thead>
                                    <tr>
                                    	<th align="center">STT</th>
                                        <th align="center">ID</th>
                                        <th align="center">Tên chủ đề</th>
                                        <th align="center">Mô tả chủ đề</th>
                                        <th align="center">Ngày tạo</th>
                                        <th align="center">Bài viết</th>
                                        <th align="center">Câu hỏi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${topicLst}" var="topic" varStatus="topicId">
                                    <tr class="odd gradeX">
                                    	<td align="right"><c:out value="${topicId.index+1}"></c:out></td>
                                        <td align="right"><c:out value="${topic.topicId}"></c:out></td>
                                        <td><a href="/admin/topic/detail/${topic.topicId}"><c:out value="${topic.topicName}"></c:out></a></td>
                                        <td><c:out value="${topic.topicDescribe}"></c:out></td>
                                        <td><c:out value="${topic.createDate}"></c:out></td>
                                        <td align="right">${fn:length(topic.posts)}</td>
                                        <td align="right">${fn:length(topic.questions)}</td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
        </div>
        </div>
        <!-- /#page-wrapper -->
 
    <!-- jQuery -->
    <jsp:include page="admin_footer.jsp"></jsp:include>