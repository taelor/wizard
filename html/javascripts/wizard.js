$(document).ready(function() {
	var wizard_controller = $('meta[name=wizard_controller]').attr('content');
	var wizard_id_prefix = $('meta[name=wizard_id_prefix]').attr('content');
	
	$('a').live('click', function(event) {
		if($('#wizard_panel'). 	val() != undefined)
		{
			wizard_panel_left = $('#wizard_panel').css('left')
			wizard_panel_top = $('#wizard_panel').css('top')
		
			href = $(this).attr('href');
			wizard_location = "wizard_panel_left="+wizard_panel_left+"&wizard_panel_top="+wizard_panel_top
			
			if($(this).hasClass("wizard_delete"))
			{
	    	if ( confirm("Are you sure you want to delete this?") )
				{	
					$('<form method="post" action="' + this.href.replace('/delete', '') + '" />').append('<input type="hidden" name="_method" value="delete" />').appendTo('body').submit();
				}
	      return false;
			}//it has a ? and a #
			else if(href.indexOf("#") != -1 && href.indexOf("?") != -1 )
			{
				url_div = href.split("#")
				href = url_div[0] + "&" + wizard_location + "#" + url_div[1]
			}// it has a # only
			else if(href.indexOf("#") != -1)
			{
				url_div = href.split("#")
				href = url_div[0] + "?" + wizard_location + "#" + url_div[1]
			}//it has a ? only
			else if(href.indexOf("?") != -1)
			{
				href = href + "&" + wizard_location 
			}// it has nothing
			else
			{
				href = href + "?" + wizard_location
			}	
			
			$(this).attr('href', href)
		}
	});
	
	$("#wizard_panel").draggable(
	    { 
	        zIndex:    		20, 
	        ghosting: 		false, 
	        opacity: 			0.7, 
	        handle: 			'#wizard_panel_handle',
					scroll: 			false,
					containment: 	'window',
	    } 
	);

	$('.wizard').click(function() {
		id = this.id.replace(wizard_id_prefix+'_', '');
		
		if($('#wizard_controller').val() == null)
		{
			$('#wizard_list').append('<li id="wizard_controller_list">Wiz '+id+'<ul id="wizard_controller"></ul></li>');
			$('#wizard_controller').append('<li><a href="/'+wizard_controller+'/'+id+'/edit">Edit</a></li>');
			$('#wizard_controller').append('<li><a class= "wizard_delete" href="/'+wizard_controller+'/'+id+'/delete">Delete</a></li>');
		}
		else
		{
			$('#wizard_controller').empty();
			$('#wizard_controller_list').remove();
			$('#wizard_list').append('<li id="wizard_controller_list">Wiz '+id+'<ul id="wizard_controller"></ul></li>');
			$('#wizard_controller').append('<li><a href="/blog/'+id+'/edit">Edit</a></li>');
			$('#wizard_controller').append('<li><a class="wizard_delete" href="/blog/'+id+'/delete">Delete</a></li>');
		}
	});	
});