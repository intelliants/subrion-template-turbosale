{if isset($car_blocks_data.partCategories)}
	<div class="sec-header">
		<h4 class="box__caption">{$block.title}</h4>
		<div class="sec-header__actions">
			<a href="{$smarty.const.IA_URL}parts/" class="btn btn-xs btn-default">{lang key='all_parts'}</a>
			<a href="{$smarty.const.IA_URL}part/add/" class="btn btn-xs btn-success">{lang key='add_part'}</a>
		</div>
	</div>

	{if isset($car_blocks_data.latestParts) && $car_blocks_data.latestParts}
		<div class="owl-carousel sl sl-parts">
			{foreach $car_blocks_data.latestParts as $latestPart}
				<div class="ia-card">
					{if $latestPart.pictures}
						<a class="ia-card__image" href="{$latestPart.link}">
							{printImage imgfile=$latestPart.pictures[0]['path'] title=$latestPart.part_title}
						</a>
					{else}
						<a class="ia-card__image" href="{$latestPart.link}">
							<img src="{$img}no-car-preview.png" alt="">
						</a>
					{/if}

					<div class="ia-card__content">
						<a class="ia-card__title" href="{$latestPart.link}">{$latestPart.part_title|truncate:45:'...'}</a>
						{if 'buy' != $latestPart.part_type}
							<p class="ia-card__price">{$latestPart.price} сом</p>
						{else}
							<p class="ia-card__price">Куплю</p>
						{/if}
						<p class="ia-card__info">
							{$cats = explode(',', $latestPart.categories)}

							{foreach $cats as $cat}
								{lang key="field_autos_parts_categories_{$cat}"}
							{/foreach}
						</p>
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

	$('.sl-parts').owlCarousel(owlOptions);
});
		{/ia_add_js}
	{/if}

	<div class="ia-categories hidden-sm hidden-xs">
		<div class="row ia-cats">
			{$catsPerCol = ceil(count($car_blocks_data.partCategories)/3)}

			<div class="col-md-4">
				{foreach $car_blocks_data.partCategories as $name => $entry}
					<div class="ia-cat">
						<a href="{$smarty.const.IA_URL}parts/{$entry.alias}">{$entry.title|escape:'html'}</a>
					</div>

					{if $entry@iteration % $catsPerCol == 0 && !$entry@last}
						</div>
						<div class="col-md-4">
					{/if}
				{/foreach}
			</div>
		</div>
	</div>
{/if}