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
                    <h1 class="page-header">Danh sách loại vote</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Bảng loại vote
                        </div>
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <div>
                        	<a href="/admin/votetype/addvotetype" id="btnAddVoteType" class="btn btn-primary btn-xs addBtnVoteType" style="width: 100px; height: 30px; margin-bottom: 10px; padding-top: 5px;"><i class="fa fa-plus"></i> Thêm mới 
                        	</a>
                        </div>
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-votetype">
                                <thead>
                                    <tr>
                                    	<th align="center">STT</th>
                                        <th align="center">ID</th>
                                        <th align="center">Tên loại vote</th>
                                        <th align="center">Chi tiết</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${lstVoteType}" var="voteType" varStatus="voteTypeId">
                                    <tr class="odd gradeX">
                                    	<td align="center"><c:out value="${voteTypeId.index+1}"></c:out></td>
                                        <td align="center"><c:out value="${voteType.voteTypeId}"></c:out></td>
                                        <td><c:out value="${voteType.voteTypeName}"></c:out></td>
                                        <td align="center"><a href="/admin/votetype/votedetail/${voteType.voteTypeId}" class="btn btn-info btn-xs" title="Xem chi tiết"><i class="fa fa-eye"></i> </a></td>
                                        <td align="center">
				                            <a href="/admin/votetype/findone/${voteType.voteTypeId}" id="editVoteType" data-id="${voteType.voteTypeId}" class="btn btn-info btn-xs eVoteBtn"><i class="fa fa-pencil"></i> Sửa </a>
				                            <a href="#" class="btn btn-danger btn-xs delVoteTypeBtn" id="delete" data-id="${voteType.voteTypeId}"><i class="fa fa-trash-o"></i> Xóa </a>
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
        </div>
        <!-- /#page-wrapper -->

	<!-- datamodal -->
		<div class="modal fade" id="modalUpdateVoteType" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content no 1-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">Vote type</h4>
		        </div>
		        <!-- ./modal-header -->
		        <div class="modal-body">
		         <form:form id="updateVoteTypeForm" action="/admin/votetype/savevotetype" method="post" modelAttribute="voteType" class="form-horizontal">
			          <div class="login-box-body">
					    <input type="hidden" id="idHidden" name="idHidden" value="${voteType.voteTypeId}">
					    <div class="form-group">
					        <label for="voteTypeName" class="col-xs-3 control-label">Tên loại vote <span class="required">*</span></label>
					        <div class="col-xs-9">
					            <form:input type="text" class="form-control" placeholder="Tên loại vote..." id="voteTypeName" name="voteTypeName" required="required" path="voteTypeName"/>
					        	<div class="error" hidden="hidden"></div>
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
	  	<!-- modal to delete -->
	  	<div class="modal fade" id="delVoteTypeModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Xóa loại vote</h4>
	        </div>
	        <div class="modal-body">
	        	<input type="hidden" id="idHidden" name="idHidden" value="0">
	          <p>Bạn chắc chắn xóa lĩnh vực này?</p>
	        </div>
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-danger" id="delVoteTypeBtn"> Xóa </button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
	

    <!-- /#wrapper -->
 
    <!-- jQuery -->
<jsp:include page="admin_footer.jsp"></jsp:include>
