<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<jsp:include page="admin_layout.jsp"></jsp:include>

        <div id="page-wrapper" style="min-height: 386px;">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Topic: chủ đề
                        </div>
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <div style="padding-left: 20px;">
                        	<a href="/admin/topic/addtopic" id="btnAddtopic" class="btn btn-primary btn-xs btnAddTopic" style="width: 100px; height: 30px; margin-bottom: 10px; padding-top: 5px;"><i class="fa fa-plus"></i> Add 
                        	</a>
                        </div>
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-topic">
                                <thead>
                                    <tr>
                                    	<th align="center">STT</th>
                                        <th align="center">ID</th>
                                        <th align="center">Tên chủ đề</th>
                                        <th align="center">Mô tả chủ đề</th>
                                        <th align="center">Ngày tạo</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${lsttopic}" var="topic" varStatus="topicId">
                                    <tr class="odd gradeX">
                                    	<td align="right"><c:out value="${topicId.index+1}"></c:out></td>
                                        <td align="right"><c:out value="${topic.topicId}"></c:out></td>
                                        <td><c:out value="${topic.topicName}"></c:out></td>
                                        <td><c:out value="${topic.topicDescribe}"></c:out></td>
                                        <td><c:out value="${topic.createDate}"></c:out></td>
                                        <td align="center">
				                            <a href="/admin/topic/findone/${topic.topicId}" data-id="${topic.topicId}" class="btn btn-info btn-xs etopicBtn"><i class="fa fa-pencil"></i> Edit </a>
				                            <a href="#" data-id="${topic.topicId}" id="deletetopicBtn" class="btn btn-danger btn-xs deletetopicBtn"><i class="fa fa-trash-o"></i> Delete </a>
				                          </td>
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
        <!-- /#page-wrapper -->

	<!-- datamodal -->
		<div class="modal fade" id="modalUpdateTopic" topic="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content no 1-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">Vote type</h4>
		        </div>
		        <!-- ./modal-header -->
		        <div class="modal-body">
		         <form:form id="updateTopicForm" action="/admin/topic/savetopic" method="post" modelAttribute="topic" class="form-horizontal">
			          <div class="login-box-body">
					    <input type="hidden" id="idHidden" name="idHidden" value="${topic.topicId}">
					    <div class="item form-group">
	                        <label class="control-label col-xs-3" for="topicName">Tên chủ đề<span class="required">*</span>
	                        </label>
	                        <div class="col-xs-9">
	                          <form:input id="topicName" class="form-control col-md-7 col-xs-12" name="topicName" placeholder="Tên chủ đề..." required="required" type="text" path="topicName"></form:input>
	                        	<div class="error" hidden="hidden"></div>
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-xs-3" for="topicDescribe">Mô tả chủ đề
                        </label>
                        <div class="col-xs-9">
                          <form:textarea id="topicDescribe" name="topicDescribe" rows="5" cols="30" placeholder="Mô tả chủ đề..." class="form-control col-md-7 col-xs-12" path="topicDescribe"></form:textarea>
                        </div>
                      </div>
			        </div>
			        <!-- /.modal-body -->
			        <div class="modal-footer">
			 			<button type="submit" class="btn btn-danger" id="btnSave">Save</button>
			 			<button type="button" class="btn btn-basic" data-dismiss="modal">Cancel</button>
			 		</div>
		 		</form:form>
		 		<!-- /.modal-footer -->
		      </div>
		      <!-- ./modal-content -->
		      
		    </div>
	  	</div>
	  	</div>
		<!-- modal to delete -->
	  	<div class="modal fade" id="delTopicModal" topic="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Delete topic</h4>
	        </div>
	        <div class="modal-body">
	        	<input type="hidden" id="idHidden" name="idHidden" value="0">
	          <p>Bạn chắc chắn xóa chủ đề này?</p>
	        </div>
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-danger" id="delTopicBtn"> Delete </button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
    <!-- /#wrapper -->
 
    <!-- jQuery -->
    <script src="/resources/assets/bootstrap/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/assets/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/assets/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="/resources/assets/metisMenu/raphael.min.js"></script>
    <script src="/resources/assets/metisMenu/morris.min.js"></script>
    <script src="/resources/assets/metisMenu/morris-data.js"></script>

   <!--  DataTables JavaScript -->
    <script src="/resources/assets/bootstrap/js/jquery.dataTables.min.js"></script>
    <script src="/resources/assets/bootstrap/js/dataTables.bootstrap.min.js"></script> 
    
    <!-- Custom Theme JavaScript -->
    <script src="/resources/assets/js/admin-sb.js"></script>
    <script src="/resources/assets/js/admin-modal.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    
</body>

</html>
