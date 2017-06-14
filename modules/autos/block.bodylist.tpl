{if isset($car_blocks_data.body)}
    <div class="container-fluid pr-list">
        <div class="row">
            {foreach $car_blocks_data.body as $name => $entry}
                <div class="col-md-2 col-sm-3">
                    <a href="{$entry.url}" class="pr-list__item">
                        <span class="pr-list__item__icon -{$name}"></span>
                        <span class="pr-list__item__title">{$entry.title|escape}</span>
                    </a>
                </div>
            {/foreach}
        </div>
    </div>
{/if}