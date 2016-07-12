{if isset($item.relatedAutos) && $item.relatedAutos}
	<div class="box box--border box--related">
		<h4 class="box__caption">Похожие авто на продажу</h4>
		<div class="box__content">
			{foreach $item.relatedAutos as $listing}
				<div class="ia-card">

					{if $listing.auto_pictures}
						<a class="ia-card__image" href="{$listing.link}">
							{printImage imgfile=$listing.auto_pictures[0]['path'] title=$listing.model}

							<span class="ia-card__sup-info"><span class="fa fa-camera"></span> {$listing.auto_pictures_num}</span>
						</a>
					{else}
						<a class="ia-card__image" href="{$listing.link}">
							<img src="{$img}no-car-preview.png" alt="">
						</a>
					{/if}

					<div class="ia-card__content">
						<a class="ia-card__title" href="{$listing.link}">{$listing.model}</a>
						<p class="ia-card__price">{$listing.price_formatted}</p>
						<p class="ia-card__info">
							{$listing.release_year}{if $listing.mileage}, {$listing.mileage} км{/if}{if $listing.transmission}, {lang key="field_transmission_{$listing.transmission}"}{/if}
						</p>
					</div>
				</div>
			{/foreach}
		</div>
	</div>
{/if}