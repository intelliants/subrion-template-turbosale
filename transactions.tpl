{if $transactions}
	<div class="sec-header">
		<h4 class="box__caption">{lang key='current_assets'}</h4>
	</div>

	<table class="tbl tbl-striped tbl-bordered">
	<thead>
		<tr>
			<th>{lang key='reference_id'}</th>
			<th>{lang key='operation'}</th>
			<th>{lang key='status'}</th>
			<th>{lang key='date'}</th>
			<th>{lang key='gateway'}</th>
			<th>{lang key='total'}</th>
			<th>&nbsp;</th>
		</tr>
	</thead>
	<tbody>
	{foreach $transactions as $transaction}
		<tr>
			<td>{$transaction.reference_id}</td>
			<td>{$transaction.operation}</td>
			<td class="{$transaction.status}">{$transaction.status}</td>
			<td>{$transaction.date|date_format:$core.config.date_format}</td>
			<td>{$transaction.gateway}</td>
			<td>{$transaction.amount} {$transaction.currency}</td>
			<td>
				{if iaTransaction::PENDING == $transaction.status}
					{if empty($transaction.gateway)}
						<a href="pay/{$transaction.sec_key}/" class="btn btn-xs btn-primary">{lang key='pay'}</a>
					{else}
						<a href="pay/{$transaction.sec_key}/?repay" class="btn btn-xs">{lang key='change_gateway'}</a>
					{/if}
					<a href="pay/{$transaction.sec_key}/?delete" class="btn btn-xs btn-danger js-cancel-invoice">{lang key='cancel'}</a>
				{elseif iaTransaction::PASSED == $transaction.status}
					<a href="{$smarty.const.IA_SELF}invoice/{$transaction.sec_key}/" class="btn btn-xs btn-info" target="_blank">{lang key='print_invoice'}</a>
				{/if}
			</td>
		</tr>
	{/foreach}
	</tbody>
	</table>

	{navigation aTotal=$pagination.total aTemplate=$pagination.template aItemsPerPage=$pagination.limit aNumPageItems=5 aTruncateParam=1}

	{ia_add_js}
$(function() {
	$('.js-cancel-invoice').on('click', function(e) {
		e.preventDefault();

		intelli.confirm(_t('are_you_sure_to_cancel_invoice'), { url: $(this).attr('href') });
	});
});
	{/ia_add_js}
{else}
	<div class="alert alert-info">На вашем счету не было никаких движений.</div>
{/if}

<div class="funds-add">
	<div class="sec-header">
		<h4 class="box__caption">Пополнить баланс</h4>
	</div>

	<div class="row">
		<div class="col-md-6">
			<p>Средства на вашем счету необходмы для поднятия ваших объвлений вверх в списках, либо для переноса вашего объявления в раздел "Горячие предложения"</p>
			<table class="funds-add__table">
				<tbody>
					<tr>
						<td>Минимальный депозит</td>
						<td>{$core.config.currency} {$core.config.funds_min_deposit}</td>
					</tr>
					<tr>
						<td>Максимальный депозит</td>
						<td>{$core.config.currency} {$core.config.funds_max_deposit}</td>
					</tr>
					<tr>
						<td>Максимальный баланс</td>
						<td>{$core.config.currency} {$core.config.funds_max}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-md-6">
			<form method="post" class="ia-form">
				{preventCsrf}

				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon">Сумма</span>
						<input class="form-control" type="text" name="amount" id="amount" placeholder="{$core.config.funds_min_deposit}">
						<span class="input-group-btn">
							<button class="btn btn-primary" type="submit">Пополнить на эту сумму</button>
						</span>
					</div>
				</div>
			</form>
			<h4>Оплата через <img src="{$img}mobilnik-logo.png" alt=""></h4>
			<p>Ваш лицевой счет: <b>{$member.id}</b></p>
		</div>
	</div>
</div>