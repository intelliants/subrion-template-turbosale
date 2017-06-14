{if isset($models) && $models}
    {ia_block title="Models" style='fixed' id='auto_categories'}
        <div class="ia-categories ia-models">
            {include file='ia-categories.tpl' categories=$models item='autos_models' show_amount=true num_columns=$core.config.autos_model_columns}
        </div>
    {/ia_block}
{/if}

{if isset($listings) && $listings}
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
{elseif isset($category.id) && $category.level}
    <div class="alert alert-info">
        {if 'autos_search' == $core.page.name}
            {lang key='nothing_found'}
        {else}
            {lang key='no_listings_to_show'}
        {/if}
    </div>
{elseif !isset($category.id)}
    <div class="alert alert-info">
        {lang key='no_listings_to_show'}
    </div>
{/if}
