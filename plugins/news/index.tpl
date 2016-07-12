{if isset($entry)}
	<div class="news-entry">
		<p class="news-entry__date">{$entry.date|date_format:$core.config.date_format}</p>

		{if $entry.image}
			<div class="news-entry__image">{printImage imgfile=$entry.image fullimage=true title=$entry.title class="img-responsive"}</div>
		{/if}

		<div class="news-entry__body">{$entry.body}</div>

		<hr>
		<ul class="list-inline share-buttons">
			<li><a href="https://www.facebook.com/sharer/sharer.php?u={$smarty.const.IA_SELF|escape:'url'}&t={$entry.title}" target="_blank" title="Share on Facebook"><i class="fa fa-facebook-square fa-2x"></i></a></li>
			<li><a href="https://twitter.com/intent/tweet?source={$smarty.const.IA_SELF|escape:'url'}&text={$entry.title}:{$smarty.const.IA_SELF|escape:'url'}" target="_blank" title="Tweet"><i class="fa fa-twitter-square fa-2x"></i></a></li>
			<li><a href="https://plus.google.com/share?url={$smarty.const.IA_SELF|escape:'url'}" target="_blank" title="Share on Google+"><i class="fa fa-google-plus-square fa-2x"></i></a></li>
			{if $entry.image}
				<li><a href="http://pinterest.com/pin/create/button/?url={$smarty.const.IA_SELF|escape:'url'}&media={printImage imgfile=$entry.image url=true fullimage=true}&description={$entry.body|strip_tags|truncate:250:'...'}" target="_blank" title="Pin it"><i class="fa fa-pinterest-square fa-2x"></i></a></li>
			{/if}
			<li><a href="mailto:?subject={$entry.title}&body={$entry.body|strip_tags|truncate:250:'...'}:{$smarty.const.IA_SELF|escape:'url'}" target="_blank" title="Email"><i class="fa fa-envelope-square fa-2x"></i></a></li>
		</ul>
	</div>
{else}
	{if $news}
		<div class="newsreel">
			{foreach $news as $entry}
				<div class="news-item">
					{if $entry.image}
						<a href="{$smarty.const.IA_URL}news/{$entry.id}-{$entry.alias}" class="news-item__image">{printImage imgfile=$entry.image title=$entry.title}</a>
					{/if}
					<div class="news-item__body">
						<h4 class="news-item__heading">
							<a href="{$smarty.const.IA_URL}news/{$entry.id}-{$entry.alias}">{$entry.title}</a>
						</h4>
						<p class="news-item__date">{$entry.date|date_format:$core.config.date_format}</p>
						<div class="news-item__intro">{$entry.body|strip_tags|truncate:$core.config.news_max:'...'}</div>
					</div>
				</div>
			{/foreach}
		</div>

		{navigation aTotal=$pagination.total aTemplate=$pagination.url aItemsPerPage=$pagination.limit aNumPageItems=5}
	{else}
		<div class="alert alert-info">{lang key='no_news'}</div>
	{/if}
{/if}