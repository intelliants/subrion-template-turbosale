{if $categories}
	<div class="ia-categories">
		<div class="row ia-cats">
			{$catsPerCol = ceil(count($categories)/4)}

			<div class="col-md-3">
				{foreach $categories as $category}
					<div class="ia-cat">
						<span class="fa fa-folder"></span>
						<a href="{$core.packages.autos.url}parts/{$category.alias}">{lang key="field_autos_parts_categories_{$category.node_id}"}</a>
					</div>

					{if $category@iteration % $catsPerCol == 0 && !$category@last}
						</div>
						<div class="col-md-3">
					{/if}
				{/foreach}
			</div>
		</div>
	</div>

	<hr>
{/if}

{if $listings}
	<div class="ia-items">
		<div class="row">
			{foreach $listings as $listing}
				<div class="col-md-3">
					{include file='extra:autos/list-autos_parts'}
				</div>

				{if $listing@iteration % 4 == 0}
					</div>
					<div class="row">
				{/if}
			{/foreach}
		</div>
	</div>

	{navigation aTotal=$pagination.total aTemplate=$pagination.url aItemsPerPage=$pagination.limit aIgnore=true}
{else}
	<div class="alert alert-info">
		{lang key='no_parts_to_show'}
	</div>
{/if}