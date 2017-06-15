{if !empty($models)}
    {ia_block title={lang key='autos_models'} style='fixed' id='auto_categories'}
        <div class="ia-categories">

            {$num_columns = ((isset($core.config.autos_model_columns)) ? $core.config.autos_model_columns : 2)}
            {$class_names = ['col-md-12', 'col-md-6', 'col-md-4', 'col-md-3']}

            <div class="row ia-cats">
                {foreach $models as $model}
                <div class="{$class_names[$num_columns - 1]}">
                    <div class="ia-cat">
                        {if !empty($model.icon)}
                            <img src="{$core.page.nonProtocolUrl}uploads/{$model.icon.path}" alt="{$model.title|escape}">
                        {/if}

                        <a href="{$model.link}">{$model.title|escape}</a> &mdash; {$model.num|default:0}
                    </div>
                </div>

                {if $model@iteration % $num_columns == 0 && !$model@last}
            </div>
            <div class="row ia-cats">
                {/if}
                {/foreach}
            </div>
        </div>
    {/ia_block}
{/if}

{if !empty($listings)}
    <div class="sorting">
        <span class="sorting__head">{lang key='sort_by'}:</span>

        <span class="sorting__links">
            <a class="{if 'date_added' == $sorting.field}active{/if}" href="{$smarty.const.IA_SELF}?sort=date" rel="nofollow">{lang key='date'}</a>
            <a class="{if 'price' == $sorting.field}active{/if}" href="{$smarty.const.IA_SELF}?sort=price" rel="nofollow">{lang key='price'}</a>
            <a class="{if 'release_year' == $sorting.field}active{/if}" href="{$smarty.const.IA_SELF}?sort=year" rel="nofollow">{lang key='field_autos_release_year'}</a>
        </span>

        <span class="sorting__links">
            <a class="{if $sorting.direction == 'ASC'}active{/if}" href="{$smarty.const.IA_SELF}?order=asc" rel="nofollow"><span class="fa fa-sort-amount-asc"></span> {lang key='asc'}</a>
            <a class="{if $sorting.direction == 'DESC'}active{/if}" href="{$smarty.const.IA_SELF}?order=desc" rel="nofollow"><span class="fa fa-sort-amount-desc"></span> {lang key='desc'}</a>
        </span>

        <span class="sorting__num-found">{lang key='total_cars_found'}: <b>{$pagination.total}</b></span>
    </div>

    <div class="g-list">
        {foreach $listings as $listing}
            {include file='extra:autos/list-autos'}
        {/foreach}
    </div>

    {navigation aTotal=$pagination.total aTemplate=$pagination.url aItemsPerPage=$pagination.limit aIgnore=true}
{elseif isset($model.id) && $model.level}
    <div class="alert alert-info">
        {if 'autos_search' == $core.page.name}
            {lang key='nothing_found'}
        {else}
            {lang key='no_listings_to_show'}
        {/if}
    </div>
{elseif !isset($model.id)}
    <div class="alert alert-info">{lang key='no_listings_to_show'}</div>
{/if}
