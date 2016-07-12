{if 'sold' == $item.status}
	<div class="v-item-status -sold">{lang key='sold'}</div>
{/if}
<div class="v-item-head">
	<div class="row">
		<div class="col-md-6">
			{if !empty($item.auto_pictures)}
				{ia_add_media files='js: _IA_TPL_fotorama'}

				<div class="v-item__gallery">
					<div class="fotorama" 
						 data-nav="thumbs"
						 data-width="100%"
						 data-ratio="800/600"
						 data-allowfullscreen="true"
						 data-fit="contain">
						{foreach $item.auto_pictures as $entry}
							<a class="v-item__gallery__item" href="{printImage imgfile=$entry.path url=true fullimage=true}">{printImage imgfile=$entry.path title=$entry.title}</a>
						{/foreach}
					</div>
				</div>
			{else}
				<img src="{$img}no-preview-on-view-page.png" class="img-responsive" alt="">
			{/if}
		</div>
		<div class="col-md-6">
			<div class="v-item-head__title">
				<h2>{$item.model}, {$item.release_year}</h2>
				<ul class="content__actions">
					{*if $member && $member.id == $item.member_id}
						<li>
							<span class="label label-{$item.status}" title="{lang key=$item.status default=$item.status}"><span class="fa fa-warning"></span> {lang key=$item.status default=$item.status}</span>
						</li>
					{/if*}
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
				<h3>{$item.price_formatted}</h3>
			</div>

			<table class="v-item-head__table">
				<tbody>
					<tr>
						<td>{lang key='field_body_type'}</td>
						<td><b>{lang key="field_body_type_{$item.body_type}"}</b></td>
					</tr>
					{if $item.mileage}
						<tr>
							<td>{lang key='field_mileage'}</td>
							<td><b>{$item.mileage} км</b></td>
						</tr>
					{/if}
					{if $item.engine_size}
						<tr>
							<td>{lang key='field_engine_size'}</td>
							<td>{$item.engine_size}</td>
						</tr>
					{/if}
					{if $item.transmission}
						<tr>
							<td>{lang key='field_transmission'}</td>
							<td>{lang key="field_transmission_{$item.transmission}"}</td>
						</tr>
					{/if}
					{if $item.drive_type}
						<tr>
							<td>{lang key='field_drive_type'}</td>
							<td>{lang key="field_drive_type_{$item.drive_type}"}</td>
						</tr>
					{/if}
					{if $item.fuel_type}
						<tr>
							<td>{lang key='field_fuel_type'}</td>
							<td>
								{assign fuel explode(',', $item.fuel_type)}
								{foreach $fuel as $one}
									{lang key="field_fuel_type_{$one}"}{if !$one@last}, {/if}
								{/foreach}
							</td>
						</tr>
					{/if}
					{if $item.steering_wheel}
						<tr>
							<td>{lang key='field_steering_wheel'}</td>
							<td>{lang key="field_steering_wheel_{$item.steering_wheel}"}</td>
						</tr>
					{/if}
					{if $item.exterior_color}
						<tr>
							<td>{lang key='field_exterior_color'}</td>
							<td>{lang key="field_exterior_color_{$item.exterior_color}"}</td>
						</tr>
					{/if}
					<tr>
						<td>{lang key='field_condition'}</td>
						<td>{lang key="field_condition_{$item.condition}"}</td>
					</tr>
				</tbody>
			</table>

			<div class="v-item-head__more">
				<span><span class="fa fa-eye"></span> {$item.views_num}</span>
				<span>{lang key='added_on'} {$item.date_added|date_format:$core.config.date_format}</span>
			</div>
		</div>
	</div>
</div>

<div class="v-item-info">
	<div class="row">
		<div class="col-md-4">
			<div class="box box--border box-author">
				<h4 class="box__caption">{lang key='owner'}</h4>
				<div class="box__content">
					{if isset($author)}
						<div class="box-author__name">
							<a href="{ia_url type='url' item='members' data=$author}">
								{printImage imgfile=$author.avatar width=30 title=$author.fullname|default:$author.username gravatar=true email=$author.email}{$author.fullname|default:$author.username}

								{if 12 == $author.usergroup_id}
									<span>Автосалон</span>
								{else}
									<span>Частный продавец</span>
								{/if}
							</a>
						</div>
						{if $author.phone}
							<div class="box-author__phone">
								<span><span class="fa fa-phone"></span> <b>{$author.phone}</b></span>
							</div>
						{elseif isset($item.phone) && $item.phone}
							<div class="box-author__phone">
								<span><span class="fa fa-phone"></span> <b>{$item.phone}</b></span>
							</div>
						{elseif isset($item.phone_number) && $item.phone_number}
							<div class="box-author__phone">
								<span><span class="fa fa-phone"></span> <b>{$item.phone_number}</b></span>
							</div>
						{/if}
						<div class="box-author__cars">
							Машин в гараже: <b>{$author.autos_num|string_format:'%d'}</b>
						</div>
					{else}
						<div class="box-author__name">
							<img src="{$img}no-avatar.png" width="30" alt="">
							{lang key='guest'}
							<span>Частный продавец</span>
						</div>
						{if $item.phone_number}
							<div class="box-author__phone">
								<span><span class="fa fa-phone"></span> <b>{$item.phone_number}</b></span>
							</div>
						{/if}
					{/if}
				</div>
			</div>

			{*<div class="v-item-info__section v-item-info__section--imp m-t-md">
				<h4><span>Подробнее о {$item.model}</span></h4>
				<div class="link-icons">
					<a href="{$smarty.const.IA_URL}catalog/{$item.url}"><span class="fa fa-wrench"></span> Характеристики</a>
					<a href="{$smarty.const.IA_URL}{$item.url}"><span class="fa fa-car"></span> Все объявления</a>
				</div>
			</div>*}
		</div>
		<div class="col-md-8">
			{if $item.additional_info}
				<div class="v-item-info__section">
					<h4><span>{lang key='field_additional_info'}</span></h4>
					<p>{$item.additional_info|escape:'html'|nl2br}</p>
				</div>
			{/if}

			{if $item.options_features}
				<div class="v-item-info__section">
					<h4><span>{lang key='field_options_features'}</span></h4>
					<div class="v-car-features">
						{$features = array()}
						{foreach $sections as $section_name => $section}
							{foreach $section as $sec}
								{foreach $sec.fields as $field}
									{if $field.name == 'options_features'}
										{$features = $field.values}
									{/if}
								{/foreach}
							{/foreach}
						{/foreach}

						{$itemFeatures = explode(',', $item.options_features)}

						{foreach array_keys($features) as $opt}
							{if '1' == $opt}<h5 class="v-car-features__section">{lang key='electronics'}</h5>{elseif 9 == $opt}<h5 class="v-car-features__section">{lang key='interior'}</h5>{elseif 13 == $opt}<h5 class="v-car-features__section">{lang key='multimedia'}</h5>{elseif 18 == $opt}<h5 class="v-car-features__section">{lang key='exterior'}</h5>{elseif 23 == $opt}<h5 class="v-car-features__section">{lang key='additional'}</h5>{/if}
							<div class="v-car-features__item {if in_array($opt, $itemFeatures)} active{/if}"><span class="fa {if in_array($opt, $itemFeatures)}fa-check{else}fa-circle-o{/if}"></span> {lang key="field_options_features_{$opt}"}</div>
						{/foreach}
					</div>
				</div>
			{/if}
		</div>
	</div>
</div>

{ia_add_media files='select2, js:intelli/intelli.search, js:frontend/search'}

{ia_hooker name='smartyViewListingBeforeFooter'}