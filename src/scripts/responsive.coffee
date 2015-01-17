# Responsive class
scriptElements = document.getElementsByTagName 'script'

window.$screen_xs = 339
window.$screen_sm = 767
window.$screen_md = 1023
window.$screen_lg = 1279
window.$screen_xl = 1399
window.$responsive = 1

for id in [0..scriptElements.length-1]
	tem1 = scriptElements[id].getAttribute 'data-xs'
	if tem1
		window.$screen_xs = parseInt tem1
	tem1 = scriptElements[id].getAttribute 'data-sm'
	if tem1
		window.$screen_sm = parseInt tem1
	tem1 = scriptElements[id].getAttribute 'data-md'
	if tem1
		window.$screen_md = parseInt tem1
	tem1 = scriptElements[id].getAttribute 'data-lg'
	if tem1
		window.$screen_lg = parseInt tem1
	tem1 = scriptElements[id].getAttribute 'data-xl'
	if tem1
		window.$screen_xl = parseInt tem1
	tem1 = scriptElements[id].getAttribute 'data-responsive'
	if tem1
		window.$responsive = parseInt tem1

window.$xxs = false
window.$xs = false
window.$md = false
window.$sm = false
window.$lg = false
window.$xl = false
window.$cr = false
window.$ff = false
window.$sf = false
window.$op = false
window.$ie = false
window.$ie7 = false
window.$ie8 = false
window.$ie9 = false
window.$ie10 = false
window.$ie11 = false
window.$mobile = false
window.$desktop = false
window.$ipad = ""
window.$browser = ""
window.$click = "click"
window.$onresize = 0
window.detectBrowser = ->
	# Opera
	if parseInt(navigator.userAgent.toLowerCase().indexOf 'opr') isnt -1
		window.$browser = "op"
		window.$browser_str = "op"
		window.$op = true
	# Chrome
	else if parseInt(navigator.userAgent.toLowerCase().indexOf "chrome") isnt -1
		window.$browser = "cr"
		window.$browser_str = "cr"
		window.$cr = true
	# Firefox
	else if parseInt(navigator.userAgent.toLowerCase().indexOf "firefox") isnt -1
		window.$browser = "ff"
		window.$browser_str = "ff"
		window.$ff = true
	# Safari
	else if parseInt(navigator.userAgent.toLowerCase().indexOf 'safari') isnt -1
		window.$browser = "sf"
		window.$browser_str = "sf"
		window.$sf = true
	# IE7
	else if parseInt(navigator.appVersion.indexOf "MSIE 7.") isnt -1
		window.$browser = "ie7"
		window.$browser_str = "ie ie7"
		window.$ie7 = true
		window.$ie = true
	# IE8
	else if parseInt(navigator.appVersion.indexOf "MSIE 8.") isnt -1
		window.$browser = "ie8"
		window.$browser_str = "ie ie8"
		window.$ie8 = true
		window.$ie = true
	# IE9
	else if parseInt(navigator.appVersion.indexOf "MSIE 9.") isnt -1
		window.$browser = "ie9"
		window.$browser_str = "ie ie9"
		window.$ie9 = true
		window.$ie = true
	# IE10
	else if navigator.userAgent.match(/MSIE\s([\d]+)/)
		window.$browser = "ie10"
		window.$browser_str = "ie ie10"
		window.$ie10 = true
		window.$ie = true
	# IE11
	else if !!navigator.userAgent.match(/Trident.*rv[ :]*11\./)
		window.$browser = "ie11"
		window.$browser_str = "ie ie11"
		window.$ie11 = true
		window.$ie = true
	detectOS()
	document.getElementsByTagName("body")[0].className=window.$browser_str+window.$os+window.$ipad

window.detectOS = ->
	window.$mobile = true
	window.$desktop = false
	window.$click = "touchstart"
	window.$os=" os"
	if /Android/i.test(navigator.userAgent) then window.$os=" android mobile"
	else if /BlackBerry/i.test(navigator.userAgent) then window.$os=" blackberry mobile"
	else if /iPhone|iPad|iPod/i.test(navigator.userAgent)
		window.$os=" ios mobile"
		detectIPad()
	else if /IEMobile/i.test(navigator.userAgent) then window.$os=" iemobile mobile"
	else 
		window.$mobile = false
		window.$desktop = true
		window.$click = "click"
		if navigator.appVersion.indexOf("Win")!=-1 then window.$os=" win desktop"
		if navigator.appVersion.indexOf("Mac")!=-1 then window.$os=" mac desktop"
		if navigator.appVersion.indexOf("X11")!=-1 then window.$os=" unix desktop"
		if navigator.appVersion.indexOf("Linux")!=-1 then window.$os=" lin desktop"

window.detectIPad = ->
	if navigator.userAgent.match(/iPad/i) != null then window.$ipad = " ipad"

if window.$responsive > 0
	window.calculateSize = (size)->
		if window.wWidth >= $screen_xl
			window.$xs = false
			window.$sm = false
			window.$md = false
			window.$xl = true
			window.$lg = true
			window.$size = "xl"
			window.$size_str = "lg xl"
		else if window.wWidth >= $screen_lg
			window.$xs = false
			window.$sm = false
			window.$md = false
			window.$xl = false
			window.$lg = true
			window.$size = "lg"
			window.$size_str = "lg"
		else if window.wWidth >= $screen_md
			window.$xs = false
			window.$sm = false
			window.$md = true
			window.$xl = false
			window.$lg = false
			window.$size = "md"
			window.$size_str = "md"
		else if window.wWidth >= $screen_sm
			window.$xs = false
			window.$sm = true
			window.$md = false
			window.$xl = false
			window.$lg = false
			window.$size = "sm"
			window.$size_str = "sm"
		else if window.wWidth >= $screen_xs
			window.$xs = true
			window.$sm = false
			window.$md = false
			window.$xl = false
			window.$lg = false
			window.$size = "xs"
			window.$size_str = "xs"
		else
			window.$xxs = true
			window.$xs = true
			window.$sm = false
			window.$md = false
			window.$xl = false
			window.$lg = false
			window.$size = "xxs"
			window.$size_str = "xs xxs"

		document.getElementsByTagName("body")[0].className = window.$browser+window.$os+window.$ipad+' '+window.$size_str

		event = new CustomEvent("sizeChanged",
			'bubbles': true,
			'cancelable': true,
			'detail':
				'size': window.wWidth
		)
		document.dispatchEvent event

	setInterval ->
		next_wWidth = window.innerWidth
		unless next_wWidth is window.wWidth
			window.$onresize++
			i = Math.floor(Math.random() * 100)
			setTimeout ->
				window.$onresize--
				if window.$onresize is 0
					window.wWidth = next_wWidth
					calculateSize next_wWidth
				return
			, 200
		return
	, 400

detectBrowser()