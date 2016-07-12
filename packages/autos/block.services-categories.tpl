{if isset($car_blocks_data.serviceCategories)}
	<div class="sec-header">
		<h4 class="box__caption">{$block.title}</h4>
		<div class="sec-header__actions">
			<a href="{$smarty.const.IA_URL}services/" class="btn btn-xs btn-default">{lang key='all_services'}</a>
			<a href="{$smarty.const.IA_URL}service/add/" class="btn btn-xs btn-success">{lang key='add_service'}</a>
		</div>
	</div>

	{if isset($car_blocks_data.latestServices) && $car_blocks_data.latestServices}
		<div class="owl-carousel sl sl-services">
			{foreach $car_blocks_data.latestServices as $latestService}
				<div class="ia-card">
					{if $latestService.logo}
						<a class="ia-card__image" href="{$latestService.link}">
							{printImage imgfile=$latestService.logo.path title=$latestService.title}
						</a>
					{elseif $latestService.pictures}
						<a class="ia-card__image" href="{$latestService.link}">
							{printImage imgfile=$latestService.pictures[0].path title=$latestService.title}
						</a>
					{else}
						<a class="ia-card__image" href="{$latestService.link}">
							<img src="{$img}no-car-preview.png" alt="">
						</a>
					{/if}

					<div class="ia-card__content">
						<a class="ia-card__title" href="{$latestService.link}">{$latestService.title|truncate:45:'...'}</a>
						<p class="ia-card__price"><span class="fa fa-phone"></span> {$latestService.company_phone}</p>
						{if $latestService.company_address}<p class="ia-card__info">{$latestService.company_address}</p>{/if}
					</div>
				</div>
			{/foreach}
		</div>
		<hr>

		{ia_print_js files='_IA_TPL_owl.carousel.min'}
		{ia_add_js}
$(function() {
	var owlOptions = {
		items: 4,
		margin: 15,
		dots: true,
		nav: true,
		navText: ['<span class="icon-arrow-left2"></span>','<span class="icon-arrow-right2"></span>'],
		responsive: {
			0: {
				items: 1
			},
			500: {
				items: 2
			},
			768: {
				items: 4
			}
		}
	}

	$('.sl-services').owlCarousel(owlOptions);
});
		{/ia_add_js}
	{/if}

	<div class="ia-categories hidden-sm hidden-xs">
		<div class="row ia-cats">
			{$catsPerCol = ceil(count($car_blocks_data.serviceCategories)/3)}

			<div class="col-md-4">
				{foreach $car_blocks_data.serviceCategories as $name => $entry}
					<div class="ia-cat">
						<a href="{$smarty.const.IA_URL}services/{$entry.alias}">{$entry.title|escape:'html'}</a>
					</div>

					{if $entry@iteration % $catsPerCol == 0 && !$entry@last}
						</div>
						<div class="col-md-4">
					{/if}
				{/foreach}
			</div><!-- /col -->
		</div><!-- /row -->
	</div>
{/if}