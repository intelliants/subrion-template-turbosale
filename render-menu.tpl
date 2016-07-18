{if 'mainmenu' == $position}
	{ia_menu menus=$menu.contents class="nav navbar-nav navbar-left nav-main {$menu.classname}"}
{elseif 'inventory' == $position}
	{ia_menu menus=$menu.contents class="nav nav-inventory {$menu.classname}" loginout=true}
{elseif 'account' == $position}
	{if 'account' == $menu.name && $member && $core.config.members_enabled}
		<ul class="nav navbar-nav navbar-right">
			<li><a href="{$smarty.const.IA_URL}favorites/"><span class="fa fa-bookmark"></span> {lang key='favorites'}</a></li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					<span class="fa fa-user"></span> 
					{$member.fullname|default:$member.username}
					<span class="fa fa-angle-down"></span>
				</a>
				{ia_hooker name='smartyFrontInsideAccountBox'}
				{ia_menu menus=$menu.contents class='dropdown-menu pull-right' loginout=true}
			</li>
		</ul>
	{else}
		<ul class="nav navbar-nav navbar-right">
			<li><a href="{$smarty.const.IA_URL}favorites/"><span class="fa fa-bookmark"></span> {lang key='favorites'}</a></li>
			<li><a data-toggle="modal" data-target="#loginModal" href="#"><span class="fa fa-sign-in"></span> {lang key='login_sign_up'}</a></li>
		</ul>

		<div class="modal fade login-modal" id="loginModal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="icon-cross"></span></button>
						<h4 class="modal-title">{lang key='login_sign_up'}</h4>
					</div>
					<div class="modal-body">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-6">
									<h4>{lang key='login'}</h4>

									<form action="{$smarty.const.IA_URL}login/" method="post">
										{preventCsrf}

										<div class="form-group">
											<label for="field_login">{lang key='username'}:</label>
											<input class="form-control" type="text" tabindex="4" name="username" value="{if isset($smarty.post.username)}{$smarty.post.username|escape:'html'}{/if}">
										</div>
										<div class="form-group">
											<label for="field_password">{lang key='password'}:</label>
											<input class="form-control" type="password" tabindex="5" name="password">
										</div>
										<div class="form-group form-actions">
											<button class="btn btn-primary" type="submit" tabindex="6" name="login">{lang key='login'}</button>
											<a class="btn btn-link" href="{$smarty.const.IA_URL}forgot/">{lang key='forgot_password'}</a>
										</div>
									</form>
								</div>
								<div class="col-md-6">
									<h4>{lang key='register'}!</h4>
									<p>{lang key='register_tag'}</p>
									<p><a class="btn btn-success" href="{$smarty.const.IA_URL}registration/" rel="nofollow">{lang key='registration'}</a></p>
								</div>
							</div>
						</div>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	{/if}
{elseif in_array($position, array('left', 'right', 'user1', 'user2', 'top'))}
	{if !empty($menu.contents[0]) && 'account' != $menu.name}
		{ia_block ismenu=true title=$menu.title movable=true id=$menu.id name=$menu.name collapsible=$menu.collapsible classname=$menu.classname}
			{ia_menu menus=$menu.contents class="list-group {$menu.classname}"}
		{/ia_block}
	{/if}
{elseif in_array($position, array('footer1', 'footer2', 'footer3', 'footer4'))}
	{if $menu.header || isset($manageMode)}
		<div class="b-footer">
			<h4 class="b-footer__heading">{$menu.title}</h4>
			<div class="b-footer__content">
				{ia_menu menus=$menu.contents class="list-unstyled {$menu.classname}"}
			</div>
		</div>
	{else}
		{ia_menu menus=$menu.contents class="list-unstyled {$menu.classname}"}
	{/if}
{else}
	<!--__ms_{$menu.id}-->
	{if $menu.header || isset($manageMode)}
		<div class="nav-menu-header {$menu.classname}">{$menu.title}</div>
	{else}
		<div class="menu {$menu.classname}">
	{/if}

	<!--__ms_c_{$menu.id}-->
	{ia_menu menus=$menu.contents class='nav'}
	<!--__me_c_{$menu.id}-->

	{if $menu.header || isset($manageMode)}
	{else}
		</div>
	{/if}
	<!--__me_{$menu.id}-->
{/if}