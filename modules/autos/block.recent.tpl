{if isset($car_blocks_data.recent)}
    <div class="recent-cars">
        <h4 class="box__caption">{$block.title}</h4>
        <div class="row">
            {foreach $car_blocks_data.recent as $item}
                <div class="col-md-3">
                    <div class="ia-card">

                        {if !empty($item.pictures)}
                            <a class="ia-card__image" href="{$item.link}">
                                {ia_image file=$item.pictures[0] title=$item.model type='thumbnail'}

                                <span class="ia-card__sup-info"><span class="fa fa-camera"></span> {$item.pictures_num}</span>
                            </a>
                        {else}
                            <a class="ia-card__image" href="{$item.link}">
                                <img src="{$img}no-car-preview.png" alt="">
                            </a>
                        {/if}

                        <div class="ia-card__content">
                            <a class="ia-card__title" href="{$item.link}">{$item.model}</a>
                            <p class="ia-card__price">{$item.price_formatted}</p>
                            <p class="ia-card__info">
                                {$item.release_year}{if $item.mileage}, {$item.mileage} km{/if}{if $item.transmission}, {lang key="field_autos_transmission+{$item.transmission}"}{/if}
                            </p>
                        </div>
                    </div>
                </div>

                {if $item@iteration % 4 == 0 && !$item@last}
                    </div>
                    <div class="row">
                {/if}
            {/foreach}
        </div>
    </div>
{/if}