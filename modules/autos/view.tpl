{if 'sold' == $item.status}
	<div class="v-item-status -sold">{lang key='sold'}</div>
{/if}
<div class="v-item-head">
	<div class="row">
		<div class="col-md-6">
			{if !empty($item.pictures)}
				{ia_add_media files='js: _IA_TPL_fotorama'}

				<div class="v-item__gallery">
					<div class="fotorama" 
						 data-nav="thumbs"
						 data-width="100%"
						 data-ratio="800/600"
						 data-allowfullscreen="true"
						 data-fit="{$core.config.template_fotorama_car}">
						{foreach $item.pictures as $entry}
							<a class="v-item__gallery__item" href="{ia_image file=$entry url=true type='original'}">{ia_image file=$entry title=$item.title type='original'}</a>
						{/foreach}
					</div>
				</div>
			{else}
				<img src="{$img}no-preview.png" class="img-responsive" alt="">
			{/if}
		</div>
		<div class="col-md-6">
			<div class="v-item-head__title">
				<h2>{$item.model}, {$item.release_year}</h2>
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
				<h3>{$item.price_formatted}</h3>
			</div>

			<table class="v-item-head__table">
				<tbody>
					{if $item.vin_code}
						<tr>
							<td>{lang key='field_autos_vin_code'}</td>
							<td><b>{$item.vin_code}</b></td>
						</tr>
					{/if}
					<tr>
						<td>{lang key='field_autos_body_type'}</td>
						<td><b>{lang key="field_autos_body_type+{$item.body_type}"}</b></td>
					</tr>
					{if $item.mileage}
						<tr>
							<td>{lang key='field_autos_mileage'}</td>
							<td><b>{$item.mileage}</b></td>
						</tr>
					{/if}
					<tr>
						<td>{lang key='field_autos_condition'}</td>
						<td>{lang key="field_autos_condition+{$item.condition}"}</td>
					</tr>
					{if $item.engine}
						<tr>
							<td>{lang key='field_autos_engine'}</td>
							<td>{lang key="field_autos_engine+{$item.engine}"}, {lang key="field_autos_engine_type+{$item.engine_type}"}{if $item.engine_size}, {$item.engine_size}{/if}</td>
						</tr>
					{/if}
					{if $item.horse_power}
						<tr>
							<td>{lang key='field_autos_horse_power'}</td>
							<td>{$item.horse_power}</td>
						</tr>
					{/if}
					{if $item.transmission}
						<tr>
							<td>{lang key='field_autos_transmission'}</td>
							<td>{lang key="field_autos_transmission+{$item.transmission}"}</td>
						</tr>
					{/if}
					{if $item.drive_type}
						<tr>
							<td>{lang key='field_autos_drive_type'}</td>
							<td>{lang key="field_autos_drive_type+{$item.drive_type}"}</td>
						</tr>
					{/if}
					{if $item.fuel_type}
						<tr>
							<td>{lang key='field_autos_fuel_type'}</td>
							<td>
								{assign fuel explode(',', $item.fuel_type)}
								{foreach $fuel as $one}
									{lang key="field_autos_fuel_type+{$one}"}{if !$one@last}, {/if}
								{/foreach}
							</td>
						</tr>
					{/if}
					{if $item.door_count}
						<tr>
							<td>{lang key='field_autos_door_count'}</td>
							<td>{lang key="field_autos_door_count+{$item.door_count}"}</td>
						</tr>
					{/if}
					{if $item.exterior_color}
						<tr>
							<td>{lang key='field_autos_exterior_color'}</td>
							<td>
								<span class="color-badge" style="background: {$item.exterior_color}"></span>
								{lang key="field_autos_exterior_color+{$item.exterior_color}"}
							</td>
						</tr>
					{/if}
					{if $item.metallic}
						<tr>
							<td>{lang key='field_autos_metallic'}</td>
							<td>{lang key="field_autos_metallic+{$item.metallic}"}</td>
						</tr>
					{/if}
					{if $item.interior_color}
						<tr>
							<td>{lang key='field_autos_interior_color'}</td>
							<td>
								<span class="color-badge" style="background: {$item.interior_color}"></span>
								{lang key="field_autos_interior_color+{$item.interior_color}"}
							</td>
						</tr>
					{/if}
					{if $item.interior_leather}
						<tr>
							<td>{lang key='field_autos_interior_leather'}</td>
							<td>{lang key="field_autos_interior_leather+{$item.interior_leather}"}</td>
						</tr>
					{/if}
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
				<h4 class="box__caption">{lang key='seller'}</h4>
				<div class="box__content">
					{if isset($author)}
						<div class="box-author__name">
							<a href="{ia_url type='url' item='members' data=$author}">
								{ia_image file=$author.avatar width=30 title=$author.fullname|default:$author.username gravatar=true email=$author.email}{$author.fullname|default:$author.username}
							</a>
						</div>
						{if $author.phone}
							<div class="box-author__phone">
								<span><span class="fa fa-phone"></span> <b>{$author.phone}</b></span>
							</div>
						{elseif !empty($item.phone)}
							<div class="box-author__phone">
								<span><span class="fa fa-phone"></span> <b>{$item.phone}</b></span>
							</div>
						{elseif !empty($item.phone_number)}
							<div class="box-author__phone">
								<span><span class="fa fa-phone"></span> <b>{$item.phone_number}</b></span>
							</div>
						{/if}
						<div class="box-author__cars">
							{lang key='cars'}: <b>{$author.autos_num|string_format:'%d'}</b>
						</div>
					{else}
						<div class="box-author__name">
							<img src="{$img}no-avatar.png" width="30" alt="">
							{lang key='guest'}
							<span>Guest</span>
						</div>
						{if $item.phone_number}
							<div class="box-author__phone">
								<span><span class="fa fa-phone"></span> <b>{$item.phone_number}</b></span>
							</div>
						{/if}
					{/if}

					{if $author.facebook || $author.twitter || $author.gplus || $author.linkedin}
						<p class="text-center">
							{if !empty($author.facebook)}
								<a href="{$author.facebook}" class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-facebook fa-stack-1x fa-inverse"></i></a>
							{/if}
							{if !empty($author.twitter)}
								<a href="{$author.twitter}" class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-twitter fa-stack-1x fa-inverse"></i></a>
							{/if}
							{if !empty($author.gplus)}
								<a href="{$author.gplus}" class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-google-plus fa-stack-1x fa-inverse"></i></a>
							{/if}
							{if !empty($author.linkedin)}
								<a href="{$author.linkedin}" class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-linkedin fa-stack-1x fa-inverse"></i></a>
							{/if}
						</p>
					{/if}

					{ia_hooker name='smartyViewListingAuthorBlock'}
				</div>
			</div>

			{ia_blocks block='enquire'}
		</div>
		<div class="col-md-8">
			{if $item.additional_info}
				<div class="v-item-info__section">
					<h4><span>{lang key='field_autos_additional_info'}</span></h4>
					<p>{$item.additional_info|escape:'html'|nl2br}</p>
				</div>
			{/if}

			{if $item.options_features}
				<div class="v-item-info__section">
					<h4><span>{lang key='field_autos_options_features'}</span></h4>
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
							<div class="v-car-features__item {if in_array($opt, $itemFeatures)} active{/if}"><span class="fa {if in_array($opt, $itemFeatures)}fa-check{else}fa-circle-o{/if}"></span> {lang key="field_autos_options_features+{$opt}"}</div>
						{/foreach}
					</div>
				</div>
			{/if}

			{ia_blocks block='calc'}
		</div>
	</div>
</div>

{ia_add_media files='select2, js:intelli/intelli.search, js:frontend/search'}

{ia_hooker name='smartyViewListingBeforeFooter'}