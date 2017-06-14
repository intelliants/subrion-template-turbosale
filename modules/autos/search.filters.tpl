{if isset($car_blocks_data.filters.makes)}
    <div class="form-group">
        <label>{lang key='make'}</label>
        <select name="mk" class="form-control no-js js-car-make">
            <option value="">{lang key='make'}</option>
            {foreach $car_blocks_data.filters.makes as $entry}
                <option value="{$entry.id}"{if isset($filters.params.mk) && $filters.params.mk == $entry.id} selected{/if}>{$entry.name|escape}</option>
            {/foreach}
        </select>
    </div>
    <div class="form-group">
        <label>{lang key='model'}</label>
        <select name="md" class="form-control no-js js-car-model" disabled{if !empty($filters.params.md)} data-id="{$filters.params.md|intval}"{/if}>
            <option value="">{lang key='model'}</option>
        </select>
    </div>
    {ia_print_js files='_IA_URL_modules/autos/js/front/search'}
    {ia_add_js}
$(function() {
    var $form = $('#js-item-filters-form'),
        $model = $('.js-car-model', $form);

    if ($model.data('id')) $('.js-car-make', $form).trigger('change');

    if (!!parseInt(intelli.config.search_instant)) {
        $model.on('change', function() {
            intelli.search.run();
        });
    }
});
    {/ia_add_js}
{/if}

{if isset($car_blocks_data.filters.parts)}
    <div class="form-group">
        <label>{lang key='keywords'}</label>
        <input type="text" name="kw" placeholder="{lang key='parts_keywords_placeholder'}" class="form-control">
    </div>
    <div class="form-group">
        <label>{lang key='category'}</label>
        <select class="form-control" name="cat">
            <option value="">{lang key='any'}</option>
            {$selected = (isset($filters.params.cat)) ? $filters.params.cat : null}
            {html_options options=$car_blocks_data.filters.parts selected=$selected}
        </select>
    </div>
{/if}

{if isset($car_blocks_data.filters.services)}
    <div class="form-group">
        <label>{lang key='keywords'}</label>
        <input type="text" name="kw" placeholder="{lang key='services_keywords_placeholder'}" class="form-control"{if isset($filters.params.kw)} value="{$filters.params.kw|escape}"{/if}>
    </div>
    <div class="form-group">
        <label>{lang key='category'}</label>
        <select class="form-control" name="cat">
            <option value="">{lang key='any'}</option>
            {$selected = (isset($filters.params.cat)) ? $filters.params.cat : null}
            {html_options options=$car_blocks_data.filters.services selected=$selected}
        </select>
    </div>
{/if}