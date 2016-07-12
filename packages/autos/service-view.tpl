<div class="v-item-head">
	<div class="row">
		<div class="col-md-5">
			{if !empty($item.pictures)}
				{ia_add_media files='fotorama'}
				{$pics=$item.pictures}

				<div class="v-item__gallery">
					<div class="fotorama"
						 data-nav="thumbs"
						 data-width="100%"
						 data-ratio="800/600"
						 data-allowfullscreen="true"
						 data-fit="contain">
						{foreach $pics as $entry}
							<a class="v-item__gallery__item" href="{printImage imgfile=$entry.path url=true fullimage=true}">{printImage imgfile=$entry.path title=$entry.title}</a>
						{/foreach}
					</div>
				</div>
			{else}
				<img src="{$img}no-preview-on-view-page.png" class="img-responsive" alt="">
			{/if}
		</div>
		<div class="col-md-7">
			<div class="v-item-head__title">
				<ul class="content__actions">
					{foreach $core.actions as $name => $action}
						<li>
							{if 'action-favorites' == $name}
								{printFavorites item=$item itemtype=$item.item guests=true tpl='no-text'}
							{else}
								<a data-toggle="tooltip" title="{$action.title}" {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
									<span class="fa fa-{$name}" title="{$action.title}"></span>
								</a>
							{/if}
						</li>
					{/foreach}
				</ul>
				<h2>{$item.title}</h2>
			</div>

			<table class="v-item-head__table">
				<tbody>
					<tr>
						<td>{lang key='field_categories'}</td>
						<td>
							{$services = explode(',', $item.categories)}

							{foreach $services as $service}
								{lang key="field_autos_services_categories_{$service}"}{if !$service@last}, {/if}
							{/foreach}
						</td>
					</tr>
					<tr>
						<td>{lang key='field_company_phone'}</td>
						<td><b>{$item.company_phone}</b></td>
					</tr>
					{if $item.company_address}
						<tr>
							<td>{lang key='field_company_address'}</td>
							<td>{$item.company_address}</td>
						</tr>
					{/if}
					<tr>
						<td>Автор</td>
						<td>
							{if isset($author)}
								<a href="{ia_url type='url' item='members' data=$author}">{$author.fullname|default:$author.username}</a> {if $author.phone}<br><span class="fa fa-phone"></span> {$author.phone}{/if}
							{else}
								{lang key='guest'}
							{/if}
						</td>
					</tr>
				</tbody>
			</table>

			{if $item.description}
				<div class="v-item-info__section">
					{$item.description|escape:'html'|nl2br}
				</div>
			{/if}

			<div class="v-item-head__more">
				<span><span class="fa fa-eye"></span> {$item.views_num}</span>
				<span>{lang key='added_on'} {$item.date_added|date_format:$core.config.date_format}</span>
			</div>
		</div>
	</div>
</div>

{if isset($item.company_lat) && $item.company_lat}
	<div id="dg-map" class="m-t" style="height: 240px;width: 100%;"></div>

	<script src="http://maps.api.2gis.ru/2.0/loader.js?pkg=full"></script>

	{ia_add_js}
$(function() {
	DG.then(function() {
		var map,
			marker,
			pos = [{$item.company_lat}, {$item.company_long}];

		map = DG.map('dg-map', {
			center: pos,
			zoom: 17
		});

		marker = DG.marker(pos).addTo(map);
	});
});
	{/ia_add_js}
{/if}

{ia_hooker name='smartyViewListingBeforeFooter'}