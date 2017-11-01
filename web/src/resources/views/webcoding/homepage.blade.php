<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <script src="{{ asset('js/webc@bundle.js') }}" type="text/javascript"></script>
        <link rel="stylesheet" href="{{ asset('css/webc@bundle.css') }}">
    </head>
    <body>
        <div id="app">
            <div id="wc-head-bind" class="cs-web-head">
                <div id="wc-head-logo"><img width="80" v-bind:src="props.data.logosource"/></div>
            </div>
            <div id="wc-foot-bind">
                <div id="wc-foot-copy">
                    Copyright &copy; @{{ year }}
                    <li v-for="item of items">
                        @{{item.firstname}} @{{item.lastname}}
                    </li>
                </div>
            </div>
        </div>
    </body>
</html>
