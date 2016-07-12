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
				<h2>{$item.part_title}</h2>
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
				<h3>
					{if 'buy' != $item.part_type}
						{$item.price_formatted} сом
					{else}
						Куплю
					{/if}
				</h3>
			</div>

			<table class="v-item-head__table">
				<tbody>
					<tr>
						<td>Категория</td>
						<td>
							{$cats = explode(',', $item.categories)}
							{foreach $cats as $cat}
								{lang key="field_autos_parts_categories_{$cat}"}
							{/foreach}
						</td>
					</tr>
					{if 'buy' != $item.part_type}
						<tr>
							<td>{lang key='field_part_condition'}</td>
							<td>{lang key="field_part_condition_{$item.part_condition}"}</td>
						</tr>
					{/if}
					<tr>
						<td>
							{if 'buy' != $item.part_type}
								Продавец
							{else}
								Покупатель
							{/if}
						</td>
						<td>
							{if isset($author)}
								<a href="{ia_url type='url' item='members' data=$author}">
									{$author.fullname|default:$author.username}
								</a>
							{else}
								Гость
							{/if}
						</td>
					</tr>
					{if $item.part_phone}
						<tr>
							<td>{lang key='field_part_phone'}</td>
							<td><b>{$item.part_phone}</b></td>
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

{*
<div class="v-item">
	<div class="v-item__header">
		<ul class="content__actions">
			{foreach $core.actions as $name => $action}
				<li>
					{if 'action-favorites' == $name}
						{printFavorites item=$item itemtype=$item.item}
					{else}
						<a data-toggle="tooltip" title="{$action.title}" {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
							<span class="fa fa-{$name}" title="{$action.title}"></span>
						</a>
					{/if}
				</li>
			{/foreach}
		</ul>
		<h2>
			<span>{$item.title}</span>
		</h2>
		<div class="v-item__header__price">{$core.config.currency} {$item.price}</div>
		<div class="v-item__header__info">
			{if isset($item.part_number) && $item.part_number}
				<span class="v-item__header__info__item pull-right">#{$item.part_number}</span>
			{/if}
			{if $item.sponsored}<span class="v-item__header__info__item label label-warning">{lang key='sponsored'}</span>{/if}
			{if $item.featured}<span class="v-item__header__info__item label label-info">{lang key='featured'}</span>{/if}
			<span class="v-item__header__info__item">
				{$cats = explode(',', $item.categories)}

				{foreach $cats as $cat}
					{lang key="field_autos_parts_categories_{$cat}"}{if !$cat@last}, {/if}
				{/foreach}
			</span>
			<span class="v-item__header__info__item">{lang key='added_on'} {$item.date_added|date_format:$core.config.date_format}</b></span>
		</div>
	</div>
</div>

{if !empty($item.pictures)}
	{ia_add_media files='fotorama'}
	{$pics=unserialize($item.pictures)}

	<div class="v-item__gallery">
		<div class="fotorama" 
			 data-nav="thumbs"
			 data-width="100%"
			 data-ratio="800/400"
			 data-allowfullscreen="true"
			 data-fit="{$core.config.template_fotorama_part}">
			{foreach $pics as $entry}
				<a class="v-item__gallery__item" href="{printImage imgfile=$entry.path url=true fullimage=true}">{printImage imgfile=$entry.path title=$entry.title}</a>
			{/foreach}
		</div>
	</div>
{/if}

<div class="v-item-info">
	<div class="v-item-info__section">
		<h3>{lang key='details'}</h3>
		{$item.description|escape:'html'}
	</div>
</div>

<div class="m-t-lg">
	{ia_hooker name='smartyItemViewBeforeTabs'}

	{include file='item-view-tabs.tpl' isView=true exceptions=['pictures', 'title', 'price', 'categories', 'description', 'part_number'] class='ia-item-view-tabs'}

	{ia_hooker name='smartyViewListingBeforeFooter'}
</div>
*}