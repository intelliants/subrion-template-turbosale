{if isset($car_blocks_data.sponsored)}
	<div class="sec-header">
		<h4 class="box__caption"><span class="icon-fire2"></span> {$block.title}</h4>
		<div class="sec-header__actions">
			<!-- <a href="{$smarty.const.IA_URL}about/" class="link">Как сюда попасть?</a> -->
		</div>
	</div>
	<div class="row">
		{foreach $car_blocks_data.sponsored as $item}
			<div class="col-md-2">
				<div class="ia-card ia-card--with-f-content">

					{if $item.auto_pictures}
						<a class="ia-card__image" href="{$item.link}">
							{printImage imgfile=$item.auto_pictures[0]['path'] title=$item.model}

							<span class="ia-card__sup-info"><span class="fa fa-camera"></span> {$item.auto_pictures_num}</span>
						</a>
					{else}
						<a class="ia-card__image" href="{$item.link}">
							<img src="{$img}no-car-preview.png" alt="">
						</a>
					{/if}

					<div class="ia-card__f-content">
						<a class="ia-card__title" href="{$item.link}">{$item.model}</a>
						<p class="ia-card__price">{$item.price_formatted}</p>
						<p class="ia-card__info visible-sm visible-xs">
							{$item.release_year}{if $item.mileage}, {$item.mileage} км{/if}{if $item.transmission}, {lang key="field_transmission_{$item.transmission}"}{/if}
						</p>
					</div>
				</div>
			</div>

			{if $item@iteration == 6}
				{break}
			{/if}
		{/foreach}
	</div>
{/if}
