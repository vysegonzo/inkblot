##
# Handle dynamic title and tagline customization previews.
# 
# @package Inkblot
##

(($)->
	#===== Backgrounds =============================================================#
	
	wp.customize('page_background_image', (value)->
		value.bind((to)->
			$('.wrapper').css('background-image', if to then 'url(' + to + ')' else 'none')
		)
	)
	
	wp.customize('page_background_repeat', (value)->
		value.bind((to)->
			$('.wrapper').css('background-repeat', to)
		)
	)
	
	wp.customize('page_background_position_x', (value)->
		value.bind((to)->
			$('.wrapper').css('background-position', 'top ' + to)
		)
	)
	
	wp.customize('page_background_attachment', (value)->
		value.bind((to)->
			$('.wrapper').css('background-attachment', to)
		)
	)
	
	wp.customize('trim_background_image', (value)->
		value.bind((to)->
			$('.banner nav, .banner select, .banner nav ul ul, .contentinfo, .post-webcomic nav').css('background-image', if to then 'url(' + to + ')' else 'none')
		)
	)
	
	wp.customize('trim_background_repeat', (value)->
		value.bind((to)->
			$('.banner nav, .banner select, .banner nav ul ul, .contentinfo, .post-webcomic nav').css('background-repeat', to)
		)
	)
	
	wp.customize('trim_background_position_x', (value)->
		value.bind((to)->
			$('.banner nav, .banner select, .banner nav ul ul, .contentinfo, .post-webcomic nav').css('background-position', 'top ' + to)
		)
	)
	
	wp.customize('trim_background_attachment', (value)->
		value.bind((to)->
			$('.banner nav, .banner select, .banner nav ul ul, .contentinfo, .post-webcomic nav').css('background-attachment', to)
		)
	)
	
	#===== Colors =============================================================#
	
	##
	# Update theme colors for customization preview.
	# 
	# @param string id Color to update.
	# @param string to Color or opacity to update.
	# @param string selectors HTML element selectors to update.
	# @param string property CSS color property to update.
	# @return null
	##
	inkblot_color = (id, to, selectors, property)->
		id = id.replace(/_/g, '-')
		isColor = -1 < id.indexOf('color')
		rgba = if isColor then _.toArray(Color(to).toRgb()) else _.toArray(Color($('wbr.inkblot').data(id.replace(/opacity/g, 'color'))).toRgb())
		
		if isColor
			rgba.push(parseFloat($('wbr.inkblot').data(id.replace(/color/g, 'opacity'))))
		else
			rgba.push(to)
		
		if -1 < selectors.indexOf(' a')
			$('#inkblot-theme-inline-css').append(selectors + '{' + property + ':' + 'rgba(' + rgba.join(',') + ')' + '}')
		else
			$(selectors).css(property, 'rgba(' + rgba.join(',') + ')')
		
		$('wbr.inkblot').data(id, to)
	
	wp.customize('background_color', (value)->
		value.bind((to)->
			inkblot_color('background_color', to, 'body', 'background-color')
		)
	)
	
	wp.customize('background_opacity', (value)->
		value.bind((to)->
			inkblot_color('background_opacity', to, 'body', 'background-color')
		)
	)
	
	wp.customize('page_color', (value)->
		value.bind((to)->
			inkblot_color('page_color', to, '.wrapper, input, textarea', 'background-color')
		)
	)
	
	wp.customize('page_opacity', (value)->
		value.bind((to)->
			inkblot_color('page_opacity', to, '.wrapper, input, textarea', 'background-color')
		)
	)
	
	wp.customize('trim_color', (value)->
		value.bind((to)->
			inkblot_color('trim_color', to, '.banner nav, .banner ul ul, .contentinfo, .post-webcomic nav, button, input[type="submit"], input[type="reset"], input[type="button"]', 'background-color')
		)
	)
	
	wp.customize('trim_opacity', (value)->
		value.bind((to)->
			inkblot_color('trim_opacity', to, '.banner nav, .banner ul ul, .contentinfo, .post-webcomic nav, button, input[type="submit"], input[type="reset"], input[type="button"]', 'background-color')
		)
	)
	
	wp.customize('text_color', (value)->
		value.bind((to)->
			inkblot_color('text_color', to, 'body', 'color')
		)
	)
	
	wp.customize('text_opacity', (value)->
		value.bind((to)->
			inkblot_color('text_opacity', to, 'body', 'color')
		)
	)
	
	wp.customize('header_textcolor', (value)->
		value.bind((to)->
			if 'blank' != to
				inkblot_color('header_textcolor', to, '.banner > a', 'color')
		)
	)
	
	wp.customize('header_textopacity', (value)->
		value.bind((to)->
			inkblot_color('header_textopacity', to, '.banner > a, .banner > a:focus, .banner > a:hover', 'color')
		)
	)
	
	wp.customize('page_text_color', (value)->
		value.bind((to)->
			inkblot_color('page_text_color', to, '.wrapper, input, textarea', 'color')
		)
	)
	
	wp.customize('page_text_opacity', (value)->
		value.bind((to)->
			inkblot_color('page_text_opacity', to, '.wrapper, input, textarea', 'color')
		)
	)
	
	wp.customize('trim_text_color', (value)->
		value.bind((to)->
			inkblot_color('trim_text_color', to, '.banner nav, .banner ul ul, .contentinfo, .post-webcomic nav, button, input[type="submit"], input[type="reset"], input[type="button"]', 'color')
		)
	)
	
	wp.customize('trim_text_opacity', (value)->
		value.bind((to)->
			inkblot_color('trim_text_opacity', to, '.banner nav, .banner ul ul, .contentinfo, .post-webcomic nav, button, input[type="submit"], input[type="reset"], input[type="button"]', 'color')
		)
	)
	
	wp.customize('link_color', (value)->
		value.bind((to)->
			inkblot_color('link_color', to, ' a', 'color')
		)
	)
	
	wp.customize('link_opacity', (value)->
		value.bind((to)->
			inkblot_color('link_opacity', to, ' a', 'color')
		)
	)
	
	wp.customize('link_hover_color', (value)->
		value.bind((to)->
			inkblot_color('link_hover_color', to, 'a:focus, a:hover', 'color')
		)
	)
	
	wp.customize('link_hover_opacity', (value)->
		value.bind((to)->
			inkblot_color('link_hover_opacity', to, 'a:focus, a:hover', 'color')
		)
	)
	
	wp.customize('page_link_color', (value)->
		value.bind((to)->
			inkblot_color('page_link_color', to, '.wrapper a, .post-footer span, nav.posts, nav.post-pages, nav.posts-paged, nav.comments-paged', 'color')
			inkblot_color('page_link_color', to, 'blockquote', 'hr, pre, th, td, fieldset, input, textarea, .post-footer, .comment, .comment .comment, .pingback, .trackback, .bypostauthor', 'border-color')
			
			inkblot_color('header_textcolor', $('wbr.inkblot').data('header-textcolor'), '.banner > a', 'color')
			inkblot_color('trim_link_color', $('wbr.inkblot').data('trim-link-color'), '.banner nav:before, .banner nav a, .banner select, .contentinfo a, .post-webcomic nav a', 'color')
		)
	)
	
	wp.customize('page_link_opacity', (value)->
		value.bind((to)->
			inkblot_color('page_link_opacity', to, '.wrapper a, .post-footer span, nav.posts, nav.post-pages, nav.posts-paged, nav.comments-paged', 'color')
			inkblot_color('page_link_opacity', to, 'blockquote', 'hr, pre, th, td, fieldset, input, textarea, .post-footer, .comment, .comment .comment, .pingback, .trackback, .bypostauthor', 'border-color')
			
			inkblot_color('header_textcolor', $('wbr.inkblot').data('header-textcolor'), '.banner > a', 'color')
			inkblot_color('trim_link_color', $('wbr.inkblot').data('trim-link-color'), '.banner nav:before, .banner nav a, .banner select, .contentinfo a, .post-webcomic nav a', 'color')
		)
	)
	
	wp.customize('page_link_hover_color', (value)->
		value.bind((to)->
			inkblot_color('page_link_hover_color', to, '.wrapper a:focus, .wrapper a:hover', 'color')
			inkblot_color('page_link_hover_color', to, 'input:focus, input:hover, textarea:focus, textarea:hover', 'border-color')
			
			inkblot_color('header_textcolor', $('wbr.inkblot').data('header-textcolor'), '.banner > a:focus, .banner > a:hover', 'color')
			inkblot_color('trim_link_hover_color', $('wbr.inkblot').data('trim-link-hover-color'), '.banner nav:focus:before, .banner nav:hover:before, .banner nav a:focus, .banner nav a:hover, .banner select:focus, .banner select:hover, .banner li:focus > a, .banner li:hover > a, .banner li.current_page_item > a, .banner li.current_page_ancestor > a, .contentinfo a:focus, .contentinfo a:hover, .post-webcomic nav a:focus, .post-webcomic nav a:hover', 'color')
		)
	)
	
	wp.customize('page_link_hover_opacity', (value)->
		value.bind((to)->
			inkblot_color('page_link_hover_opacity', to, '.wrapper a:focus, .wrapper a:hover', 'color')
			inkblot_color('page_link_hover_opacity', to, 'input:focus, input:hover, textarea:focus, textarea:hover', 'border-color')
			
			inkblot_color('header_textcolor', $('wbr.inkblot').data('header-textcolor'), '.banner > a:focus, .banner > a:hover', 'color')
			inkblot_color('trim_link_hover_color', $('wbr.inkblot').data('trim-link-hover-color'), '.banner nav:focus:before, .banner nav:hover:before, .banner nav a:focus, .banner nav a:hover, .banner select:focus, .banner select:hover, .banner li:focus > a, .banner li:hover > a, .banner li.current_page_item > a, .banner li.current_page_ancestor > a, .contentinfo a:focus, .contentinfo a:hover, .post-webcomic nav a:focus, .post-webcomic nav a:hover', 'color')
		)
	)
	
	wp.customize('trim_link_color', (value)->
		value.bind((to)->
			inkblot_color('trim_link_color', to, '.banner nav:before, .banner nav a, .banner select, .contentinfo a, .post-webcomic nav a', 'color')
		)
	)
	
	wp.customize('trim_link_opacity', (value)->
		value.bind((to)->
			inkblot_color('trim_link_opacity', to, '.banner nav:before, .banner nav a, .banner select, .contentinfo a, .post-webcomic nav a', 'color')
		)
	)
	
	wp.customize('trim_link_hover_color', (value)->
		value.bind((to)->
			inkblot_color('trim_link_hover_color', to, '.banner nav:focus:before, .banner nav:hover:before, .banner nav a:focus, .banner nav a:hover, .banner select:focus, .banner select:hover, .banner li:focus > a, .banner li:hover > a, .banner li.current_page_item > a, .banner li.current_page_ancestor > a, .contentinfo a:focus, .contentinfo a:hover, .post-webcomic nav a:focus, .post-webcomic nav a:hover', 'color')
		)
	)
	
	wp.customize('trim_link_hover_opacity', (value)->
		value.bind((to)->
			inkblot_color('trim_link_hover_opacity', to, '.banner nav:focus:before, .banner nav:hover:before, .banner nav a:focus, .banner nav a:hover, .banner select:focus, .banner select:hover, .banner li:focus > a, .banner li:hover > a, .banner li.current_page_item > a, .banner li.current_page_ancestor > a, .contentinfo a:focus, .contentinfo a:hover, .post-webcomic nav a:focus, .post-webcomic nav a:hover', 'color')
		)
	)
	
	#===== CSS ================================================================#
	
	wp.customize('css', (value)->
		value.bind((to)->
			$('head style.inkblot-custom').remove();
			
			if to
				$('head').append('<style class="inkblot-custom">' + to + '</style>');
		)
	)
	
	#===== Fonts ==============================================================#
	
	##
	# Append font stylesheets for customization preview.
	# 
	# @param string to Font to append.
	# @param string selectors HTML element selectors to update.
	# @return null
	##
	inkblot_font = (to, selectors)->
		if '' == to
			$(selectors).css('font-family', 'inherit')
		else
			$('head').append('<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=' + to + '">')
			$(selectors).css('font-family', to.replace(/\+/g, ' ').substr(0, to.indexOf(':')))
	
	wp.customize('font_size', (value)->
		value.bind((to)->
			$('body').css('font-size', to + '%')
		)
	)
	
	wp.customize('font', (value)->
		value.bind((to)->
			inkblot_font(to, 'body')
		)
	)
	
	wp.customize('header_font', (value)->
		value.bind((to)->
			inkblot_font(to, '.banner > a')
		)
	)
	
	wp.customize('page_font', (value)->
		value.bind((to)->
			inkblot_font(to, '.wrapper')
		)
	)
	
	wp.customize('title_font', (value)->
		value.bind((to)->
			inkblot_font(to, 'h1:not(.banner h1), h2, h3, h4, h5, h6')
		)
	)
	
	wp.customize('trim_font', (value)->
		value.bind((to)->
			inkblot_font(to, '.banner nav, .banner select, .contentinfo, .post-webcomic nav')
		)
	)
	
	#===== Layout =============================================================#
	
	##
	# Update layout dimensions.
	# 
	# @return null
	##
	inkblot_update_layout = ()->
		width = 100
		content = $('wbr.inkblot').data('content')
		sidebar1 = Number($('wbr.inkblot').data('sidebar1-width'))
		sidebar2 = Number($('wbr.inkblot').data('sidebar2-width'))
		
		if -1 != content.indexOf('three')
			width -= sidebar1 + sidebar2 + 2
		else if -1 != content.indexOf('two')
			width -= sidebar1 + 1
		
		if 'three-column-center' == content
			$('main ').css(
				left: sidebar1 + 1 + '%'
				position: 'relative'
			)
			
			$('.sidebar1').css(
				left: '-' + width + '%'
				position: 'relative'
			)
		else
			$('main ').css(
				left: '0'
				position: 'static'
			)
			
			$('.sidebar1').css(
				left: '-' + width + '%'
				position: 'static'
			)
		
		$('main').css('width', width + '%')
		$('.sidebar1').css('width', sidebar1 + '%')
		$('.sidebar2').css('width', sidebar2 + '%')
		
		$('body').removeClass('one-column two-column-left two-column-right three-column-left three-column-right three-column-center').addClass(content)
	
	wp.customize('content', (value)->
		value.bind((to)->
			$('wbr.inkblot').data('content', to)
			
			inkblot_update_layout()
		)
	)
	
	wp.customize('sidebar1_width', (value)->
		value.bind((to)->
			$('wbr.inkblot').data('sidebar1-width', to)
			
			inkblot_update_layout()
		)
	)
	
	wp.customize('sidebar2_width', (value)->
		value.bind((to)->
			$('wbr.inkblot').data('sidebar2-width', to)
			
			inkblot_update_layout()
		)
	)
	
	wp.customize('min_width', (value)->
		value.bind((to)->
			$('.wrapper, .document-header, .document-footer').css('min-width', if 0 < Number(to) then to + 'px' else '')
		)
	)
	
	wp.customize('max_width', (value)->
		value.bind((to)->
			$('.wrapper, .document-header, .document-footer').css('max-width', if 0 < Number(to) then to + 'px' else '')
		)
	)
	
	#===== Title ==============================================================#
	
	wp.customize('blogname', (value)-> 
		value.bind((to)->
			$('.banner h1').html(to)
		)
	)
	
	wp.customize('blogdescription', (value)->
		value.bind((to)->
			$('.banner > a > p').html(to)
		)
	)
	
	wp.customize('header_textcolor', (value)->
		value.bind((to)->
			$('.banner h1, .banner p').toggle('blank' != to)
		)
	)
	
	#===== Webcomic ===========================================================#
	
	wp.customize('webcomic_resize', (value)->
		value.bind((to)->
			$('.post-webcomic .webcomic-image').toggleClass('scroll', !to)
		)
	)
	
	wp.customize('webcomic_nav_above', (value)->
		value.bind((to)->
			$('.post-webcomic nav.above').toggle(to)
		)
	)
	
	wp.customize('webcomic_nav_below', (value)->
		value.bind((to)->
			$('.post-webcomic nav.below').toggle(to)
		)
	)
)(jQuery)