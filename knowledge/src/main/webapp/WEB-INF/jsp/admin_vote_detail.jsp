<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<jsp:include page="admin_layout.jsp"></jsp:include>
<!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Danh sách chi tiết</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Bảng chi tiết vote
                        </div>
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-votetype">
                                <thead>
                                    <tr>
                                    	<th align="center">STT</th>
                                        <th align="center">ID</th>
                                        <th align="center">Id bài viết</th>
                                        <th align="center">Id câu hỏi</th>
                                        <th align="center">Id câu trả lời</th>
                                        <th align="center">Id thành viên</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${voteDetails}" var="voteDetail" varStatus="id">
                                    <tr class="odd gradeX">
                                    	<td align="center"><c:out value="${id.index+1}"></c:out></td>
                                        <td align="center"><c:out value="${voteDetail.id}"></c:out></td>
                                        <td><c:out value="${voteDetail.postId}"></c:out></td>
                                        <td><c:out value="${voteDetail.questionId}"></c:out></td>
                                        <td><c:out value="${voteDetail.answerId}"></c:out></td>
                                        <td><c:out value="${voteDetail.userId}"></c:out></td>
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
    <!-- /#wrapper -->
 
    <!-- jQuery -->
<jsp:include page="admin_footer.jsp"></jsp:include>
