<p>{lang key='calc_lead_text'}</p>

<div class="alert alert-danger js-loan-calculator-alert" style="display: none;"></div>

<div class="form-horizontal">
	<div class="form-group">
		<label class="col-md-4 control-label" for="">{lang key='calc_vehicle_price'}</label>
		<div class="col-md-8">
			<input type="text" class="form-control numbersOnly vehicle_price" value="{if !empty($item.price)}{$item.price}{/if}" id="vehicle_price">
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-4 control-label" for="">{lang key='calc_interest_rate'}</label>
		<div class="col-md-8">
			<input type="text" class="form-control numbersOnly interest_rate" id="interest_rate">
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-4 control-label" for="">{lang key='calc_period'}</label>
		<div class="col-md-8">
			<input type="text" class="form-control numbersOnly period_month" id="period_month">
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-4 control-label" for="">{lang key='calc_down_payment'}</label>
		<div class="col-md-8">
			<input type="text" class="form-control numbersOnly down_payment" id="down_payment">
		</div>
	</div>
</div>

<div class="js-calculator-results calc-results m-b" style="display: none;">
	<div class="calc-results-inner">
		<div class="stm-calc-label"><b>{lang key='calc_monthly_payment'}</b></div>
		<div class="monthly_payment"></div>

		<div class="stm-calc-label m-t"><b>{lang key='calc_total_interest_payment'}</b></div>
		<div class="total_interest_payment"></div>

		<div class="stm-calc-label m-t"><b>{lang key='calc_total_amount_to_pay'}</b></div>
		<div class="total_amount_to_pay"></div>
	</div>
</div>

<a href="#" class="btn btn-primary js-calculate-load">{lang key='calc_calculate'}</a>

{ia_add_media files='js:_IA_URL_modules/autos/js/front/calculator'}
