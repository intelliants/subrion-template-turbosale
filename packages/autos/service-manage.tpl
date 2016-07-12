{if iaCore::ACTION_EDIT == $pageAction}
	<div class="tool-buttons text-right m-b">
		<a class="btn btn-sm btn-info" href="{ia_url type='url' item='autos_services' action='view' data=$item}">Страница объявления <span class="icon-arrow-right2"></span></a>
	</div>
{/if}

<div class="ia-form-info">
	<p>Срок публикации объявления на сайте — 25 дней.</p>
	<p>Поля, обязательные к заполнению, помечены <span class="text-danger">*</span> (звёздочкой)</p>
</div>

<form method="post" action="{$smarty.const.IA_SELF}" enctype="multipart/form-data" class="ia-form ia-form-services">
	{preventCsrf}

	{capture append='fieldset_before' name='autos_services_general'}
		{include file='plans.tpl' item=$item}
	{/capture}

	{capture append='field_before' name='categories'}
		<div class="ia-form-services__wrp">
			<div class="ia-form-services__wrp__inner">
	{/capture}
	{capture append='field_after' name='categories'}
			</div>
			<div class="ia-form-services__wrp__inner">
	{/capture}
	{capture append='field_after' name='pictures'}
			</div>
		</div>
	{/capture}

	{capture append='field_after' name='company_address'}
		<div class="form-group fieldzone regular">
			<label for="field_title">Укажите адрес на карте:</label>
			<p class="help-block">Не указывайте адрес и расположение на карте если ваша услуга выполняется с выездом.</p>
			<input type="hidden" name="company_lat" value="{if isset($item.company_lat)}{$item.company_lat}{/if}">
			<input type="hidden" name="company_long" value="{if isset($item.company_long)}{$item.company_long}{/if}">

			<div id="dg-map" style="height:300px;width: 100%;"></div>

			<script src="http://maps.api.2gis.ru/2.0/loader.js?pkg=full"></script>

			{ia_add_js}
$(function() {
	DG.then(function() {
		var map,
			marker,
			pos = {if isset($item.company_lat) && $item.company_lat}[{$item.company_lat}, {$item.company_long}]{else}[42.869, 74.611]{/if};

		map = DG.map('dg-map', {
			center: pos,
			zoom: 15
		});

		marker = DG.marker(pos, {
			draggable: true
		}).addTo(map).bindLabel('Перетащи меня!', {
			static: true
		});

		marker.on('drag', function(e) {
			var lat = e.target._latlng.lat,
				lng = e.target._latlng.lng;

			setCoordsVals(lat, lng);
		});

		map.on('click', function(e) {
			var lat = e.latlng.lat,
				lng = e.latlng.lng;

			marker.setLatLng([lat, lng]);
			setCoordsVals(lat, lng);
		});

		function setCoordsVals(lat, lng) {
			$('input[name="company_lat"]').val(lat);
			$('input[name="company_long"]').val(lng);
		}
	});
});
			{/ia_add_js}
		</div>
	{/capture}

	{include file='item-view-tabs.tpl'}

	<div class="ia-form__after-tabs">
		{include file='captcha.tpl'}

		<div class="fieldset__actions">
			<button type="submit" name="data-service" class="btn btn-primary ladda-button" data-style="expand-right"><span class="ladda-label">{lang key='submit'}</span></button>
		</div>
	</div>
</form>

{ia_hooker name='smartyListingSubmitBeforeFooter'}