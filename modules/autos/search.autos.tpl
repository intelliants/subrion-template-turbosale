{if isset($listings) && $listings}
    <div class="g-list">
        {foreach $listings as $listing}
            {include file='extra:autos/list-autos'}
        {/foreach}
    </div>
{else}
    <div class="alert alert-info">{lang key='no_listings_to_show'}</div>
{/if}