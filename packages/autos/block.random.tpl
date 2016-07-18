{if isset($car_blocks_data.random)}
	<div class="random-cars">
		<div class="container">
			<h4 class="box__caption">{$block.title}</h4>
			<div class="owl-carousel ia-carousel js-carousel-random">
				{foreach $car_blocks_data.random as $item}
					<div class="ia-carousel__item">
						<div class="ia-card">
							{if $item.auto_pictures}
								<a class="ia-card__image" href="{$item.link}">
									{if $item.auto_pictures[0]['path'] == 'a'}
										<img src="{$img}no-car-preview.png" alt="">
									{else}
										{printImage imgfile=$item.auto_pictures[0]['path'] title=$item.model}
										<span class="ia-card__sup-info"><span class="fa fa-camera"></span> {$item.auto_pictures_num}</span>
									{/if}
								</a>
							{else}
								<a class="ia-card__image" href="{$item.link}">
									<img src="{$img}no-car-preview.png" alt="">
								</a>
							{/if}

							<div class="ia-card__content">
								<a class="ia-card__title" href="{$item.link}">{$item.model}</a>
								<p class="ia-card__price">{$item.price_formatted}</p>
								<p class="ia-card__info">
									{$item.release_year}{if $item.mileage}, {$item.mileage} км{/if}{if $item.transmission}, {lang key="field_transmission_{$item.transmission}"}{/if}
								</p>
							</div>
						</div>
					</div>
				{/foreach}
			</div>
		</div>
	</div>

	{ia_add_js}
$(function() {
	$('.js-carousel-random').owlCarousel({
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
{/if}