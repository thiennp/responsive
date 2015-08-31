<div class="container">

# Browser compability and responsive class

By Thien Nguyen <nguyenphongthien@gmail.com>

<nomock>

*   ## Step 1: Include responsive.js to file script

    copy this code below and add to the bottom of the "body" element:

    **<script type="text/javascript" src="scripts/responsive.js" data-xs="339" data-sm="767" data-md="1023" data-lg="1279" data-xl="1399" data-responsive="1"></script>**

    Replace data-xs, data-sm... with the correct break point

    Change data-responsive to 0 if you don't want to add responsive class to body tag (xs, lg...)

    Inspect and see the class has been added to the body tag

    _For more additional features, we could add modernizr.js, but not really neccesary at the moment_

*   ## Step 2: Use it:

    *   ### For CSS Usage

        *   Class will be added to the body tag
        *   so for example: if you want to add specific attribute to Chrome only (to avoid affect to other browser)
        *   in css, add ".cr " before the class you want to add attribute
        *   **(eg: .cr .class-1 {margin-top: 10px;}** - so class-1 will have margin-top attribute is 10px only on Chrome - not affect to Firefox, IE, Opera...)
        *   in SASS, add "    .cr &" on the line after the class you want to fix
        *   (eg:  
             **.class-1  
                 .cr &  
                     margin-top: 10px**  
             )
    *   ### For JS Usage

        We can use below global variable to detect browser, device, OS and screen size, they are:

        *   **window.$screen_xs** Max size for xxs
        *   **window.$screen_sm** Max size for xs
        *   **window.$screen_md** Max size for sm
        *   **window.$screen_lg** Max size for md
        *   **window.$screen_xl** Max size for xl
        *   **window.$xxs** Screen size xs (value: true/false)
        *   **window.$xs** Screen size xs (value: true/false)
        *   **window.$md** Screen size md (value: true/false)
        *   **window.$sm** Screen size sm (value: true/false)
        *   **window.$lg** Screen size lg (value: true/false)
        *   **window.$xl** Screen size xl (value: true/false)
        *   **window.$cr** Browser is Chrome (value: true/false)
        *   **window.$ff** Browser is Firefox (value: true/false)
        *   **window.$sf** Browser is Safari (value: true/false)
        *   **window.$op** Browser is Opera (value: true/false)
        *   **window.$ie** Browser is IE (value: true/false)
        *   **window.$ie7** Browser is IE7 (value: true/false)
        *   **window.$ie8** Browser is IE8 (value: true/false)
        *   **window.$ie9** Browser is IE9 (value: true/false)
        *   **window.$ie10** Browser is IE10 (value: true/false)
        *   **window.$ie11** Browser is IE11 (value: true/false)
        *   **window.$mobile** Device is mobile or ipad (value: true/false)
        *   **window.$desktop** Device is desktop (value: true/false)
        *   **window.$size** Width of window (value: xxs, xs, sm, md, lg, xl)
        *   **window.$ipad** Device is ipad (value: true/false)
        *   **window.$window** OS is Window
        *   **window.$mac** OS is MACOS
        *   **window.$linux** OS is Linux
        *   **window.$unix** OS is Unix
        *   **window.$browser** Browser (value: cr, ff, sf...)
        *   **window.$os** OS of device (value: win, mac, lin, unix)
        *   **window.$click** Window screen can be touched or clicked (value: touchstart, click)  
             with window.$click you can use it like below  
             **$("#id").on(window.$click, function(){...})**  
             so if you are using touch device, it will capture touch event, and click event if you're not using a touch device

        Added event: we can listen to this event when the recalculate function is invoked

        **document.addEventListener("sizeChanged", function () {**  
             // ... do something ...  
         **}, false);**

*   ## Browser support:

    List class will be added on each browser

    *   **Chrome**: cr
    *   **Firefox**: ff
    *   **Safari**: sf
    *   **Opera**: op
    *   **IE**: ie

        For each ie version:

        *   **IE 7**: ie7
        *   **IE 8**: ie8
        *   **IE 9**: ie9
        *   **IE 10**: ie10
        *   **IE 11**: ie11
*   ## Device support:

    *   **Desktop**: desktop
    *   **Mobile**: mobile
    *   **Ipad**: ipad
*   ## OS support:

    *   **Window**: win
    *   **MacOS**: mac
    *   **Unix**: unix
    *   **Linux**: lin
    *   **Android**: android
    *   **IOS**: ios
    *   **Blackberry**: blackberry
    *   **Winmobile**: iemobile

</nomock></div>