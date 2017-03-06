{if iaCore::ACTION_EDIT == $pageAction}
	<div class="tool-buttons text-right m-b">
		<a class="btn btn-sm btn-info" href="{ia_url type='url' item='autos_parts' action='view' data=$item}">{lang key='view'} <span class="icon-arrow-right2"></span></a>
	</div>
{/if}

<div class="ia-form-info">
	<p>{lang key='fields_notice'}</p>
</div>

<form method="post" action="{$smarty.const.IA_SELF}" enctype="multipart/form-data" class="ia-form ia-form-parts">
	{preventCsrf}

	{capture append='fieldset_before' name='autos_parts_general'}
		{include file='plans.tpl' item=$item}
	{/capture}
{*
	{capture append='field_before' name='part_type'}
		<div class="ia-form-services__wrp">
	{/capture}

	{capture append='field_before' name='part_condition'}
		<div class="ia-form-services__wrp2">
	{/capture}
	{capture append='field_after' name='price'}
		</div>
	{/capture}

	{capture append='field_after' name='pictures'}
		</div>
	{/capture}
*}
	{include file='item-view-tabs.tpl'}

	<div class="ia-form__after-tabs">
		{include file='captcha.tpl'}

		<div class="fieldset__actions">
			<button type="submit" name="data-part" class="btn btn-primary ladda-button" data-style="expand-right"><span class="ladda-label">{lang key='submit'}</span></button>
		</div>
	</div>
</form>

{ia_hooker name='smartyListingSubmitBeforeFooter'}