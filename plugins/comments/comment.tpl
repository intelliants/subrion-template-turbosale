<div class="comment clearfix">
	<div class="comment__head">
		{if $comment.author_avatar}
			{if $comment.author_avatar}
				{printImage imgfile=$comment.author_avatar.path class="comment__ava" title=$comment.author}
			{else}
				<img src="{$img}no-avatar.png" class="comment__ava" alt="{$comment.author}">
			{/if}
		{else}
			<img src="{$img}no-avatar.png" class="comment__ava" alt="{$comment.author}">
		{/if}
		<span class="comment__name">
			{if '0' == $comment.member_id}
				{$comment.author|escape:'html'}
			{else}
				{ia_url type='link' data=$comment item='members' text=$comment.author}
			{/if}
		</span>
		{if isset($comment.auto_id) && $comment.auto_id}<span class="comment__ex">предлагает обмен</span>{/if}
		<span class="comment__date">{$comment.date|date_format:$core.config.date_format}</span>
	</div>
	<div class="comment__body">
		{if isset($comment.auto_id) && $comment.auto_id}
			<div class="ia-card">

				{if $comment.auto_pictures}
					<a class="ia-card__image" href="{$comment.auto_url}">
						{printImage imgfile=$comment.auto_pictures[0]['path'] title=$comment.auto_title}
					</a>
				{else}
					<a class="ia-card__image" href="{$comment.auto_url}">
						<img src="{$img}no-car-preview.png" alt="">
					</a>
				{/if}

				<div class="ia-card__content">
					<a class="ia-card__title" href="{$comment.auto_url}">{$comment.auto_title}, {$comment.auto_release_year}</a>
					<p class="ia-card__price">{$comment.auto_price}</p>
				</div>
			</div>
		{/if}

		{$comment.body}
	</div>
</div>