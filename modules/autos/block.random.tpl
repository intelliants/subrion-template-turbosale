{if isset($car_blocks_data.random)}
    <div class="random-cars">
        <div class="container">
            <h4 class="box__caption">{$block.title}</h4>
            <div class="owl-carousel ia-carousel js-carousel-random">
                {foreach $car_blocks_data.random as $item}
                    <div class="ia-carousel__item">
                        <div class="ia-card">
                            {if !empty($item.pictures)}
                                <a class="ia-card__image" href="{$item.link}">
                                    {ia_image file=$item.pictures[0] title=$item.model type='thumbnail'}

                                    <span class="ia-card__sup-info"><span class="fa fa-camera"></span> {$item.pictures_num}</span>
                                </a>
                            {/if}

                            <div class="ia-card__content">
                                <a class="ia-card__title" href="{$item.link}">{$item.model}</a>
                                <p class="ia-card__price">{$item.price_formatted}</p>
                                <p class="ia-card__info">
                                    {$item.release_year}{if $item.mileage}, {$item.mileage} км{/if}{if $item.transmission}, {lang key="field_autos_transmission+{$item.transmission}"}{/if}
                                </p>
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
        </div>
    </div>

    {ia_add_js}
$(function() {
    $('.js-carousel-random').owlCarousel({
        items: 6,
        margin: 10,
        dots: false,
        nav: true,
        navText: ['<span class="fa fa-angle-left"></span>','<span class="fa fa-angle-right"></span>'],
        responsive: {
            0: {
                items: 1
            },
            320: {
                items: 2
            },
            500: {
                items: 3
            },
            768: {
                items: 6
            }
        }
    });
});
    {/ia_add_js}
{/if}