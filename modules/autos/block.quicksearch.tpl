<div class="search">
	<div class="container">
		<button class="q-search-toggle collapsed" type="button" data-toggle="collapse" data-target="#search-collapse"><span class="fa fa-search"></span> {lang key='search'}</button>
		<div class="q-search collapse" id="search-collapse">
			<div class="q-search__tabs">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab_find" data-toggle="tab">{lang key='cars'}</a></li>
					<li><a href="#tab_makes" data-toggle="tab">{lang key='makes'}</a></li>
					<li class="nav-tabs__links"><a href="{$core.packages.autos.url}popular/">{lang key='qsearch_popular'}</a></li>
					<li class="nav-tabs__links"><a href="{$core.packages.autos.url}latest/">{lang key='qsearch_latest'}</a></li>
					<li class="nav-tabs__links"><a href="{$core.packages.autos.url}featured/">{lang key='qsearch_featured'}</a></li>
				</ul>
			</div>

			<div class="tab-content">
				<div class="tab-pane active" id="tab_find">
					<div class="b-search-q-links">
						<span class="hidden-xs hidden-sm">{lang key='search_for_cars'}:</span>
						<a class="link-dots pull-right hidden-xs hidden-sm js-clear-search" href="#">{lang key='reset'}</a>
						<a class="link-dots pull-right js-toggle-search" data-text-show="{lang key='adv_search'}" data-text-hide="{lang key='adv_search_hide'}" href="#" rel="nofollow">{lang key='adv_search'}</a>
					</div>

					{if isset($car_blocks_data.search)}
						<form class="b-search-form" action="{$smarty.const.IA_URL}search/cars/">
							<div class="b-search">
								<div class="b-search__cell b-search__cell--make">
									<div class="form-group">
										<!-- <label for="" class="control-label visible-xs">{lang key='make'}</label> -->
										<select class="form-control js-car-make" name="mk">
											<option value="">{lang key='make'}</option>
											{foreach $car_blocks_data.search.categories as $item}
												<option value="{$item.id}"{if isset($smarty.get.mk) && $smarty.get.mk == $item.id} selected{/if}>{$item.name|escape:'html'}</option>
											{/foreach}
										</select>
									</div>
								</div>
								<div class="b-search__cell b-search__cell--model">
									<div class="form-group">
										<!-- <label for="" class="control-label visible-xs">{lang key='model'}</label> -->
										<div class="q-search__loader"><div class="loader"></div></div>
										<select name="md" class="form-control js-car-model" data-id="{if isset($smarty.get.md)}{$smarty.get.md}{/if}" disabled data-spinner=".q-search__loader">
											<option value="">{lang key='model'}</option>
										</select>
									</div>
								</div>
								<div class="b-search__cell b-search__cell--price-f">
									<div class="form-group">
										<!-- <label for="" class="control-label visible-xs">{lang key='as_price_min'}</label> -->
										<input class="form-control" type="text" placeholder="{lang key='as_price_min'}" name="price[f]" value="{if isset($smarty.get.price['f'])}{$smarty.get.price['f']}{else}{/if}">
									</div>
								</div>
								<div class="b-search__cell b-search__cell--price-t">
									<div class="form-group">
										<!-- <label for="" class="control-label visible-xs">{lang key='as_price_max'}</label> -->
										<input class="form-control" type="text" placeholder="{lang key='as_price_max'}" name="price[t]" value="{if isset($smarty.get.price['t'])}{$smarty.get.price['t']}{else}{/if}">
									</div>
								</div>
								<div class="b-search__cell b-search__cell--year-f">
									<div class="form-group">
										<!-- <label for="" class="control-label visible-xs">{lang key='as_year_min'}</label> -->
										<select class="form-control" name="year[f]">
											<option value="">{lang key='as_year_min'}</option>
											{foreach range($smarty.server.REQUEST_TIME|date_format:'%Y',1950) as $year}
												<option value="{$year}"
													{if isset($smarty.get.year['f']) && $year == $smarty.get.year['f']}selected{/if}
												>
													{$year}
												</option>
											{/foreach}
										</select>
									</div>
								</div>
								<div class="b-search__cell b-search__cell--price-t">
									<div class="form-group">
										<!-- <label for="" class="control-label visible-xs">{lang key='as_year_max'}</label> -->
										<select class="form-control" name="year[t]">
											<option value="">{lang key='as_year_max'}</option>
											{foreach range($smarty.server.REQUEST_TIME|date_format:'%Y',1951) as $year}
												<option value="{$year}"
													{if isset($smarty.get.year['t']) && $year == $smarty.get.year['t']}selected{/if}
												>
													{$year}
												</option>
											{/foreach}
										</select>
									</div>
								</div>
								<div class="b-search__cell b-search__cell--btn">
									<button class="btn btn-primary btn-block" type="submit"><span class="fa fa-search"></span> <span class="visible-sm-inline">{lang key='search'}</span></button>
								</div>
							</div>

							<div class="b-search-more">
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label for="" class="control-label">{lang key='field_autos_body_type'}</label>
											<select class="form-control" name="body">
												<option value="">{lang key='_select_'}</option>
												{foreach $car_blocks_data.search.body_types as $key => $value}
													<option value="{$key}"{if isset($smarty.get.body) && $smarty.get.body == $key} selected{/if}>{$value}</option>
												{/foreach}
											</select>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label for="" class="control-label">{lang key='field_autos_transmission'}</label>
											<select class="form-control" name="transmission">
												<option value="">{lang key='_select_'}</option>
												{foreach $car_blocks_data.search.transmission as $key => $value}
													<option value="{$key}"{if isset($smarty.get.transmission) && $smarty.get.transmission == $key} selected{/if}>{$value}</option>
												{/foreach}
											</select>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label for="" class="control-label">{lang key='field_autos_drive_type'}</label>
											<select class="form-control" name="drive_type">
												<option value="">{lang key='_select_'}</option>
												{foreach $car_blocks_data.search.drive_type as $key => $value}
													<option value="{$key}"{if isset($smarty.get.drive_type) && $smarty.get.drive_type == $key} selected{/if}>{$value}</option>
												{/foreach}
											</select>
										</div>
									</div>
									
									<div class="col-sm-3">
										<div class="form-group">
											<label for="" class="control-label">{lang key='field_autos_exterior_color'}</label>
											<select class="form-control" name="exterior_color">
												<option value="">{lang key='_select_'}</option>
												{foreach $car_blocks_data.search.exterior_color as $key => $value}
													<option value="{$key}"{if isset($smarty.get.exterior_color) && $smarty.get.exterior_color == $key} selected{/if}>{$value}</option>
												{/foreach}
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label for="" class="control-label">{lang key='as_mileage_max'}</label>
											<input type="hidden" name="mileage[f]" value="">
											<input class="form-control" placeholder="" type="text" name="mileage[t]" value="{if isset($smarty.get.mileage['t'])}{$smarty.get.mileage['t']}{else}{/if}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label for="" class="control-label">{lang key='field_autos_fuel_type'}</label>
											<select class="form-control" name="fuel_type">
												<option value="">{lang key='_select_'}</option>
												{foreach $car_blocks_data.search.fuel_types as $key => $value}
													<option value="{$key}"{if isset($smarty.get.fuel_type) && $smarty.get.fuel_type == $key} selected{/if}>{$value}</option>
												{/foreach}
											</select>
										</div>
									</div>
									<div class="col-sm-2">
										<div class="form-group has-checkbox">
											<label class="checkbox">
												<input type="checkbox" name="auto_pictures" value="1" {if isset($smarty.get.auto_pictures)}checked{/if}>
												{lang key='with_pictures_only'}
											</label>
										</div>
									</div>
									<div class="col-sm-2">
										
									</div>
									<div class="col-sm-2">
										<div class="form-group">
											<label for="" class="control-label hidden-xs hidden-sm">&nbsp;</label>
											<button class="btn btn-primary btn-block" type="submit"><span class="fa fa-search"></span> {lang key='search'}</button>
										</div>
									</div>
								</div>
							</div>
						</form>

						{ia_add_js}
$(function() {
	$('.js-toggle-search').click(function(e) {
		e.preventDefault();

		var $this = $(this),
			$searchBlock = $('.b-search-more'),
			$btnSubmit = $('.b-search-form .b-search__cell--btn');

		if (!$searchBlock.hasClass('is-visible')) {
			$searchBlock.addClass('is-visible');
			$this.text($this.data('text-hide'));
			$btnSubmit.hide();
		} else {
			$searchBlock.removeClass('is-visible');
			$this.text($this.data('text-show'));
			$btnSubmit.show();
		}
	});

	$('.js-clear-search').click(function(e) {
		e.preventDefault();

		$('.b-search-form input[type="text"]').val('');
		$('.b-search-form input[type="checkbox"]').prop('checked', false);
		$('.b-search-form select').val('');
	})
});
						{/ia_add_js}
					{/if}
				</div>
				<div class="tab-pane" id="tab_makes">
					{ia_blocks block='popular_makes'}
				</div>
			</div>
		</div>
	</div>
</div>

{ia_add_js}
$(function()
{
	var $modelSelect = $('.js-car-model'),
		$makeSelect = $('.js-car-make'),
		$spinner = $($modelSelect.data('spinner'));

	$('.js-car-make').on('change', function(e)
	{
		if ('' != $makeSelect.val()) {
			var value = $(this).val();

			$modelSelect.val(0).prop('disabled', true).find('option:not(:first)').remove();

			if (value != '')
			{
				$spinner.show();

				$.getJSON(intelli.config.packages.autos.url + 'models.json?fn=?', { pid: value }, function(response)
				{
					if (response && response.length > 0)
					{
						var d = $modelSelect.data('id');
						$.each(response, function(index, item)
						{
							var $option = $('<option>').val(item.id).html(item.title);
							if (d == item.id) $option.attr('selected', true);
							$modelSelect.append($option);
						});

						$modelSelect.prop('disabled', false);
					}

					$spinner.css('display', 'none');
				});
			}
			else {
				$modelSelect.prop('disabled', true);
			}
		}
	}).change();
});
{/ia_add_js}