$(document).ready(function() {
	$('.addBtnVoteType, .table .eVoteBtn').on('click', function(event) {
		event.preventDefault();
		var href = $(this).attr('href');
		var text = $(this).className;
		if ($(this).hasClass('eVoteBtn')) {
			$.get(href, function(voteType, status) {
				$('#voteTypeName').val(voteType.voteTypeName);
				$('#idHidden').val(voteType.voteTypeId);
			});
			$('#modalUpdateVoteType').modal();
			$('#modalUpdateVoteType').find('.modal-title').text('Edit vote type');
		} else {
			$('#voteTypeName').val('');
			$('#idHidden').val('0');
			$('#modalUpdateVoteType').modal();
			$('#modalUpdateVoteType').find('.modal-title').text('Add new vote type');
		}
		
	});

	$('#updateVoteTypeForm').submit(function(e) {
		e.preventDefault();
		/*var title = $('#modalUpdateVoteType').find('.modal-title').text();*/
		$.ajax({
	        type: $(this).attr('method'),
	        url: $(this).attr("action"),
	        data: $(this).serialize(),
	        dataType: 'text',
	        success: function (data) {
	        	window.location.href="allvotetype";
	        	/*if(title=='Edit vote type') {
		        	console.log(data);
		        	 var $cells  = $('a[data-id="' + data.voteTypeId + '"]').closest('tr').find('td');;
		        	
		             // Update the cell data
		             $cells
		                 .eq(2).html(data.voteTypeName).end()
	             	
		        	$('#modalUpdateVoteType').modal('hide');
		        	alert('Vote type is updated');
	        	} else {
	        		window.location.href="allvotetype";
	        	}*/
	        },
	        error: function() {
				$('div.error').text('Tên loại vote đã tồn tại!');
            	$('div.error').show();
			}
	    });
	});
	$('.delVoteTypeBtn').on('click', function(event) {
		var id= $(this).attr("data-id");
		console.log(id);
		$('#delVoteTypeModal').modal();
		$('#delVoteTypeModal #idHidden').val(id);
	});
	$('#delVoteTypeBtn').on('click', function(event) {
		var id= $('#delVoteTypeModal').find('#idHidden').attr('value');
		console.log(id);
		$.ajax({
	        type: 'GET',
	        url: "/admin/votetype/deletevotetype?votetypeid=" + id,
	        dataType: 'text',
	        success: function (data) {
	        	if(data == "SUCCESS") {
	        		window.location.href = "allvotetype";
	            } else {
	            	console.log('cannot delete');
	            }
	        },
	        error: function() {
				
			}
	    });
	});
	$('.deleteUser').on('click', function(event) {
		var id= $(this).attr("data-id");
		console.log(id);
		$('#delUserModal').modal();
		$('#delUserModal #idHidden').val(id);
	});
	$('#delUserBtn').on('click', function(event) {
		var id= $('#delUserModal').find('#idHidden').attr('value');
		console.log(id);
		$.ajax({
	        type: 'GET',
	        url: "/admin/user/deleteuser?userid=" + id,
	        dataType: 'text',
	        success: function (data) {
	        	if(data == "SUCCESS") {
	        		window.location.href = "alluser";
	            } else {
	            	console.log('cannot delete');
	            }
	        },
	        error: function() {
				
			}
	    });
	});
	$('.delPendingTag').on('click', function(event) {
		var id= $(this).attr("data-id");
		console.log(id);
		$('#delPendingTagModal').modal();
		$('#delPendingTagModal #idHidden').val(id);
	});
	$('#delPendingTagBtn').on('click', function(event) {
		var id= $('#delPendingTagModal').find('#idHidden').attr('value');
		console.log(id);
		$.ajax({
	        type: 'GET',
	        url: "/admin/pendingtag/deletependingtag?pendingtagid=" + id,
	        dataType: 'text',
	        success: function (data) {
	        	if(data == "SUCCESS") {
	        		window.location.href = "allpendingtag";
	            } else {
	            	console.log('cannot delete');
	            }
	        },
	        error: function() {
				
			}
	    });
	});
	$('.btnAddpendingTag, .table .editPendingTag').on('click', function(event) {
		event.preventDefault();
		var href = $(this).attr('href');
		var text = $(this).className;
		if ($(this).hasClass('editPendingTag')) {
			$.get(href, function(pendingTag, status) {
				$('#pendingName').val(pendingTag.pendingName);
				$('#pendingDescrib').val(pendingTag.pendingDescrib);
				$('#idHidden').val(pendingTag.pendingId);
			});
			$('#modalUpdatePending').modal();
			$('#modalUpdatePending').find('.modal-title').text('Edit pending tag');
		} else {
			$('#pendingName').val('');
			$('#pendingDescrib').val('');
			$('#idHidden').val('0');
			$('#modalUpdatePending').modal();
			$('#modalUpdatePending').find('.modal-title').text('Add new pending tag');
		}
		
	});

	$('#updatePendingTagForm').submit(function(e) {
		e.preventDefault();
		var title = $('#modalUpdatePending').find('.modal-title').text();
		$.ajax({
	        type: $(this).attr('method'),
	        url: $(this).attr("action"),
	        data: $(this).serialize(),
	        dataType: 'text',
	        success: function (data) {
	        	window.location.href="allpendingtag";
	        },
	        error: function() {
				$('div.error').text('Tên trạng thái đã tồn tại!');
            	$('div.error').show();
			}
	    });
	});
	
	$('.btnDeleteSector').on('click', function(event) {
		var id= $(this).attr("data-id");
		console.log(id);
		$('#delSectorModal').modal();
		$('#delSectorModal #idHidden').val(id);
	});
	$('#delSectorBtn').on('click', function(event) {
		var id= $('#delSectorModal').find('#idHidden').attr('value');
		console.log(id);
		$.ajax({
	        type: 'GET',
	        url: "/admin/sector/deletesector?sectorid=" + id,
	        dataType: 'text',
	        success: function (data) {
	        	if(data == "SUCCESS") {
	        		window.location.href = "allsector";
	            } else {
	            	console.log('cannot delete');
	            }
	        },
	        error: function() {
				
			}
	    });
	});
	$('.deleteRoleBtn').on('click', function(event) {
		var id= $(this).attr("data-id");
		console.log(id);
		$('#delRoleModal').modal();
		$('#delRoleModal #idHidden').val(id);
	});
	$('#delRoleBtn').on('click', function(event) {
		var id= $('#delRoleModal').find('#idHidden').attr('value');
		console.log(id);
		$.ajax({
	        type: 'GET',
	        url: "/admin/role/deleterole?roleid=" + id,
	        dataType: 'text',
	        success: function (data) {
	        	if(data == "SUCCESS") {
	        		window.location.href = "allrole";
	            } else {
	            	console.log('cannot delete');
	            }
	        },
	        error: function() {
				
			}
	    });
	});
	$('.btnAddRole, .table .eRoleBtn').on('click', function(event) {
		event.preventDefault();
		var href = $(this).attr('href');
		var text = $(this).className;
		if ($(this).hasClass('eRoleBtn')) {
			$.get(href, function(role, status) {
				$('#roleName').val(role.roleName);
				$('#roleDescrib').val(role.roleDescrib);
				$('#idHidden').val(role.roleId);
			});
			$('#modalUpdateRole').modal();
			$('#modalUpdateRole').find('.modal-title').text('Edit Role');
		} else {
			$('#roleName').val('');
			$('#roleDescrib').val('');
			$('#idHidden').val('0');
			$('#modalUpdateRole').modal();
			$('#modalUpdateRole').find('.modal-title').text('Add new role');
		}
		
	});

	$('#updateRoleForm').submit(function(e) {
		e.preventDefault();
		var title = $('#modalUpdateRole').find('.modal-title').text();
		$.ajax({
	        type: $(this).attr('method'),
	        url: $(this).attr("action"),
	        data: $(this).serialize(),
	        dataType: 'text',
	        success: function (data) {
	        	window.location.href="allrole";
	        },
	        error: function() {
				$('div.error').text('Tên quyền đã tồn tại!');
            	$('div.error').show();
			}
	    });
	});
});