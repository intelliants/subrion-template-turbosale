{*<div class="sorting">
	<span class="sorting__head">Сортировать по:</span>
	<a class="{if 'date_added' == $sorting.field}active{/if}" href="{$smarty.const.IA_SELF}?sort=date" rel="nofollow">Дате</a>
	<a class="{if 'price' == $sorting.field}active{/if}" href="{$smarty.const.IA_SELF}?sort=price" rel="nofollow">Цене</a>
	<a class="{if 'release_year' == $sorting.field}active{/if}" href="{$smarty.const.IA_SELF}?sort=year" rel="nofollow">Году</a>
</div>*}