{if iaCore::ACTION_EDIT == $pageAction}
	<div class="tool-buttons text-right m-b">
		<a class="btn btn-sm btn-info" href="{ia_url type='url' item='autos' action='view' data=$item}">{lang key='view'} <span class="icon-arrow-right2"></span></a>
	</div>
{/if}

<div class="ia-form-info">
	<p>{lang key='fields_notice'}</p>
</div>

<form method="post" action="{$smarty.const.IA_SELF}" enctype="multipart/form-data" class="ia-form ia-form-auto">
	{preventCsrf}

	{* MANAGING LAYOUT WITH WRAPS *}

	{capture append='field_before' name='release_year'}
		<div class="ia-form-auto__wrp1">
	{/capture}
	{capture append='field_after' name='mileage'}
		</div>
	{/capture}

	{capture append='field_before' name='additional_info'}
		<div class="ia-form-auto__wrp2">
	{/capture}
	{capture append='field_after' name='additional_info'}
		</div>
	{/capture}

	{capture append='field_before' name='engine'}
		<div class="ia-form-auto__wrp1">
	{/capture}
	{capture append='field_after' name='vin_code'}
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

	{include file='item-view-tabs.tpl' exceptions=array()}

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