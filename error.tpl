{if iaView::ERROR_NOT_FOUND == $code}
	<div class="p-404">
		<div class="container">
			<h1>404<small>{lang key='road_not_fount'}</small></h1>
		</div>
	</div>
{/if}

{ia_hooker name='smartyFrontErrorPage'}