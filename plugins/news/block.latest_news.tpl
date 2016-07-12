{if isset($news_latest) && $news_latest}
	<div class="news">
		<div class="sec-header">
			<h4 class="box__caption">{lang key='this_is_interesting'}</h4>
			<div class="sec-header__actions">
				<a href="{$smarty.const.IA_URL}news/">{lang key='all_news'}</a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				{foreach $news_latest as $entry}
					{if $entry@first}
						<div class="news__item news__item--lead">
							<a class="news__item__img" href="{$smarty.const.IA_URL}news/{$entry.id}-{$entry.alias}">
								{printImage imgfile=$entry.image|default:'' fullimage=true title=$entry.title class='img-responsive'}
							</a>
							<h4 class="news__item__title"><a href="{$smarty.const.IA_URL}news/{$entry.id}-{$entry.alias}">{$entry.title}</a></h4>
							<p>{$entry.body|strip_tags|truncate:300:'...'}</p>
							<p class="news__item__actions">
								<span class="news__item__date">{$entry.date|date_format:$core.config.date_format}</span>
								<a href="{$smarty.const.IA_URL}news/{$entry.id}-{$entry.alias}">{lang key='read_more'}</a>
							</p>
						</div>
					{/if}
				{/foreach}
			</div>
			<div class="col-md-6">
				{foreach $news_latest as $entry}
					{if !$entry@first}
						<div class="news__item">
							<a class="news__item__img" href="{$smarty.const.IA_URL}news/{$entry.id}-{$entry.alias}">
								{printImage imgfile=$entry.image|default:'' title=$entry.title class='img-responsive'}
							</a>
							<h5 class="news__item__title"><a href="{$smarty.const.IA_URL}news/{$entry.id}-{$entry.alias}">{$entry.title}</a></h5>
							<p>{$entry.body|strip_tags|truncate:$core.config.news_max_block:'...'}</p>
							<p class="news__item__date">{$entry.date|date_format:$core.config.date_format}</p>
						</div>
					{/if}
				{/foreach}
			</div>
		</div>
	</div>
{/if}