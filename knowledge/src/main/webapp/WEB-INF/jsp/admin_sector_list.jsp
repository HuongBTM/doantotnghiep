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
                   <h1 class="page-header">Danh sách lĩnh vực chuyên gia</h1>
               </div>
               <!-- /.col-lg-12 -->
           </div>
           <!-- /.row -->
           <div class="row">
               <div class="col-lg-12">
                   <div class="panel panel-default">
                       <div class="panel-heading">
                           Bảng lĩnh vực
                       </div>
                       
                       <!-- /.panel-heading -->
                       <div class="panel-body">
                       <div>
                       	<a href="/admin/sector/addsector" id="btnAddSector" class="btn btn-primary btn-xs addBtn" style="width: 100px; height: 30px; margin-bottom: 10px; padding-top: 5px;"><i class="fa fa-plus"></i> Thêm mới 
                       	</a>
                       </div>
                           <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-sector">
                               <thead>
                                   <tr>
                                   	<th align="center">STT</th>
                                       <th align="center">ID</th>
                                       <th align="center">Tên lĩnh vực</th>
                                       <th align="center">Mô tả</th>
                                       <th></th>
                                   </tr>
                               </thead>
                               <tbody>
                               <c:forEach items="${lstSector}" var="sector" varStatus="sectorId">
                                   <tr class="odd gradeX">
                                   	<td align="right"><c:out value="${sectorId.index+1}"></c:out></td>
                                       <td align="right"><c:out value="${sector.sectorId}"></c:out></td>
                                       <td><c:out value="${sector.sectorName}"></c:out></td>
                                       <td><c:out value="${sector.describeSector}"></c:out></td>
                                       <td align="center">
			                            <a href="/admin/sector/editsector/${sector.sectorId}" data-id="${sector.sectorId}" class="btn btn-info btn-xs eBtn"><i class="fa fa-pencil"></i> Sửa </a>
			                            <a href="#" class="btn btn-danger btn-xs btnDeleteSector" data-id="${sector.sectorId}"><i class="fa fa-trash-o"></i> Xóa </a>
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
	<!-- modal to delete -->
	  	<div class="modal fade" id="delSectorModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Xóa lĩnh vực</h4>
	        </div>
	        <div class="modal-body">
	        	<input type="hidden" id="idHidden" name="idHidden" value="0">
	          <p>Bạn chắc chắn xóa lĩnh vực này?</p>
	        </div>
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-danger" id="delSectorBtn"> Xóa </button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>

    <!-- /#wrapper -->
 
    <!-- jQuery -->
<jsp:include page="admin_footer.jsp"></jsp:include>
