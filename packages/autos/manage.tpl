{if iaCore::ACTION_EDIT == $pageAction}
	<div class="tool-buttons text-right m-b">
		<a class="btn btn-sm btn-info" href="{ia_url type='url' item='autos' action='view' data=$item}">Страница объявления <span class="icon-arrow-right2"></span></a>
	</div>
{/if}

<div class="ia-form-info">
	<p>Срок публикации объявления на сайте — 25 дней.</p>
	<p>Поля, обязательные к заполнению, помечены <span class="text-danger">*</span> (звёздочкой)</p>
</div>

<form method="post" action="{$smarty.const.IA_SELF}" enctype="multipart/form-data" class="ia-form ia-form-auto">
	{preventCsrf}

	{* MANAGING LAYOUT WITH WRAPS *}

	{capture append='field_before' name='release_year'}
		<div class="ia-form-auto__wrp1">
	{/capture}
	{capture append='field_after' name='exchange'}
		</div>
	{/capture}

	{capture append='field_before' name='additional_info'}
		<div class="ia-form-auto__wrp2">
	{/capture}
	{capture append='field_after' name='additional_info'}
		</div>
	{/capture}

	{capture append='field_before' name='engine_size'}
		<div class="ia-form-auto__wrp1">
	{/capture}
	{capture append='field_after' name='drive_type'}
		</div>
	{/capture}

	{* // MANAGING LAYOUT WITH WRAPS *}

	{capture name='common' append='tabs_before'}
		{include file='plans.tpl' item=$item}

		<div class="fieldset" id="fieldgroup_make">
			<div class="fieldset__header">{lang key='model'} <span class="required">*</span></div>
			<div class="fieldset__content">
				<div class="form-group hidden">
					<input class="form-control" type="text" id="model-label" value="Модель не выбрана" disabled>
					<input type="hidden" name="category_id" value="{$item.model_id}">
				</div>
				<div class="form-group">
					<select class="form-control js-iad" data-children="{$children}">
						<option value="">{lang key='_select_'}</option>
						{foreach $models as $model}
							<option value="{$model.id}">{$model.title}</option>
						{/foreach}
					</select>
				</div>
			</div>
		</div>
	{/capture}

	{capture name='autos_general' append='fieldset_after'}
		<div class="fieldset">
			<div class="fieldset__header">{lang key='field_price'} <span class="required">*</span></div>
			<div class="fieldset__content">
				<div class="form-group">
					<div class="row">
						<div class="col-sm-6">
							<div class="input-group">
								<span class="input-group-addon">$</span>
								<input class="form-control js-price-input" type="number" value="{if isset($item.price) && $item.price}{$item.price}{/if}" name="price">
							</div>
						</div>
						<div class="col-sm-6">
							<p class="form-control-static">~ <b class="js-price-usd">{if isset($item.price) && $item.price > 0}{round($item.price * $core.config.autos_currency_rate)}{else}0{/if} сом</b> по курсу {$core.config.autos_currency_rate}</p>
						</div>
					</div>
					<p class="help-block">Указывайте цену в <b>долларах США</b>. Мы автоматически сконвертируем её в сомы для вас.</p>
				</div>
			</div>
		</div>

		{ia_add_js}
$(function() {
	var $priceInput = $('.js-price-input'),
		$usdInput   = $('.js-price-usd'),
		rate = {$core.config.autos_currency_rate};

	$priceInput.keydown(function (e) {
		// Allow: backspace, delete, tab, escape, enter and .
		if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110]) !== -1 ||
			 // Allow: Ctrl+A
			(e.keyCode == 65 && e.ctrlKey === true) ||
			 // Allow: Ctrl+C
			(e.keyCode == 67 && e.ctrlKey === true) ||
			 // Allow: Ctrl+X
			(e.keyCode == 88 && e.ctrlKey === true) ||
			 // Allow: home, end, left, right
			(e.keyCode >= 35 && e.keyCode <= 39)) {
				 // let it happen, don't do anything
				 return;
		}
		// Ensure that it is a number and stop the keypress
		if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
			e.preventDefault();
		}
	});

	$priceInput.on('keyup', function() {
		var price = parseInt($priceInput.val() * rate);
		$usdInput.text(price + ' сом');
	});
});
		{/ia_add_js}
	{/capture}

	{*-- START MOD // dartelov --*} {* autoregister on listing submission *}
	{if !iaUsers::hasIdentity()}
		{capture name='common' append='tabs_after'}
			<div class="fieldset " id="fieldgroup_owner">
				<div class="fieldset__header">Информация о владельце</div>
				<div class="fieldset__content">
					<div class="ia-form-info">
						<p>Вы не авторизованы на сайте. Мы рекомендуем создать профиль для того, чтобы видеть статистику просмотров ваших объявлений.</p>
						<p>Объявления от авторизованных пользователей отображаются выше в списке, чем объявления от имени Гость.</p>
					</div>
					<div class="row">
						{foreach ['name', 'email', 'phone'] as $field}
							<div class="col-md-4 form-group fieldzone regular" id="{$field}_fieldzone">
								<label for="field_owner_{$field}">
									{lang key=$field} <span class="is-required">*</span>
								</label>
								{if isset($item.$field) && $item.$field}{$value = $item.$field}{else}{$value = ''}{/if}
								<input class="form-control" type="text" name="owner_{$field}" value="{$value}" id="field_owner_{$field}" maxlength="40">
							</div>
						{/foreach}
					</div>
				</div>
			</div>
		{/capture}
	{/if}
	{*-- END MOD // dartelov --*} {* autoregister on listing submission *}

	{include file='item-view-tabs.tpl' exceptions=array('price')}

	<div class="ia-form__after-tabs">
		{include file='captcha.tpl'}

		<div class="fieldset__actions">
			<button type="submit" name="data-auto" class="btn btn-primary ladda-button" data-style="expand-right"><span class="ladda-label">{lang key='submit'}</span></button>
		</div>
	</div>
</form>

{ia_hooker name='smartyListingSubmitBeforeFooter'}

{ia_add_media files='js:jquery/plugins/jquery.ia-dropdown.min'}
{ia_add_js}
$(function()
{
	$('select.js-iad').iaDropdown(
	{
		label: 'model-label',
		url: intelli.config.packages.autos.url + 'models.json',
		valueHolder: 'category_id',
		enableHtml: true
	});
});
{/ia_add_js}