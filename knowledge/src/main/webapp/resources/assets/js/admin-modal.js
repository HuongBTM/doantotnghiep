$(document).ready(function() {
	$('#dataTables-sector, #dataTables-votetype, #dataTables-pendingTag, #dataTables-role').DataTable({
		responsive : true
	});
});

$(document).ready(function() {
	$('#dataTables-user, #dataTables-topic, #dataTables-question, #dataTables-answer, #dataTables-comment').DataTable({
		responsive : true
	});
});

$(document).ready(function() {
	$('#dataTables-topic-post, #dataTables-topic-question').DataTable({
		responsive : true
	});
});

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
			$('#modalUpdateVoteType').find('.modal-title').text('Chỉnh sửa loại vote');
		} else {
			$('#voteTypeName').val('');
			$('#idHidden').val('0');
			$('#modalUpdateVoteType').modal();
			$('#modalUpdateVoteType').find('.modal-title').text('Thêm mới loại vote');
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
			$('#modalUpdatePending').find('.modal-title').text('Chỉnh sửa trạng thái');
		} else {
			$('#pendingName').val('');
			$('#pendingDescrib').val('');
			$('#idHidden').val('0');
			$('#modalUpdatePending').modal();
			$('#modalUpdatePending').find('.modal-title').text('Thêm trạng thái mới');
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
			$('#modalUpdateRole').find('.modal-title').text('Chỉnh sửa quyền');
		} else {
			$('#roleName').val('');
			$('#roleDescrib').val('');
			$('#idHidden').val('0');
			$('#modalUpdateRole').modal();
			$('#modalUpdateRole').find('.modal-title').text('Thêm quyền mới');
		}
		
	});

	/*$('#updateRoleForm').submit(function(e) {
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
	});*/
	//topic
	$('.btnAddTopic, .table .etopicBtn').on('click', function(event) {
		event.preventDefault();
		var href = $(this).attr('href');
		var text = $(this).className;
		if ($(this).hasClass('etopicBtn')) {
			$.get(href, function(topic, status) {
				$('#topicName').val(topic.topicName);
				$('#topicDescribe').val(topic.topicDescribe);
				$('#idHidden').val(topic.topicId);
			});
			$('#modalUpdateTopic').modal();
			$('#modalUpdateTopic').find('.modal-title').text('Chỉnh sửa chủ đề');
		} else {
			$('#topicName').val('');
			$('#topicDescribe').val('');
			$('#idHidden').val('0');
			$('#modalUpdateTopic').modal();
			$('#modalUpdateTopic').find('.modal-title').text('Thêm chủ đề mới');
		}
		
	});

	$('#updateTopicForm').submit(function(e) {
		e.preventDefault();
		$.ajax({
	        type: $(this).attr('method'),
	        url: $(this).attr("action"),
	        data: $(this).serialize(),
	        dataType: 'text',
	        success: function (data) {
	        	window.location.href="alltopic";
	        },
	        error: function() {
				$('div.error').text('Tên chủ đề đã tồn tại!');
            	$('div.error').show();
			}
	    });
	});
	$('.deletetopicBtn').on('click', function(event) {
		var id= $(this).attr("data-id");
		console.log(id);
		$('#delTopicModal').modal();
		$('#delTopicModal #idHidden').val(id);
	});
	$('#delTopicBtn').on('click', function(event) {
		var id= $('#delTopicModal').find('#idHidden').attr('value');
		console.log(id);
		$.ajax({
	        type: 'GET',
	        url: "/admin/topic/deletetopic?topicid=" + id,
	        dataType: 'text',
	        success: function (data) {
	        	if(data == "SUCCESS") {
	        		window.location.href = "alltopic";
	            } else {
	            	console.log('cannot delete');
	            }
	        },
	        error: function() {
				
			}
	    });
	});
	
	$('.deleteQuestion').on('click', function(event) {
		var id= $(this).attr("data-id");
		console.log(id);
		$('#delQuestionModal').modal();
		$('#delQuestionModal #idHidden').val(id);
	});
	$('#delQuestionBtn').on('click', function(event) {
		var id= $('#delQuestionModal').find('#idHidden').attr('value');
		console.log(id);
		$.ajax({
	        type: 'GET',
	        url: "/admin/question/deletequestion?questionid=" + id,
	        dataType: 'text',
	        success: function (data) {
	        	if(data == "SUCCESS") {
	        		window.location.href = "allquestion";
	            } else {
	            	console.log('cannot delete');
	            }
	        },
	        error: function() {
				
			}
	    });
	});
	
	$('.deleteQuestionTopic').on('click', function(event) {
		var idTopic = $('.table').find('#idTopic').attr('value');
		var id= $(this).attr("data-id");
		console.log(id);
		$('#delQuestionTopicModal').modal();
		$('#delQuestionTopicModal #idHidden').val(id);
		$('#delQuestionTopicModal #idTopicHidden').val(idTopic);
	});
	$('#delQuestionTopicBtn').on('click', function(event) {
		var idTopic= $('#delQuestionTopicModal').find('#idTopicHidden').attr('value');
		var id= $('#delQuestionTopicModal').find('#idHidden').attr('value');
		console.log(id);
		$.ajax({
	        type: 'GET',
	        url: "/admin/question/deletequestion?questionid=" + id,
	        dataType: 'text',
	        success: function (data) {
	        	if(data == "SUCCESS") {
	        		window.location.replace("http://localhost:8080/admin/topic/detail/" + idTopic);
	            } else {
	            	console.log('cannot delete');
	            }
	        },
	        error: function() {
				
			}
	    });
	});
	
	$('.deletePost').on('click', function(event) {
		var id= $(this).attr("data-id");
		console.log(id);
		$('#delPostModal').modal();
		$('#delPostModal #idHidden').val(id);
	});
	$('#delPostBtn').on('click', function(event) {
		var id= $('#delPostModal').find('#idHidden').attr('value');
		console.log(id);
		$.ajax({
	        type: 'GET',
	        url: "/admin/post/deletepost?postid=" + id,
	        dataType: 'text',
	        success: function (data) {
	        	if(data == "SUCCESS") {
	        		window.location.href = "allpost";
	            } else {
	            	console.log('cannot delete');
	            }
	        },
	        error: function() {
				
			}
	    });
	});
	
	$('.deleteTopicPost').on('click', function(event) {
		var idTopic = $('.table').find('#idTopic').attr('value');
		var id= $(this).attr("data-id");
		console.log(id);
		$('#delPostTopicModal').modal();
		$('#delPostTopicModal #idHidden').val(id);
		$('#delPostTopicModal #idTopicHidden').val(idTopic);
	});
	$('#delPostTopicBtn').on('click', function(event) {
		var idTopic= $('#delPostTopicModal').find('#idTopicHidden').attr('value');
		var id= $('#delPostTopicModal').find('#idHidden').attr('value');
		console.log(id);
		$.ajax({
	        type: 'GET',
	        url: "/admin/post/deletepost?postid=" + id,
	        dataType: 'text',
	        success: function (data) {
	        	if(data == "SUCCESS") {
	        		window.location.replace("http://localhost:8080/admin/topic/detail/" + idTopic);
	            } else {
	            	console.log('cannot delete');
	            }
	        },
	        error: function() {
				
			}
	    });
	});
	
	$('.deleteAnswerBtn').on('click', function(event) {
		var idQuestion = $('.table').find('#idQuestion').attr('value');
		console.log(idQuestion);
		var id= $(this).attr("data-id");
		console.log(id);
		$('#delAnswerModal').modal();
		$('#delAnswerModal #idHidden').val(id);
		$('#delAnswerModal #idQuestionHidden').val(idQuestion);
	});
	$('#delAnswerBtn').on('click', function(event) {
		var id= $('#delAnswerModal').find('#idHidden').attr('value');
		var questionId = $('#delAnswerModal').find('#idQuestionHidden').attr('value');
		console.log(id);
		$.ajax({
	        type: 'GET',
	        url: "/admin/answer/deleteanswer?answerid=" + id,
	        dataType: 'text',
	        success: function (data) {
	        	if(data == "SUCCESS") {
	        		window.location.replace("http://localhost:8080/admin/question/detail/" + questionId);
	            } else {
	            	console.log('cannot delete');
	            }
	        },
	        error: function() {
				
			}
	    });
	});
	
	$('.deleteCommentBtn').on('click', function(event) {
		var idAnswer = $('.table').find('#idAnswer').attr('value');
		console.log(idAnswer);
		var id= $(this).attr("data-id");
		console.log(id);
		$('#delCommentModal').modal();
		$('#delCommentModal #idHidden').val(id);
		$('#delCommentModal #idAnswerHidden').val(idAnswer);
	});
	$('#delCommentBtn').on('click', function(event) {
		var id= $('#delCommentModal').find('#idHidden').attr('value');
		var answerId = $('#delCommentModal').find('#idAnswerHidden').attr('value');
		console.log(id);
		$.ajax({
	        type: 'GET',
	        url: "/admin/comment/deletecomment?commentid=" + id,
	        dataType: 'text',
	        success: function (data) {
	        	if(data == "SUCCESS") {
	        		window.location.replace("http://localhost:8080/admin/answer/detail/" + answerId);
	            } else {
	            	console.log('cannot delete');
	            }
	        },
	        error: function() {
				
			}
	    });
	});
	
	$('#delAnswerListBtn').on('click', function(event) {
		var id= $('#delAnswerModal').find('#idHidden').attr('value');
		console.log(id);
		$.ajax({
	        type: 'GET',
	        url: "/admin/answer/deleteanswer?answerid=" + id,
	        dataType: 'text',
	        success: function (data) {
	        	if(data == "SUCCESS") {
	        		window.location.href = "allanswer";
	            } else {
	            	console.log('cannot delete');
	            }
	        },
	        error: function() {
				
			}
	    });
	});
	
	$('.deletePostEx').on('click', function(event) {
		var id= $(this).attr("data-id");
		console.log(id);
		$('#delPostExModal').modal();
		$('#delPostExModal #idHidden').val(id);
	});
	$('#delPostExBtn').on('click', function(event) {
		var id= $('#delPostExModal').find('#idHidden').attr('value');
		console.log(id);
		$.ajax({
	        type: 'GET',
	        url: "/expect/post/delete?postid=" + id,
	        dataType: 'text',
	        success: function (data) {
	        	if(data == "SUCCESS") {
	        		window.location.href = "all";
	            } else {
	            	console.log('cannot delete');
	            }
	        },
	        error: function() {
				
			}
	    });
	});
	
	$('#btnAddtopicEx').on('click', function(event) {
		event.preventDefault();
		$('#topicName').val('');
		$('#topicDescribe').val('');
		$('#idHidden').val('0');
		$('#modalUpdateTopicEx').modal();
	});
	$('#updateTopicExForm').submit(function(e) {
		e.preventDefault();
		$.ajax({
	        type: $(this).attr('method'),
	        url: $(this).attr("action"),
	        data: $(this).serialize(),
	        dataType: 'text',
	        success: function (data) {
	        	window.location.href="add";
	        },
	        error: function() {
				$('div.error').text('Tên chủ đề đã tồn tại!');
            	$('div.error').show();
			}
	    });
	});
});