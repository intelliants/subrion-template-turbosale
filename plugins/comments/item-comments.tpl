{if isset($comments) && isset($item)}
	<div class="b-comments">
		<div class="sec-header">
			<h4 class="box__caption">КОММЕНТАРИИ</h4>
			<div class="sec-header__actions">
				{if !empty($comments)}<a href="{$smarty.const.IA_SELF}#" class="btn btn-primary btn-xs" id="add-comment-btn"><span class="fa fa-pencil"></span> {lang key='add_comment'}</a>{/if}
			</div>
		</div>

		<div id="comments-form" class="b-comments__form">
			<div class="alert alert-danger hidden" id="comments-alert"></div>
			{if !$core.config.comments_allow_guests && empty($member)}
				<div class="alert alert-info">{lang key="error_comment_logged"}</div>
			{else}
				<form action="" class="comment-form" method="post" id="comment-form"{if !empty($comments)} style="display: none;{/if}">
					{preventCsrf}
					{if $member}
						<input type="hidden" name="author" value="{$member.username}">
						<input type="hidden" name="email" value="{$member.email}">

						{if isset($userCars) && $userCars}
							<div class="row">
								<div class="col-sm-3">
									<div class="form-group">
										<label class="checkbox b-comments__offer">
											<input class="js-offer-toggle" type="checkbox" name="auto_pictures" value="1">
											Предложить обмен
										</label>
									</div>
								</div>
								<div class="col-sm-9">
									<div class="form-group">
										<select name="auto_id" class="form-control input-sm js-offer" style="display: none;">
											<option value="">Выберите свое авто из гаража</option>
											{foreach $userCars as $car}
												<option value="{$car.id}">{$car.model}, {$car.release_year} &mdash; {$car.price_formatted}</option>
											{/foreach}
										</select>
									</div>
								</div>
							</div>
						{/if}
					{else}
						<div class="form-group">
							<input type="text" id="author-name" class="form-control" placeholder="Ваше имя" name="author" size="25" value="">
						</div>
					{/if}
					<div class="form-group">
						<!-- <label for="comment-body">Введите текст вашего комментария:</label> -->
						{if !$core.config.comments_allow_wysiwyg}
							<textarea name="comment_body" class="form-control" id="comment-body" rows="3" placeholder="Введите текст вашего комментария"></textarea>
						{else}
							{ia_wysiwyg name='comment_body' id='comment_form'}
							{ia_print_js files='ckeditor/ckeditor'}
						{/if}
					</div>
					<div class="form-group" id="comments-captcha">
						{include file='captcha.tpl'}
					</div>
					<div class="alert" id="comments-alert" style="display: none;">
						<ul class="unstyled"></ul>
					</div>
					<input type="hidden" name="item_id" value="{$item.id}">
					<input type="hidden" name="item" value="{$item.item}">
					<button class="btn btn-primary" type="button" id="leave_comment" name="add_comment">{lang key='leave_comment'}</button>
				</form>
				{if empty($comments)}
					<div class="alert alert-info">{lang key='no_comments'}</div>
				{/if}
				{ia_print_js files='jquery/plugins/jquery.textcounter'}
			{/if}

			{if !empty($comments)}
				<div id="comments-container">
					<div class="comments-list">
						{foreach $comments as $comment name='comments_list'}
							{include file="extra:comments/comment"}
						{/foreach}
					</div>
				</div>
			{/if}

			{ia_print_js files='_IA_URL_plugins/comments/js/frontend/comments'}

			{ia_add_js}
$(function() {
	$('.js-offer-toggle').on('change', function() {
		if ($(this).prop('checked')) {
			$('.js-offer').show();
		} else {
			$('.js-offer').hide();
		}
	});
});
			{/ia_add_js}
		</div>
	</div>
{/if}