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
});