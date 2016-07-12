{if isset($block_blog_entries) && $block_blog_entries}
	<div class="latest-news">
		{foreach $block_blog_entries as $one_blog_entry}
			<div class="news-item-sm">
				{if $one_blog_entry.image}
					<a href="{$smarty.const.IA_URL}blog/{$one_blog_entry.id}-{$one_blog_entry.alias}" class="news-item-sm__image">{printImage imgfile=$one_blog_entry.image title=$one_blog_entry.title|escape: 'html'}</a>
				{/if}
				<div class="news-item-sm__body">
					<h5 class="news-item-sm__body-title"><a href="{$smarty.const.IA_URL}blog/{$one_blog_entry.id}-{$one_blog_entry.alias}">{$one_blog_entry.title|escape: 'html'}</a></h5>
					<p class="news-item-sm__body-date">{$one_blog_entry.date_added|date_format:$core.config.date_format}</p>
				</div>
			</div>

			{if $one_blog_entry@iteration == $core.config.blog_number_new_block}
				{break}
			{/if}
		{/foreach}
	</div>

	<p class="latest-news-more">
		<a href="{$smarty.const.IA_URL}blog/">Все новости &rarr;</a>
	</p>
{else}
	<div class="alert alert-info">{lang key='no_blog_entries'}</div>
{/if}