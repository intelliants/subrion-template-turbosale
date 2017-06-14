<div class="ia-card-hr{if $listing.sponsored} ia-card-hr--sponsored{/if}">
    <a class="ia-card-hr__image" href="{$listing.link}">
        {if $listing.pictures}
            {foreach $listing.pictures as $pic}
                {ia_image file=$pic title=$listing.model class='img-responsive' type='thumbnail'}
            {/foreach}

            <span class="ia-card-hr__sup-info"><span class="fa fa-camera"></span> {$listing.pictures_num}</span>
        {else}
            <img src="{$img}no-car-preview.png" alt="">
        {/if}

        {if 'sold' == $listing.status}
            <span class="ia-card-hr__status -sold">{lang key='sold'}</span>
        {/if}
    </a>

    <div class="ia-card-hr__content">
        <div class="ia-card-hr__content__head">
            <a class="ia-card-hr__title" href="{$listing.link}">{$listing.model}</a>
            <div class="ia-card-hr__price">{$listing.price_formatted}</div>
        </div>
        <div class="ia-card-hr__info">
            <b>{$listing.release_year}</b>{if $listing.body_type}, {lang key="field_autos_body_type+{$listing.body_type}"}{/if}{if $listing.mileage}, {$listing.mileage} km{/if}{if $listing.engine_size}, {$listing.engine_size}{/if}{if $listing.transmission}, {lang key="field_autos_transmission+{$listing.transmission}"}{/if}{if $listing.drive_type}, {lang key="field_autos_drive_type+{$listing.drive_type}"} <span class="text-lowercase">{lang key="field_autos_drive_type"}</span>{/if}{if $listing.exterior_color}, {lang key="field_autos_exterior_color+{$listing.exterior_color}"}{/if}
        </div>
        {if $listing.additional_info}
            <div class="ia-card-hr__comment">{$listing.additional_info|escape|truncate:150:'...':true}</div>
        {/if}
        <div class="ia-card-hr__more">
            <span>{$listing.date_added|date_format:$core.config.date_format}</span>
            <span class="ia-card-hr__more__sep"><span class="fa fa-circle"></span></span>
            <span><span class="fa fa-eye"></span> {$listing.views_num}</span>
            {if 'autos_index_member' == $core.page.name}
                <span class="ia-card-hr__more__sep"><span class="fa fa-circle"></span></span>
                <span><a href="{$smarty.const.IA_URL}edit/{$listing.id}/"><span class="fa fa-pencil"></span> {lang key='edit'}</a></span>
            {/if}
            {printFavorites item=$listing itemtype='autos' guests=true tpl="no-text"}
        </div>
    </div>
</div>
