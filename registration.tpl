<div class="row">
	<div class="col-md-{if $core.providers}8{else}12{/if}">
		<div class="ia-form-info">
			<p>{lang key='registration_annotation'}</p>

			<p>Поля, обязательные к заполнению, помечены <span class="text-danger">*</span> (звёздочкой)</p>
		</div>

		<form method="post" action="{$smarty.const.IA_SELF}" enctype="multipart/form-data" class="ia-form ia-form-user-register">
			{preventCsrf}

			{*include file='plans.tpl' item=$tmp*}

			{*include file='field-type-content-fieldset.tpl' item_sections=$sections item=$tmp*}

			<div class="fieldset">
				<div class="fieldset__header">Общие сведения о вас</div>
				<div class="fieldset__content">
					<div class="form-group">
						<label for="field_username">Логин: <span class="required">*</span><small>латинскими буквами, цифрами</small></label>
						<input class="form-control" type="text" name="username" value="{if isset($tmp.username)}{$tmp.username}{/if}" id="field_username" maxlength="50">
						<p class="help-block">Логин используется для входа в ваш профиль на сайте. Не используйте Email в качестве логина!</p>
					</div>

					<div class="form-group">
						<label for="field_email">Почта: <span class="required">*</span><small>ваш email</small></label>
						<input class="form-control" type="text" name="email" value="{if isset($tmp.email)}{$tmp.email}{/if}" id="field_email" maxlength="250">
						<p class="help-block">Почта необходима для обратной связи в случае, если вы забыли пароль.</p>
					</div>
					
					<div class="form-group">
						<label for="field_fullname">Ваше имя: <span class="required">*</span><small>видно всем пользователям</small></label>
						<input class="form-control" type="text" name="fullname" value="{if isset($tmp.fullname)}{$tmp.fullname}{/if}" id="field_fullname" maxlength="250">
					</div>

					<div class="form-group">
						<label for="field_phone">Телефон:<small>для быстрой связи с вами</small></label>
						<input class="form-control" type="text" name="phone" value="" id="field_phone" maxlength="250">
					</div>
				</div>
			</div>

			<div class="fieldset m-b">
				<div class="fieldset__header">Пароль</div>
				<div class="fieldset__content">
					<div class="form-group">
						<div class="checkbox">
							<label>
								<input type="checkbox" name="disable_fields" id="disable_fields" value="1"{if isset($smarty.post.disable_fields) && $smarty.post.disable_fields} checked{/if}> {lang key='auto_generate_password'}
							</label>
						</div>
					</div>

					<div id="pass_fieldset" {if isset($smarty.post.disable_fields) && 1 == $smarty.post.disable_fields}style="display: none;"{/if}>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="pass1">{lang key='your_password'}: <span class="required">*</span></label>
									<input class="form-control" type="password" name="password" id="pass1" value="{if isset($tmp.password)}{$tmp.password}{/if}">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="pass2">{lang key='your_password_confirm'}: <span class="required">*</span></label>
									<input class="form-control" type="password" name="password2" id="pass2" value="{if isset($tmp.password)}{$tmp.password}{/if}">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="ia-form__after-tabs">
				{include file='captcha.tpl'}

				<div class="fieldset__actions">
					<button type="submit" name="register" class="btn btn-success">{lang key='registration'}</button>
				</div>
			</div>
		</form>
	</div>
	{if $core.providers}
		<div class="col-md-4">
			<div class="social-btns-wrp">
				<p>Или войдите через соц. сеть</p>
				<div class="social-btns">
					{foreach $core.providers as $name => $provider}
						<a class="s-btn s-btn--block -{$name|lower}" href="{$smarty.const.IA_URL}login/{$name|lower}/"><span>{$name}</span></a>
					{/foreach}
				</div>
			</div>
		</div>
	{/if}
</div>

{ia_print_js files='frontend/registration'}