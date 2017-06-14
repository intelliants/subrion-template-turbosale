<!DOCTYPE html>
<html lang="ru" dir="ltr">
    <head>
        {ia_hooker name='smartyFrontBeforeHeadSection'}

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <title>{ia_print_title}</title>
        <meta name="description" content="{$core.page['meta-description']}">
        <meta name="keywords" content="{$core.page['meta-keywords']}">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="generator" content="Subrion CMS - Best Auto Classified System">
        <meta name="robots" content="index">
        <meta name="robots" content="follow">
        <meta name="revisit-after" content="1 day">
        <base href="{$smarty.const.IA_URL}">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <link rel="shortcut icon" href="{$core.page.nonProtocolUrl}favicon.ico">

        {ia_add_media files="jquery, subrion, bootstrap" order=0}
        {ia_print_js files='_IA_TPL_owl.carousel.min, _IA_TPL_app' order=999}

        {ia_hooker name='smartyFrontAfterHeadSection'}

        {ia_print_css display='on'}

        {ia_add_js}
intelli.pageName = '{$core.page.name}';

{foreach $core.customConfig as $key => $value}
    intelli.config.{$key} = '{$value}';
{/foreach}
        {/ia_add_js}
    </head>

    <body class="page-{$core.page.name}{if $core.config.fixed_navbar} -fixed-navbar{/if}">
        <nav class="navbar navbar-default {if $core.config.fixed_navbar}navbar-fixed-top{/if}">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                        <span class="kebab-1"></span>
                        <span class="kebab-2"></span>
                        <span class="kebab-3"></span>
                    </button>
                    <a href="{$core.packages.autos.url}add/" class="navbar-add-car"><span class="icon-1"></span><span class="fa fa-plus-circle"></span></a>

                    <a class="navbar-brand" href="{$smarty.const.IA_URL}">
                        {if !empty($core.config.site_logo)}
                            <img src="{$core.page.nonProtocolUrl}uploads/{$core.config.site_logo}" alt="{$core.config.site}">
                        {else}
                            <span></span>
                        {/if}
                    </a>
                </div>

                <div class="collapse navbar-collapse" id="navbar-collapse">
                    <a class="btn btn-success navbar-btn navbar-right" href="{$core.packages.autos.url}add/">{lang key='sell_car'}</a>

                    {ia_blocks block='account'}
                    {ia_blocks block='mainmenu'}
                </div>
            </div>
        </nav>
        {if 'error' == $core.page.name && iaView::ERROR_NOT_FOUND == $code}
            {$_content_}
        {else}
            {ia_blocks block='search'}

            {if 'index' == $core.page.name}
                <div class="b-cars-top">
                    {if isset($iaBlocks.sponsored) && isset($car_blocks_data.sponsored)}
                        <div class="b-cars-top__hot">
                            <div class="container">
                                {ia_blocks block='sponsored'}
                            </div>
                        </div>
                    {/if}

                    <div class="container">
                        <div class="row">
                            <div class="col-md-9">
                                {ia_blocks block='recent'}
                            </div>
                            <div class="col-md-3">
                                {ia_blocks block='welcome'}
                            </div>
                        </div>
                    </div>
                </div>
            {/if}

            {if isset($iaBlocks.verytop)}
                <div class="sec sec-verytop">
                    {ia_blocks block='verytop'}
                </div>
            {/if}

            {if 'index' == $core.page.name}
                <div class="landing">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-9">
                                {ia_blocks block='landing'}
                            </div>
                            <div class="col-md-3">
                                {ia_blocks block='right'}
                            </div>
                        </div>
                    </div>
                </div>
            {else}
                <div class="content-header">
                    <div class="container">
                        <h1>
                            {if 'view_member' == $core.page.name}
                                {$imgUrl = unserialize($item.avatar)}
                                <a href="{$smarty.const.IA_URL}uploads/{$imgUrl['path']}" rel="ia_lightbox">{ia_image file=$item.avatar width=28 title=$item.fullname|default:$item.username gravatar=true email=$item.email gravatar_width=28}</a>
                            {/if}

                            {$core.page.title}
                        </h1>

                        {ia_hooker name='smartyFrontBeforeBreadcrumb'}
                        {include file='breadcrumb.tpl'}
                    </div>
                </div>
                {if isset($iaBlocks.sponsored) && isset($car_blocks_data.sponsored)}
                    <div class="b-cars-top__hot b-cars-top__hot--inner">
                        <div class="container">
                            {ia_blocks block='sponsored'}
                        </div>
                    </div>
                {/if}
                <div class="content">
                    <div class="container">
                        <div class="row">
                            <div class="{width section='content' position='center' tag='col-md-'}">
                                <div class="content__wrap">
                                    {ia_hooker name='smartyFrontBeforeNotifications'}
                                    {include file='notification.tpl'}

                                    {ia_blocks block='top'}

                                    {ia_hooker name='smartyFrontBeforeMainContent'}

                                    {$_content_}

                                    {ia_hooker name='smartyFrontAfterMainContent'}

                                    {ia_blocks block='bottom'}
                                </div>
                            </div>
                            <div class="{width section='content' position='right' tag='col-md-'} aside">
                                {if in_array($core.page.name, array('autos_services', 'autos_service_view', 'autos_member_services'))}
                                    <a href="{$smarty.const.IA_URL}service/add/" class="btn btn-success btn-lg btn-block btn-has-icon m-b">{lang key='add_service'} <span class="icon-repair-service"></span></a>
                                {/if}

                                {if in_array($core.page.name, array('autos_parts', 'autos_part_view', 'autos_member_parts'))}
                                    <a href="{$smarty.const.IA_URL}part/add/" class="btn btn-success btn-lg btn-block btn-has-icon m-b">{lang key='sell_parts'} <span class="icon-piston"></span></a>
                                {/if}

                                {ia_blocks block='right'}
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
        {/if}

        {if isset($iaBlocks.verybottom)}
            <div class="sec sec-verybottom">
                {ia_blocks block='verybottom'}
            </div>
        {/if}

        <footer class="footer">
            <div class="container">
                {ia_hooker name='smartyFrontBeforeFooterLinks'}
                <div class="row">
                    <div class="col-md-2">
                        {ia_blocks block='footer1'}
                    </div>
                    <div class="col-md-2">
                        {ia_blocks block='footer2'}
                    </div>
                    <div class="col-md-4">
                        {ia_blocks block='footer3'}
                    </div>
                    <div class="col-md-3 col-md-offset-1">
                        <a class="footer-brand" href="{$smarty.const.IA_URL}">
                            {if !empty($core.config.site_logo)}
                                <img src="{$core.page.nonProtocolUrl}uploads/{$core.config.site_logo}" alt="{$core.config.site}">
                            {else}
                                <span></span>
                            {/if}
                        </a>

                        <p class="copyright">&copy; {$smarty.server.REQUEST_TIME|date_format:'%Y'}. {lang key='powered_by_subrion'}</p>

                        {if $core.config.template_social}
                            <div class="social">
                                {if $core.config.template_social_t}<a class="twitter" href="{$core.config.template_social_t}" target="_blank"><span class="fa fa-twitter"></span></a>{/if}
                                {if $core.config.template_social_f}<a class="facebook" href="{$core.config.template_social_f}" target="_blank"><span class="fa fa-facebook"></span></a>{/if}
                                {if $core.config.template_social_i}<a class="instagram" href="{$core.config.template_social_i}" target="_blank"><span class="fa fa-instagram"></span></a>{/if}
                                {if $core.config.template_social_g}<a class="google-plus" href="{$core.config.template_social_g}" target="_blank"><span class="fa fa-google-plus"></span></a>{/if}
                                {if $core.config.template_social_y}<a class="youtube" href="{$core.config.template_social_y}" target="_blank"><span class="fa fa-youtube"></span></a>{/if}
                            </div>
                        {/if}
                    </div>
                </div>
                {ia_hooker name='smartyFrontAfterFooterLinks'}
            </div>
        </footer>

        <button class="scroll-to-top js-scroll-to-top" type="button"><span class="fa fa-angle-up"></span></button>

        {ia_blocks block='tools'}

        <!-- SYSTEM STUFF -->

        {if $core.config.cron}
            <div style="display: none;">
                <img src="{$core.page.nonProtocolUrl}cron/?{randnum}" width="1" height="1" alt="">
            </div>
        {/if}

        {if isset($manageMode)}
            {include file='visual-mode.tpl'}
        {/if}

        {if isset($previewMode)}
            <p>{lang key='youre_in_preview_mode'}</p>
        {/if}

        {ia_print_js display='on'}

        {ia_hooker name='smartyFrontFinalize'}
    </body>
</html>