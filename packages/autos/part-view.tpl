<div class="v-item-head">
	<div class="row">
		<div class="col-md-5">
			{if !empty($item.pictures)}
				{ia_add_media files='fotorama'}
				{$pics=unserialize($item.pictures)}

				<div class="v-item__gallery">
					<div class="fotorama"
						 data-nav="thumbs"
						 data-width="100%"
						 data-ratio="800/600"
						 data-allowfullscreen="true"
						 data-fit="contain">
						{foreach $pics as $entry}
							<a class="v-item__gallery__item" href="{printImage imgfile=$entry.path url=true fullimage=true}">{printImage imgfile=$entry.path}</a>
						{/foreach}
					</div>
				</div>
			{else}
				<img src="{$img}no-preview-on-view-page.png" class="img-responsive" alt="">
			{/if}
		</div>
		<div class="col-md-7">
			<div class="v-item-head__title">
				<h2>{$item.title}</h2>
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
				<h3>{$item.price}</h3>
			</div>

			<table class="v-item-head__table">
				<tbody>
					<tr>
						<td>{lang key='field_categories'}</td>
						<td>
							{$cats = explode(',', $item.categories)}
							{foreach $cats as $cat}
								{lang key="field_autos_parts_categories_{$cat}"}
							{/foreach}
						</td>
					</tr>
					<tr>
						<td>{lang key='seller'}</td>
						<td>
							{if isset($author)}
								<a href="{ia_url type='url' item='members' data=$author}">
									{$author.fullname|default:$author.username}
								</a>
							{else}
								{lang key='guest'}
							{/if}
						</td>
					</tr>
					{if $item.part_number}
						<tr>
							<td>{lang key='field_part_number'}</td>
							<td><b>{$item.part_number}</b></td>
						</tr>
					{/if}
				</tbody>
			</table>

			{$item.description|escape:'html'|nl2br}

			<div class="v-item-head__more">
				<span><span class="fa fa-eye"></span> {$item.views_num}</span>
				<span>{lang key='added_on'} {$item.date_added|date_format:$core.config.date_format}</span>
			</div>
		</div>
	</div>
</div>

{ia_hooker name='smartyViewListingBeforeFooter'}

<div class="m-t-lg">
	{ia_hooker name='smartyItemViewBeforeTabs'}

	{include file='item-view-tabs.tpl' isView=true exceptions=['pictures', 'title', 'price', 'categories', 'description', 'part_number'] class='ia-item-view-tabs'}

	{ia_hooker name='smartyViewListingBeforeFooter'}
</div>