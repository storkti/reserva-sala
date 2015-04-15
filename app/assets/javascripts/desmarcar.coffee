jQuery(document).ready () ->
	jQuery('td').on 'click', '.desmarcar-link', (event)->
		event.preventDefault()

		button = jQuery(@)
		action = jQuery(@).attr 'href'
		td = button.closest('td')
		
		button.replaceWith jQuery("<small class='loading'>...</small>")
		
		jQuery.ajax
			type: 'patch'
			url: action
			success: (result)->
				td.find('.loading').remove()
				td.empty().append "<a class='agendar-link' data-remote='true' rel='nofollow' data-method='patch' href='/agenda/agendar?id=#{result.id}'>Reservar</a>"

			error: (response)->
				td.find('.loading').remove()
