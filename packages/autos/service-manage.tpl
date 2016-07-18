{if iaCore::ACTION_EDIT == $pageAction}
	<div class="tool-buttons text-right m-b">
		<a class="btn btn-sm btn-info" href="{ia_url type='url' item='autos_services' action='view' data=$item}">{lang key='view'} <span class="icon-arrow-right2"></span></a>
	</div>
{/if}

<div class="ia-form-info">
	<p>{lang key='fields_notice'}</p>
</div>

<form method="post" action="{$smarty.const.IA_SELF}" enctype="multipart/form-data" class="ia-form ia-form-services">
	{preventCsrf}

	{capture append='fieldset_before' name='autos_services_general'}
		{include file='plans.tpl' item=$item}
	{/capture}

	{capture append='field_before' name='title'}
		<div class="ia-form-services__wrp">
	{/capture}
	{capture append='field_after' name='company_skype'}
		</div>
	{/capture}

	{capture append='field_before' name='categories'}
		<div class="ia-form-services__wrp2">
			<div class="ia-form-services__wrp2__inner">
	{/capture}
	{capture append='field_before' name='description'}
			</div>
			<div class="ia-form-services__wrp2__inner">
	{/capture}
	{capture append='field_after' name='pictures'}
			</div>
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