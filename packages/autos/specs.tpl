{if $autoGenerations}
	<div class="row">
		<div class="col-md-5">
			<div class="box box--border box--specs">
				<h4 class="box__caption">Сведения о {$model.title}</h4>
				<div class="box__content">
					<ul class="spec-list">
					{foreach $autoGenerations as $generationKey => $generation}
						<li>
							<a href="{$smarty.const.IA_URL}catalog/{$autoModel.url}{$generationKey}/">{$generation.name} <span>{$generation.year_begin} - {$generation.year_end}</span></a>
							{if isset($generation.active) && $autoSeries}
								<ul>
									{foreach $autoSeries as $serieKey => $serie}
										<li>
											<a href="{$smarty.const.IA_URL}catalog/{$autoModel.url}{$generationKey}/{$serieKey}/">{$serie.name}</a>
											{if isset($serie.active) && $autoModifications}
												<ul>
													{foreach $autoModifications as $modificationKey => $modification}
														<li{if isset($modification.active)} class="active"{/if}>
															<a href="{$smarty.const.IA_URL}catalog/{$autoModel.url}{$generationKey}/{$serieKey}/{$modificationKey}/">{$modification.name}</a>
														</li>
													{/foreach}
												</ul>
											{/if}
										</li>
									{/foreach}
								</ul>
							{/if}
						</li>
					{/foreach}
					</ul>
				</div>
			</div>

			{if isset($similarCars) && $similarCars}
				<div class="box box--border">
					<h4 class="box__caption">{$model.title} на продажу</h4>
					<div class="box__content">
						{foreach $similarCars as $listing}
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
		</div>
		<div class="col-md-7">
			{if $parentCharacteristics && $autoCharacteristics}
				<div class="v-spec-section">
					<h3>Характеристики</h3>
				</div>
				
				<table class="v-spec-table">
					{foreach $parentCharacteristics as $key => $title}
						{if isset($autoCharacteristics.$key) && $autoCharacteristics.$key}
							<tr>
								<td colspan="3">
									<div class="v-item-info__section">
										<h4><i class="icon-{$key}"></i><span>{$title}</span></h4>
									</div>
								</td>
							</tr>
							{foreach $autoCharacteristics.$key as $characteristic}
								<tr class="v-spec-table__item">
									<td><span>{$characteristic.title}</span></td>
									<td>{str_replace(', ', ',<br>', $characteristic.value)} {$characteristic.unit}</td>
								</tr>
							{/foreach}
						{/if}
					{/foreach}
				</table>
			{/if}
		</div>
	</div>
{/if}