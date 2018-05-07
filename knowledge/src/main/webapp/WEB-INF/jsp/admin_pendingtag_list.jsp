<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<jsp:include page="admin_layout.jsp"></jsp:include>
	<div class="right_col" role="main">
          <div class="">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Danh sách trạng thái cho bài viết/ câu hỏi</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Bảng trạng thái
                        </div>
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <div>
                        	<a href="/admin/pendingTag/addpendingtag" id="btnAddpendingTag" class="btn btn-primary btn-xs btnAddpendingTag" style="width: 100px; height: 30px; margin-bottom: 10px; padding-top: 5px;"><i class="fa fa-plus"></i> Thêm mới 
                        	</a>
                        </div>
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-pendingTag">
                                <thead>
                                    <tr>
                                    	<th align="center">STT</th>
                                        <th align="center">ID</th>
                                        <th align="center">Tên trạng thái</th>
                                        <th align="center">Mô tả trạng thái</th>
                                        <th align="center">Nội dung phê duyệt</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${lstPendingTag}" var="pendingTag" varStatus="pendingId">
                                    <tr class="odd gradeX">
                                    	<td align="right"><c:out value="${pendingId.index+1}"></c:out></td>
                                        <td align="right"><c:out value="${pendingTag.pendingId}"></c:out></td>
                                        <td><c:out value="${pendingTag.pendingName}"></c:out></td>
                                        <td><c:out value="${pendingTag.pendingDescrib}"></c:out></td>
                                        <td><c:out value="${pendingTag.pendingContent}"></c:out></td>
                                        <td align="center">
				                            <a href="/admin/pendingtag/findone/${pendingTag.pendingId}" id="editPendingTag" data-id="${pendingTag.pendingId}" class="btn btn-info btn-xs editPendingTag"><i class="fa fa-pencil"></i> Sửa </a>
				                            <a href="#" class="btn btn-danger btn-xs delPendingTag" data-id="${pendingTag.pendingId}"><i class="fa fa-trash-o"></i> Xóa </a>
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
	</div>
	<!-- datamodal -->
		 <div class="modal fade" id="modalUpdatePending" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content no 1-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">Pending</h4>
		        </div>
		        <!-- ./modal-header -->
		        <div class="modal-body">
		         <form:form id="updatePendingTagForm" action="/admin/pendingtag/savependingtag" method="post" modelAttribute="pendingTag" class="form-horizontal">
			          <div class="login-box-body">
					    <input type="hidden" id="idHidden" name="idHidden" value="${pendingTag.pendingId}">
					    <div class="item form-group">
                        <label class="control-label col-xs-3" for="pendingName">Tên trạng thái <span class="required">*</span>
                        </label>
                        <div class="col-xs-9">
                        <!-- data-validate-length-range="6" data-validate-words="2" -->
                          <form:input id="pendingName" class="form-control col-md-7 col-xs-12" name="pendingName" placeholder="Tên trạng thái..." required="required" type="text" path="pendingName"></form:input>
                        	<div class="error" hidden="hidden"></div>
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-xs-3" for="pendingContent">Nội dung thông báo <span class="required">*</span>
                        </label>
                        <div class="col-xs-9">
                          <form:input id="pendingContent" class="form-control col-md-7 col-xs-12" name="pendingName" placeholder="Tên trạng thái..." required="required" type="text" path="pendingContent"></form:input>
                        	
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-xs-3" for="pendingDescrib">Mô tả trạng thái
                        </label>
                        <div class="col-xs-9">
                          <form:textarea id="pendingDescrib" name="pendingDescrib" rows="5" cols="30" placeholder="Mô tả trạng thái..." class="form-control col-md-7 col-xs-12" path="pendingDescrib"></form:textarea>
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
	  	<div class="modal fade" id="delPendingTagModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Xóa bản ghi</h4>
	        </div>
	        <div class="modal-body">
	        	<input type="hidden" id="idHidden" name="idHidden" value="0">
	          <p>Bạn chắc chắn xóa bản ghi này?</p>
	        </div>
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-danger" id="delPendingTagBtn"> Xóa </button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
	
<jsp:include page="admin_footer.jsp"></jsp:include>

