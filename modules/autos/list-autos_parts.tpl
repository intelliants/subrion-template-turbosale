<div class="ia-card">
	{if $listing.pictures}
		<a class="ia-card__image" href="{ia_url item='autos_parts' data=$listing type='url'}">
			{ia_image file=$listing.pictures[0] title=$listing.title type='thumbnail'}
		</a>
	{else}
		<a class="ia-card__image" href="{ia_url item='autos_parts' data=$listing type='url'}">
			<img src="{$img}no-car-preview.png" alt="">
		</a>
	{/if}

	<div class="ia-card__content">
		<a class="ia-card__title" href="{ia_url item='autos_parts' data=$listing type='url'}">{$listing.title}</a>
		<p class="ia-card__price">{$listing.price}</p>

		<p class="ia-card__info">
			{$listing.description|escape|truncate:100:'...':true}
		</p>
		{if 'autos_member_parts' == $core.page.name}
			<span><a href="{$smarty.const.IA_URL}part/edit/{$listing.id}/"><span class="fa fa-pencil"></span> {lang key='edit'}</a></span>
		{/if}
	</div>
</div>