<?php
/**
 * Header template.
 * 
 * @package Inkblot
 * @see http://codex.wordpress.org/Template_Hierarchy
 */
?>
<!DOCTYPE html>
<html <?php language_attributes(); ?> class="no-js">
	<head><?php wp_head(); /* @see `inkblot_wp_head()` in `functions.php` */ ?></head>
	<body id="document" <?php body_class(); ?>>
		<a href="#content">Skip to content</a>
		<?php print inkblot_widgetized('document-header'); ?>
		<div id="page">
			<?php print inkblot_widgetized('page-header'); ?>
			<header id="header" role="banner">
				<a href="<?php print esc_url(home_url()); ?>" rel="home">
					<h1><?php bloginfo('name'); ?></h1>
					<p><?php bloginfo('description'); ?></p>
					
					<?php if ($header = get_custom_header() and $header->url) : ?>
						<img src="<?php header_image(); ?>" width="<?php print $header->width; ?>" height="<?php print $header->height; ?>" alt="">
					<?php endif; ?>
					
				</a>
				<nav>
					
					<?php
						wp_nav_menu(array(
							'theme_location' => 'primary',
							'show_home' => true,
							'container' => false
						));
						
						if (get_theme_mod('responsive_width', 0) or is_customize_preview()) {
							if (has_nav_menu('primary')) {
								wp_nav_menu(array(
									'theme_location' => 'primary',
									'show_home' => true,
									'container' => false,
									'items_wrap' => '<select>%3$s</select>',
									'walker' => new Inkblot_Walker_Menu_Dropdown
								));
							} else {
								print '<select>';
								
								wp_list_pages(array(
									'title_li' => '',
									'walker' => new Inkblot_Walker_Page_Dropdown
								));
								
								print '</select>';
							}
						}
					?>
					
				</nav>
			</header><!-- #header -->
			<div id="content">
				<?php print inkblot_widgetized('content-header'); ?>