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
                <h2 class="page-header">Danh sách câu hỏi được yêu cầu trả lời</h2>
                </div>
                <!-- /.col-lg-12 -->
            </div>
			
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Bảng câu hỏi yêu cầu
                        </div>
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <c:choose>
				            <c:when test="${empty requestExpects}">
				              <p>Không có câu hỏi nào.</p>
				            </c:when>
				            <c:otherwise>
                             <table width="100%" id="dataTables-topic-post" class="table table-bordered table-striped table-hover">
				                <thead>
				                  <tr>
				                  	<th align="center">STT</th>
				                    <th align="center">ID</th>
				                    <th align="center">Tiêu đề câu hỏi</th>
				                    <th align="center">Nội dung</th>
				                    <th align="center">Ngày yêu cầu</th>
				                    <th align="center">Chi tiết câu hỏi</th>
				                    <th></th>
				                  </tr>
				                </thead>
				                <tbody>
				                  <c:forEach items="${requestExpects}" var="requestExpect" varStatus="requestId">
				                    <tr>
				                      <td align="right">${requestId.index + 1 }</td>
				                      <td align="right">${requestExpect.requestId}</td>
				                      <td>${requestExpect.question.title}</td>
				                      <td>${requestExpect.question.questionContent}</td>
				                      <td>${requestExpect.createAt}</td>
				                      <td align="center">
				                        <a href="<c:url value="/expect/question/detail/${requestExpect.question.questionId}" />" title="View question detail">
				                          <i class="fa fa-search"></i></a>
				                      </td>
				                      <td>
				                      <c:if test="${not empty requestExpect.question.answers}">
					                      <c:forEach items="${requestExpect.question.answers}" var="answer">
						                      <c:if test="${CURRENT_USER.userId eq answer.user.userId}">
						                      		<c:set var="i" value="1"></c:set>
						                      </c:if>
					                      </c:forEach>
				                      		<c:if test="${i==1}"><span class="label bg-green">Đã trả lời</span></c:if>
				                      		<c:if test="${i!=1}"><span class="label bg-red">Chưa trả lời</span></c:if>
				                      </c:if>
				                      <c:if test="${empty requestExpect.question.answers}"><span class="label bg-red">Chưa trả lời</span></c:if>
				                      </td>
				                    </tr>
				                  </c:forEach>
				                </tbody>
				              </table>
                            <!-- /.table-responsive -->
                            </c:otherwise>
			          		</c:choose>
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
    <!-- /#wrapper -->
 
<jsp:include page="admin_footer.jsp"></jsp:include>