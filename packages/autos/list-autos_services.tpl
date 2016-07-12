<div class="ia-card-hr ia-card-hr--service">
	{if $listing.logo}
		<a class="ia-card-hr__image" href="{ia_url item='autos_services' data=$listing type='url'}">
			{printImage imgfile=$listing.logo.path title=$listing.title}
		</a>
	{elseif $listing.pictures}
		<a class="ia-card-hr__image" href="{ia_url item='autos_services' data=$listing type='url'}">
			{foreach $listing.pictures as $pic}
				{printImage imgfile=$pic.path title=$listing.title}
			{/foreach}
		</a>
	{else}
		<a class="ia-card-hr__image" href="{ia_url item='autos_services' data=$listing type='url'}">
			<img src="{$img}no-car-preview.png" alt="">
		</a>
	{/if}

	<div class="ia-card-hr__content">
		<div class="ia-card-hr__content__head">
			<a class="ia-card-hr__title" href="{ia_url item='autos_services' data=$listing type='url'}">{$listing.title}</a>
			{if isset($listing.company_phone) && $listing.company_phone}
				<div class="ia-card-hr__price"><span class="fa fa-phone"></span> {$listing.company_phone}</div>
			{/if}
		</div>
		<p>{$listing.description|escape|truncate:250:'...':true}</p>
		<div class="ia-card-hr__info">
			{$services = explode(',', $listing.categories)}
			<b>Категории: </b>
			{foreach $services as $service}
				{lang key="field_autos_services_categories_{$service}"}{if !$service@last}, {/if}
			{/foreach}
		</div>
		<div class="ia-card-hr__more">
			<span>{if $listing.owner_username}<a href="{$smarty.const.IA_URL}member/{$listing.owner_username}.html">{$listing.owner_fullname}</a>{else}Гость{/if}</span>
			<span class="ia-card-hr__more__sep"><span class="fa fa-circle"></span></span>
			<span>{$listing.date_added|date_format:$core.config.date_format}</span>
			{if 'autos_member_services' == $core.page.name}
				<span class="ia-card-hr__more__sep"><span class="fa fa-circle"></span></span>
				<span><a href="{$smarty.const.IA_URL}service/edit/{$listing.id}/"><span class="fa fa-pencil"></span> Редактировать</a></span>
			{/if}
			{printFavorites item=$listing itemtype='autos_services' guests=true tpl="no-text"}
		</div>
	</div>
</div>