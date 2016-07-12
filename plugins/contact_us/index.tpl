<div class="slogan">
	{lang key='contact_top_text'}
</div>

<form action="{$smarty.const.IA_URL}contacts/" method="post" id="contact" class="ia-form ia-form-auto">
	{preventCsrf}

	{if isset($smarty.get.carId)}
		<div class="alert alert-warning">
			Жалоба на объявление: <a class="alert-link" href="{$car_info.url}">{$car_info.model}, {$car_info.release_year} <span class="fa fa-external-link"></span></a> ({$car_info.owner_fullname})
		</div>
		<input type="hidden" name="car_complaint" value='Жалоба на объявление: {$car_info.id}'>
	{/if}

	<div class="form-group row">
		<div class="col-sm-4">
			<div class="form-group">
				<label for="name">Ваше имя: <span class="required">*</span></label>
				<input class="form-control" type="text" name="name" id="contact-name" value="{if isset($smarty.post.name)}{$smarty.post.name}{/if}">
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="email">{lang key='email'}: <span class="required">*</span></label>
				<input class="form-control" type="text" name="email" id="contact-email" value="{if isset($smarty.post.email)}{$smarty.post.email}{/if}">
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="phone">Телефон:</label>
				<input class="form-control" type="text" name="phone" id="contact-phone" value="{if isset($smarty.post.phone)}{$smarty.post.phone}{/if}">
			</div>
		</div>
	</div>

	{if !empty($subjects)}
		<div class="form-group">
			<label for="subject">Тема сообщения:</label>
			<select class="form-control" name="subject" id="contact-subject">
				<option>{lang key='_select_'}</option>
				{foreach $subjects as $subject}
					<option value="{lang key=$subject default=$subject}">{lang key=$subject default=$subject}</option>
				{/foreach}
			</select>
		</div>
	{/if}

	<div class="form-group">
		<label for="msg">Сообщение: <span class="required">*</span></label>
		<textarea class="form-control" id="msg" name="msg" rows="5">{if isset($smarty.post.msg)}{$smarty.post.msg}{/if}</textarea>
		{ia_add_js}
$(function()
{
	$('#msg').dodosTextCounter('500', { counterDisplayElement: 'span', counterDisplayClass: 'textcounter_msg' });
	$('.textcounter_msg').addClass('textcounter').wrap('<p class="help-block text-right"></p>').before('{lang key='chars_left'} ');
});
		{/ia_add_js}
		{ia_print_js files='jquery/plugins/jquery.textcounter'}
	</div>

	<div class="ia-form__after-tabs">
		{include file='captcha.tpl'}

		<div class="fieldset__actions">
			<input type="submit" class="btn btn-primary" value="Отправить">
		</div>
	</div>
</form>