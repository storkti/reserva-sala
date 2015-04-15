jQuery(document).ready () ->
	jQuery('td').on 'click', '.agendar-link', (event)->
		event.preventDefault()

		button = jQuery(@)
		action = jQuery(@).attr 'href'
		td = button.closest('td')
		
		button.after jQuery("<small class='loading'>Carregando...</small>")
		
		jQuery.ajax
			type: 'patch'
			url: action
			success: (result)->
				td.find('.loading').remove()
				td.empty().append "Reservado para #{result.user.nome} <a class='desmarcar-link' data-remote='true' rel='nofollow' data-method='patch' href='/agenda/desmarcar?id=#{result.id}'><i class='fa fa-close'></i></a>"

			error: (response)->
				td.find('.loading').remove()
