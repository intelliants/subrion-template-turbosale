{if isset($car_blocks_data.partCategories)}
    <div class="sec-header">
        <h4 class="box__caption">{$block.title}</h4>
        <div class="sec-header__actions">
            <a href="{$smarty.const.IA_URL}parts/" class="btn btn-xs btn-default">{lang key='all_parts'}</a>
            <a href="{$smarty.const.IA_URL}part/add/" class="btn btn-xs btn-success">{lang key='add_part'}</a>
        </div>
    </div>

    <div class="ia-categories">
        <div class="row ia-cats">
            {$catsPerCol = ceil(count($car_blocks_data.partCategories)/3)}

            <div class="col-md-4">
                {foreach $car_blocks_data.partCategories as $name => $entry}
                    <div class="ia-cat">
                        <a href="{$smarty.const.IA_URL}parts/{$entry.alias}">{lang key="field_autos_parts_categories_{$entry.title}"}</a>
                    </div>

                    {if $entry@iteration % $catsPerCol == 0 && !$entry@last}
                        </div>
                        <div class="col-md-4">
                    {/if}
                {/foreach}
            </div>
        </div>
    </div>
{/if}