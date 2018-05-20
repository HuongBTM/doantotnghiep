$(document).ready(function() {
	$('.equestionBtn').on('click', function(event) {
		$('#modalUpdateQuestion').modal();
	})
	$('#updateQuestionForm').submit(function(e) {
		e.preventDefault();
		var idquestion= $('#modalUpdateQuestion').find('#idHidden').attr('value');
		$.ajax({
	        type: $(this).attr('method'),
	        url: $(this).attr("action"),
	        data: $(this).serialize(),
	        dataType: 'text',
	        success: function (data) {
	        	window.location.replace("http://localhost:8080/app/question/" + idquestion +"/detail");
	        }
	    });
	});
	
	$('.edit-answer').on('click', function(event) {
		event.preventDefault();
		var questionId= $(this).attr("data-id");
		var href = $(this).attr('href');
		$.get(href, function(answer, status) {
			$('#answerContent').val(answer.answerContent);
			$('#idAnswerHidden').val(answer.answerId);
			$('#idQuestionHidden').val(questionId);
		});
		$('#modalUpdateAnswer').modal();
	})
	$('#updateAnswerForm').submit(function(e) {
		e.preventDefault();
		var questionId= $('#modalUpdateAnswer').find('#idQuestionHidden').attr('value');
		$.ajax({
	        type: $(this).attr('method'),
	        url: $(this).attr("action"),
	        data: $(this).serialize(),
	        dataType: 'text',
	        success: function (data) {
	        	window.location.replace("http://localhost:8080/app/question/" + questionId +"/detail");
	        }
	    });
	});
	
	$('.editQuestionBtn').on('click', function(event) {
		event.preventDefault();
		var userId= $(this).attr("data-id");
		alert(userId);
		var href = $(this).attr('href');
		$.get(href, function(question, status) {
			$('#title').val(question.title);
			$('#question-details').val(question.questionContent);
			$('#idHidden').val(question.questionId);
			$('#idUserHidden').val(userId);
		});
		$('#modalUpdateQuestionInfo').modal();
	})
	$('.editAnswerBtn').on('click', function(event) {
		event.preventDefault();
		var userId= $(this).attr("data-id");
		alert(userId);
		var href = $(this).attr('href');
		$.get(href, function(answer, status) {
			$('#answer-details').val(answer.answerContent);
			$('#idAnswerHidden').val(answer.answerId);
			$('#idUserHidden').val(userId);
		});
		$('#modalUpdateAnswerInfo').modal();
	})
	$('.delQuestionBtn').on('click', function(event) {
		var id= $(this).attr("data-id");
		console.log(id);
		$('#delQuestionModal').modal();
		$('#delQuestionModal #idQuestionHidden').val(id);
	});
	$('.delAnswerBtn').on('click', function(event) {
		var id= $(this).attr("data-id");
		console.log(id);
		$('#delAnswerModal').modal();
		$('#delAnswerModal #idAnswerHidden').val(id);
	});
})