$(document).ready(function() {
    $('#dataTables-sector').DataTable({
        responsive: true
    });
 });
$(document).ready(function() {
	$('.addBtn', '.table .eBtn').on('click',function(event){
		event.preventDefault();
		var href = $(this).attr('href');
		$.get(href,function(sector, status) {
			$('.myForm #sectorName').val(sector.sectorName);
			$('.myForm #describeSector').val(sector.describeSector);
			
		});
		$('#editSector').modal();
	});
	
});