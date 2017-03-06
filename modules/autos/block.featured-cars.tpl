{if isset($car_blocks_data.featured)}
	<div class="ia-items featured-cars p-t-md p-b-md">
		<div class="container">
		<div class="sec-header">
			<h4 class="box__caption"><span class="fa fa-star"></span> {$block.title}</h4>
			<div class="sec-header__actions">
				<!-- actions can be here. use <a> tag -->
			</div>
		</div>
			<div class="row">
				{foreach $car_blocks_data.featured as $item}
					<div class="col-md-3">
						<div class="ia-card -{$item.status} {if 'hidden' == $item.status}-hidden{/if}">

							{if !empty($item.pictures)}
								<a class="ia-card__image" href="{$item.link}">
									{ia_image file=$item.pictures[0] title=$item.model type='thumbnail'}

									<span class="ia-card__sup-info"><span class="fa fa-camera"></span> {$item.pictures_num}</span>
								</a>
							{/if}

							<div class="ia-card__content">
								<a class="ia-card__title" href="{$item.link}">{$item.model}, {$item.release_year}</a>
								<p class="ia-card__price">{$item.price_formatted}</p>
								<p class="ia-card__info">
									{if $item.mileage}<span class="fa fa-tachometer"></span> <b>{$item.mileage}</b>, {/if}
									{if $item.engine_size}
										{lang key="field_autos_engine"} {$item.engine_size},
									{/if}
									{if $item.transmission}
										{lang key="field_autos_transmission+{$item.transmission}"}, 
									{/if}
									{lang key="field_autos_exterior_color+{$item.exterior_color}"}
								</p>
							</div>
						</div>
					</div>

					{if $item@iteration % 4 == 0 && !$item@last}
						</div>
						<div class="row">
					{/if}
				{/foreach}
			</div>
		</div>
	</div>
{/if}