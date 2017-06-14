{if $categories}
    <div class="ia-categories">
        <div class="row ia-cats">
            {$catsPerCol = ceil(count($categories)/3)}

            <div class="col-md-4">
                {foreach $categories as $category}
                    <div class="ia-cat">
                        <span class="fa fa-folder"></span>
                        <a href="{$core.packages.autos.url}services/{$category.alias}">{lang key="field_autos_services_categories_{$category.node_id}"}</a>
                    </div>

                    {if $category@iteration % $catsPerCol == 0 && !$category@last}
                        </div>
                        <div class="col-md-4">
                    {/if}
                {/foreach}
            </div>
        </div>
    </div>

    <hr>
{/if}

{if $listings}
    <div class="ia-items">
        {foreach $listings as $listing}
            {include file='extra:autos/list-autos_services'}
        {/foreach}
    </div>

    {navigation aTotal=$pagination.total aTemplate=$pagination.url aItemsPerPage=$pagination.limit aIgnore=true}
{else}
    <div class="alert alert-info">{lang key='no_services_to_show'}</div>
{/if}