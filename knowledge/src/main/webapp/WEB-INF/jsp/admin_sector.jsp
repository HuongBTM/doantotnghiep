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
                        <div style="padding-left: 20px;">
                        	<button type="button"id="btnAddSector" class="btn btn-primary btn-xs" style="width: 100px; height: 30px; margin-bottom: 10px;"><i class="fa fa-plus"></i> Add 
                        	</button>
                        </div>
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-sector">
                                <thead>
                                    <tr>
                                    	<th>STT</th>
                                        <th>ID</th>
                                        <th>Tên lĩnh vực</th>
                                        <th>Mô tả</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${lstSector}" var="sector" varStatus="sectorId">
                                    <tr class="odd gradeX">
                                    	<td class="center"><c:out value="${sectorId.index+1}"></c:out></td>
                                        <td class="center"><c:out value="${sector.sectorId}"></c:out></td>
                                        <td><c:out value="${sector.sectorName}"></c:out></td>
                                        <td><c:out value="${sector.describeSector}"></c:out></td>
                                        <td>
				                            <button type="button" data-id="${sector.sectorId}" id="btnEditSector" class="btn btn-info btn-xs" data-target="#editSector" data-toggle="modal"><i class="fa fa-pencil"></i> Edit </button>
				                            <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
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
	<div class="modal fade" id="editSector" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content no 1-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Thêm/ sửa lĩnh vực</h4>
        </div>
        <!-- ./modal-content -->
        <div class="modal-body">
          <div class="login-box-body">
              <form:form id="updateSectorForm" action="login" method="post" modelAttribute="sector" class="form-horizontal">
			    <div class="form-group">
			        <label class="col-xs-3 control-label">Tên lĩnh vực</label>
			        <div class="col-xs-9">
			            <form:input type="text" class="form-control" placeholder="Tên lĩnh vực..." path="sectorName"/>
			        </div>
			    </div>
			    <div class="form-group">
			        <label class="col-xs-3 control-label">Mô tả</label>
			        <div class="col-xs-9">
			            <form:textarea type="text" class="form-control" rows="5" cols="30" placeholder="Mô tả lĩnh vực..." path="describeSector"/>
			        </div>
			    </div>
              </form:form>
            </div>
        </div>
        <!-- /.modal-body -->
        <div class="modal-footer">
 			<button type="submit" class="btn btn-success" id="btnSave">Save</button>
 			<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
 		</div>
 		<!-- /.modal-footer -->
      </div>
      <!-- ./modal-content -->
      
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

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
      $(document).ready(function() {
        $('#dataTables-sector').DataTable({
            responsive: true
        });
     });
      $(document).ready(function() {
    	    $('#updateSectorForm')
    	        .formValidation({
    	            framework: 'bootstrap',
    	            icon: {
    	                valid: 'glyphicon glyphicon-ok',
    	                invalid: 'glyphicon glyphicon-remove',
    	                validating: 'glyphicon glyphicon-refresh'
    	            },
    	            fields: {
    	            	sectorName: {
    	                    validators: {
    	                        notEmpty: {
    	                            message: 'The sector name is required'
    	                        },
    	                        regexp: {
    	                            regexp: /^[a-zA-Z\s]+$/,
    	                            message: 'The full name can only consist of alphabetical characters'
    	                        }
    	                    }
    	                },
    	                describeSector: {
    	                    validators: {
    	                    	regexp: {
    	                            regexp: /^[a-zA-Z\s]+$/,
    	                            message: 'The describle can only consist of alphabetical characters'
    	                        }
    	                    }
    	                },
    	                /* website: {
    	                    validators: {
    	                        notEmpty: {
    	                            message: 'The website address is required'
    	                        },
    	                        uri: {
    	                            allowEmptyProtocol: true,
    	                            message: 'The website address is not valid'
    	                        }
    	                    }
    	                } */
    	            }
    	        })
    	        .on('success.form.fv', function(e) {
    	            // Save the form data via an Ajax request
    	            e.preventDefault();

    	            var $form = $(e.target),
    	                id    = $form.find('[path="sectorId"]').val();

    	            // The url and method might be different in your application
    	            $.ajax({
    	                url: 'http://jsonplaceholder.typicode.com/users/' + id,
    	                method: 'PUT',
    	                data: $form.serialize()
    	            }).success(function(response) {
    	                // Get the cells
    	                var $button = $('button[data-id="' + response.id + '"]'),
    	                    $tr     = $button.closest('tr'),
    	                    $cells  = $tr.find('td');

    	                // Update the cell data
    	                $cells
    	                    .eq(1).html(response.name).end()
    	                    .eq(2).html(response.email).end()
    	                    .eq(3).html(response.website).end();

    	                // Hide the dialog
    	                $form.parents('.bootbox').modal('hide');

    	                // You can inform the user that the data is updated successfully
    	                // by highlighting the row or showing a message box
    	                bootbox.alert('The user profile is updated');
    	            });
    	        });

    	    $('#editButton').on('click', function() {
    	        // Get the record's ID via attribute
    	        var id = $(this).attr('data-id');

    	        $.ajax({
    	            url: 'http://jsonplaceholder.typicode.com/users/' + id,
    	            method: 'GET'
    	        }).success(function(response) {
    	            // Populate the form fields with the data returned from server
    	            $('#userForm')
    	                .find('[name="id"]').val(response.id).end()
    	                .find('[name="name"]').val(response.name).end()
    	                .find('[name="email"]').val(response.email).end()
    	                .find('[name="website"]').val(response.website).end();

    	            // Show the dialog
    	            bootbox
    	                .dialog({
    	                    title: 'Edit the user profile',
    	                    message: $('#userForm'),
    	                    show: false // We will show it manually later
    	                })
    	                .on('shown.bs.modal', function() {
    	                    $('#userForm')
    	                        .show()                             // Show the login form
    	                        .formValidation('resetForm'); // Reset form
    	                })
    	                .on('hide.bs.modal', function(e) {
    	                    // Bootbox will remove the modal (including the body which contains the login form)
    	                    // after hiding the modal
    	                    // Therefor, we need to backup the form
    	                    $('#userForm').hide().appendTo('body');
    	                })
    	                .modal('show');
    	        });
    	    });
    	});
	</script>
</body>

</html>
