{if isset($blog_entries)}
	{foreach $blog_entries as $blog_entry}
		<div class="news-item">
			{if $blog_entry.image}
				<a href="{$smarty.const.IA_URL}blog/{$blog_entry.id}-{$blog_entry.alias}" class="news-item__image">{printImage imgfile=$blog_entry.image title=$blog_entry.title}</a>
			{/if}
			<div class="news-item__body">
				<h4 class="news-item__heading">
					<a href="{$smarty.const.IA_URL}blog/{$blog_entry.id}-{$blog_entry.alias}">{$blog_entry.title|escape:'html'}</a>
				</h4>
				<div class="news-item__body-info">
					<p class="news-item__date">{$blog_entry.date_added|date_format:$core.config.date_format}</p>
				</div>

				<div class="news-item__intro">{$blog_entry.body|strip_tags|truncate:$core.config.blog_max:'...'}</div>
			</div>
		</div>
	{/foreach}

	{navigation aTotal=$pagination.total aTemplate=$pagination.template aItemsPerPage=$core.config.blog_number aNumPageItems=5}
{else}
	{if $tags}
		{foreach $tags as $tag}
			{if $tag != ''}
				<div class="media ia-item">
					<div class="media-body">
						<h4 class="media-heading">
							<a href="{$smarty.const.IA_URL}tag/{$tag.alias}">#{$tag.title|escape:'html'}</a>
						</h4>
					</div>
				</div>
			{/if}
		{/foreach}

		{navigation aTotal=$pagination.total aTemplate=$pagination.template aItemsPerPage=$core.config.tag_number aNumPageItems=5}
	{else}
		<div class="alert alert-info">{lang key='no_tags'}</div>
	{/if}
{/if}