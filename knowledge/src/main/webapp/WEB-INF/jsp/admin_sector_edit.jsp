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
                            Sector: Lĩnh vực
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <form:form class="form-horizontal form-label-left" action="/admin/sector/savesector" method="post" modelAttribute="sector">
							<input type="hidden" name="idHidden" value="${sector.sectorId}">
		                      <div class="item form-group">
		                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sectorName">Tên lĩnh vực <span class="required">*</span>
		                        </label>
		                        <div class="col-md-6 col-sm-6 col-xs-12">
		                        <!-- data-validate-length-range="6" data-validate-words="2" -->
		                          <form:input id="sectorName" class="form-control col-md-7 col-xs-12" name="sectorName" placeholder="Tên lĩnh vực..." required="required" type="text" path="sectorName"></form:input>
		                        	<form:errors path="sectorName" cssClass="error"></form:errors>
		                        </div>
		                      </div>
		                      <div class="item form-group">
		                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="describeSector">Mô tả lĩnh vực
		                        </label>
		                        <div class="col-md-6 col-sm-6 col-xs-12">
		                          <form:textarea id="describeSector" name="describeSector" rows="5" cols="30" placeholder="Tên lĩnh vực..." class="form-control col-md-7 col-xs-12" path="describeSector"></form:textarea>
		                        </div>
		                      </div>
		                      
		                      <div class="ln_solid"></div>
		                      <div class="form-group">
		                        <div class="col-md-6 col-md-offset-3">
		                          <button id="send" type="submit" class="btn btn-success">Submit</button>
		                          <button type="reset" class="btn btn-primary">Reset</button>
		                          <a href="/admin/sector/allsector" class="btn btn-primary">Cancel</a>
		                        </div>
		                      </div>
		                    </form:form>
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

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
      