{if isset($blog_entry)}
	<div class="news-entry">

		{if $blog_entry.image}
			<div class="news-entry__image">{ia_image file=$blog_entry.image title=$blog_entry.title|escape:'html' class='img-responsive' type='large'}</div>
		{/if}

		<div class="news-entry__body">{$blog_entry.body}</div>

		<hr>

		<p class="news-entry__date">{$blog_entry.date_added|date_format:$core.config.date_format}</p>

		{if $blog_tags}
			<div class="news-entry__tags">
				<span class="fa fa-tags"></span>
				{lang key='tags'}:
				{foreach $blog_tags as $tag}
					<a href="{$smarty.const.IA_URL}tag/{$tag.alias}">{$tag.title|escape:'html'}</a>{if !$tag@last}, {/if}
				{/foreach}
			</div>
		{/if}

		<!-- Go to www.addthis.com/dashboard to customize your tools -->
		<div class="addthis_sharing_toolbox"></div>
	</div>
{else}
	{if $blog_entries}
		<div class="newsreel">
			{foreach $blog_entries as $blog_entry}
				<div class="news-item">
					{if $blog_entry.image}
						<a href="{$smarty.const.IA_URL}blog/{$blog_entry.id}-{$blog_entry.alias}" class="news-item__image">{ia_image file=$blog_entry.image title=$blog_entry.title type='thumbnail'}</a>
					{/if}
					<div class="news-item__body">
						<h4 class="news-item__heading">
							<a href="{$smarty.const.IA_URL}blog/{$blog_entry.id}-{$blog_entry.alias}">{$blog_entry.title|escape:'html'}</a>
						</h4>
						<div class="news-item__body-info">
							<p class="news-item__date">{$blog_entry.date_added|date_format:$core.config.date_format}</p>
							{if $blog_tags}
								{$tagsExist=0}
								{foreach $blog_tags as $tag}
									{if $blog_entry.id == $tag.blog_id}
										{$tagsExist = $tagsExist + 1}
									{/if}
								{/foreach}
								{if $tagsExist != 0}
									<p class="news-item__tags">
										<span class="fa fa-tags"></span>
										{foreach $blog_tags as $tag}
											{if $blog_entry.id == $tag.blog_id}
												<a href="{$smarty.const.IA_URL}tag/{$tag.alias}">{$tag.title|escape: 'html'}</a>, 
											{/if}
										{/foreach}
									</p>
								{/if}
							{/if}
						</div>

						<div class="news-item__intro">{$blog_entry.body|strip_tags|truncate:$core.config.blog_max:'...'}</div>
					</div>
				</div>
			{/foreach}
		</div>

		{navigation aTotal=$pagination.total aTemplate=$pagination.template aItemsPerPage=$core.config.blog_number aNumPageItems=5}
	{else}
		<div class="alert alert-info">{lang key='no_blog_entries'}</div>
	{/if}
{/if}