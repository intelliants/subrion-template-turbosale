<div class="ia-member-view">
    <div class="row">
        <div class="col-md-10">
            <table class="v-item-head__table">
                <tbody>
                    {if !empty($item.phone)}
                        <tr>
                            <td>{lang key='field_phone'}</td>
                            <td><b>{$item.phone}</b></td>
                        </tr>
                    {/if}
                    {if !empty($item.website)}
                        <tr>
                            <td>{lang key='field_website'}</td>
                            <td>{$item.website|linkify}</td>
                        </tr>
                    {/if}
                    {if !empty($item.biography)}
                        <tr>
                            <td>{lang key='field_biography'}</td>
                            <td>{$item.biography|escape|nl2br}</td>
                        </tr>
                    {/if}
                    <tr>
                        <td>{lang key='member_since'}</td>
                        <td>{$item.date_reg|date_format:$core.config.date_format}</td>
                    </tr>
                    <tr>
                        <td>{lang key='views'}</td>
                        <td><span class="fa fa-eye"></span> {$item.views_num}</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="col-md-2">
            <div class="ia-member-view__social">
                {if !empty($item.facebook)}
                    <a href="{$item.facebook}"><span class="fa fa-facebook"></span></a>
                {/if}
                {if !empty($item.twitter)}
                    <a href="{$item.twitter}"><span class="fa fa-twitter"></span></a>
                {/if}
            </div>
        </div>
    </div>
</div>

{foreach $item.items as $itemName => $oneitem}
    {if $oneitem.items}
        {capture name=$itemName append='tabs_content'}
            {if !$oneitem.package}
                {include "search.{$itemName}.tpl" listings=$oneitem.items fields=$oneitem.fields}
            {else}
                {include "extra:{$oneitem.package}/search.{$itemName}" listings=$oneitem.items fields=$oneitem.fields}
            {/if}
        {/capture}
    {/if}
{/foreach}

{include file='item-view-tabs.tpl' isView=true exceptions=array('username', 'avatar', 'fullname', 'phone', 'website', 'facebook', 'twitter', 'gplus', 'linkedin', 'biography')}

{if isset($groups['___empty___'])}
    {include file='field-type-content-fieldset.tpl' item_sections=$groups isView=true exceptions=array('username', 'avatar', 'fullname', 'phone', 'website', 'facebook', 'twitter', 'gplus', 'linkedin', 'biography')}
{/if}

{ia_hooker name='smartyViewListingBeforeFooter'}