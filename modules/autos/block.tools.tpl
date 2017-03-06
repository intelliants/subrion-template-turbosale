{if $core.config.tools_as_floating_box}
	<div class="f-tools">
		<div class="f-tools__header js-toggle-tools"><span class="fa fa-gears"></span> {lang key='tools'}</div>
		<ul class="nav nav-tabs f-tools__nav">
			<li class="active"><a href="#tab-recently-viewed-cars" data-toggle="tab"><span class="fa fa-clock-o"></span> {lang key='recently_viewed'}</a></li>
			<li><a href="#tab-saved-cars" data-toggle="tab"><span class="fa fa-star text-warning"></span> {lang key='saved_cars'}</a></li>
			{if !$member}
				<li><a href="{$smarty.const.IA_URL}registration/">{lang key='register'} <span class="fa fa-external-link"></span></a></li>
			{/if}
			<li class="f-tools__nav__close"><a href="#"><span class="fa fa-times-circle"></span></a></li>
		</ul>
		<div class="f-tools__content">
			<div class="tab-content">
				<div class="tab-pane active" id="tab-recently-viewed-cars">
					{if $car_blocks_data.recently_viewed}
						<div class="owl-carousel f-tools__c js-f-tools-c1">
							{foreach $car_blocks_data.recently_viewed as $entry}
								<div class="f-tools__c__item">
									{if !empty($entry.pictures)}
										<a href="{$entry.link}" class="f-tools__c__item__image">{ia_image file=$entry.pictures[0] title=$entry.model|strip_tags|truncate:'30' width=60 type='thumbnail'}</a>
									{/if}

									<div class="f-tools__c__item__content">
										<h5 class="f-tools__c__item__title m-a-0">
											<a href="{$entry.link}">{$entry.model|strip_tags|truncate:'30'}</a>
										</h5>
										{if !empty($entry.price)}<p class="m-a-0"><span class="fa fa-tag"></span> {$core.config.currency} {$entry.price}</p>{/if}
									</div>
								</div>
							{/foreach}
						</div>

						{ia_add_js}
$(function() {
	$('.js-f-tools-c1').owlCarousel({
		items: 6,
		margin: 10,
		dots: false,
		nav: true,
		navText: ['<span class="fa fa-angle-left"></span>','<span class="fa fa-angle-right"></span>'],
		responsive: {
			0: {
				items: 1
			},
			320: {
				items: 2
			},
			500: {
				items: 3
			},
			768: {
				items: 6
			}
		}
	});
});
						{/ia_add_js}
					{else}
						<div class="alert alert-info">{lang key='no_recently_viewed_cars'}</div>
					{/if}
				</div>
				<div class="tab-pane" id="tab-saved-cars">
					{if $car_blocks_data.saved_listings}
						<div class="owl-carousel f-tools__c js-f-tools-c2">
							{foreach $car_blocks_data.saved_listings as $entry}
								<div class="f-tools__c__item">
									{if !empty($entry.pictures)}
										<a href="{$entry.link}" class="f-tools__c__item__image">{ia_image file=$entry.pictures[0] title=$entry.model|strip_tags|truncate:'30' width=60 type='thumbnail'}</a>
									{/if}

									<div class="ia-item__content">
										<h5 class="f-tools__c__item__title m-a-0">
											<a href="{$entry.link}">{$entry.model|strip_tags|truncate:'30'}</a>
										</h5>
										{if !empty($entry.price)}<p class="m-a-0"><span class="fa fa-tag"></span> {$core.config.currency} {$entry.price}</p>{/if}
									</div>
								</div>
							{/foreach}
						</div>

						{ia_add_js}
$(function() {
	$('a[href="#tab-saved-cars"]').on('shown.bs.tab', function() {
		$('.js-f-tools-c2').owlCarousel({
			items: 6,
			margin: 10,
			dots: false,
			nav: true,
			navText: ['<span class="fa fa-angle-left"></span>','<span class="fa fa-angle-right"></span>'],
			responsive: {
				0: {
					items: 1
				},
				320: {
					items: 2
				},
				500: {
					items: 3
				},
				768: {
					items: 6
				}
			}
		});
	});
});
						{/ia_add_js}
					{else}
						<div class="alert alert-info">{lang key='no_saved_cars'}</div>
					{/if}
				</div>
			</div>
		</div>
	</div>
	{ia_add_js}
$(function() {
	$('.js-toggle-tools').on('click', function() {
		var $ftools = $(this).parent();

		if (!$ftools.hasClass('is-visible')) {
			$ftools.animate({
				bottom: 0
			}, 'fast', function() {
				$ftools.addClass('is-visible');
			});
		} else {
			$ftools.animate({
				bottom: -157
			}, 'fast', function() {
				$ftools.removeClass('is-visible');
			});
		}
	});

	$('.f-tools__nav__close a').on('click', function(e) {
		e.preventDefault();

		var $ftools = $(this).closest('.f-tools');

		$ftools.animate({
			bottom: -157
		}, 'fast', function() {
			$ftools.removeClass('is-visible');
		});
	});
});
	{/ia_add_js}
{else}
	<div class="b-tools">
		<div class="b-tools__header">
			<ul class="nav nav-tabs">
				<li class="nav-tabs-title"><span>{lang key='tools'}</span></li>
				<li><a href="#tab-saved-cars" data-toggle="tab"><span class="fa fa-star text-warning"></span></a></li>
				<li class="active"><a href="#tab-recently-viewed-cars" data-toggle="tab"><span class="fa fa-clock-o"></span></a></li>
			</ul>
		</div>
		<div class="b-tools__content">
			<div class="tab-content">
				<div class="tab-pane active" id="tab-recently-viewed-cars">
					{if $car_blocks_data.recently_viewed}
						<div class="ia-items recently-viewed-cars">
							{foreach $car_blocks_data.recently_viewed as $entry}
								<div class="ia-item">
									{if !empty($entry.pictures)}
										<a href="{$entry.link}" class="ia-item__image">{ia_image file=$entry.pictures[0] title=$entry.model|strip_tags|truncate:'30' type='thumbnail'}</a>
									{/if}

									<div class="ia-item__content">
										<h5 class="ia-item__title">
											<a href="{$entry.link}">{$entry.model|strip_tags|truncate:'30'}</a>
										</h5>
										{if !empty($entry.price)}<p><span class="fa fa-tag"></span> {$core.config.currency} {$entry.price}</p>{/if}
									</div>
								</div>
							{/foreach}
						</div>
					{else}
						<div class="alert alert-info">{lang key='no_recently_viewed_cars'}</div>
					{/if}
				</div>
				<div class="tab-pane" id="tab-saved-cars">
					{if $car_blocks_data.saved_listings}
						<div class="ia-items saved-cars">
							{foreach $car_blocks_data.saved_listings as $entry}
								<div class="ia-item">
									{if !empty($entry.pictures)}
										<a href="{$entry.link}" class="ia-item__image">{ia_image file=$entry.pictures[0] title=$entry.model|strip_tags|truncate:'30' type='thumbnail'}</a>
									{/if}

									<div class="ia-item__content">
										<h5 class="ia-item__title">
											<a href="{$entry.link}">{$entry.model|strip_tags|truncate:'30'}</a>
										</h5>
										{if !empty($entry.price)}<p><span class="fa fa-tag"></span> {$core.config.currency} {$entry.price}</p>{/if}
									</div>
								</div>
							{/foreach}
						</div>
					{else}
						<div class="alert alert-info">{lang key='no_saved_cars'}</div>
					{/if}
				</div>
			</div>
		</div>
	</div>
{/if}