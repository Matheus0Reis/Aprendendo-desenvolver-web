/**** game/script.js ****/
/*803dea7aa617ddc4277db79e1e4b9359*/
var timeDiff = null;
var timeStart = null;

var mx = 0;
var my = 0;

var resis = new Object();
var timers = new Array();

if(document.addEventListener){
	document.addEventListener("mousemove", watchMouse, true);
}else{
	document.onmousemove = watchMouse;
}
function gid(id){
	return document.getElementById(id);
}
function watchMouse(e){
	if(e){
		mx = e.clientX;
		my = e.clientY;
	}else{
		mx = window.event.x;
		my = window.event.y;
	}

	var info = document.getElementById("info");
	if(info != null && info.style.visibility == "visible"){
		map_move();
	}

	var tut = gid("tut");
	if(tut != null && tut_moving){
		tut_move();
	}
}
function setImageTitles(){
	for(var i = 0; i < document.images.length; i++){
		var image = document.images[i];
		if(!image.title && image.alt != ''){
			image.title = image.alt;
		}
	}
}
function setCookie(name, value){
	document.cookie = name + "=" + value;
}
function createCookie(name,value,days){
	if(days){
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}else
		var expires = "";
	document.cookie = name + "=" + value + expires + "; path=";
}
function eraseCookie(name){
	createCookie(name,"",-1);
}
function popup(url, width, height){
	wnd = window.open(url, "popup", "width=" + width + ",height=" + height + ",left=150,top=150,resizable=yes");
	wnd.focus();
}

function popup_scroll(url, width, height){
	wnd = window.open(url, "popup", "width=" + width + ",height=" + height + ",left=150,top=100,resizable=yes,scrollbars=yes");
	wnd.focus();
}
function addTimer(element, endTime, reload){
	var timer = new Object();
	timer['element'] = element;
	timer['endTime'] = endTime;
	timer['reload'] = reload;
	timers.push(timer);
}
function startTimer(){
	var serverTime = getTime(document.getElementById("serverTime"));
	timeDiff = serverTime-getLocalTime();
	timeStart = serverTime;

var spans = document.getElementsByTagName("span");
	for(var span_id in spans){
		var span = spans[span_id];
		if(span.className == "timer" || span.className == "timer_replace"){
			startTime = getTime(span);
			if(startTime != -1){
				addTimer(span, serverTime+startTime, (span.className == "timer"));
			}
		}
	}

	startResTicker('wood');
	startResTicker('stone');
	startResTicker('iron');

	window.setInterval("tick()", 1000);
}
function startResTicker(resName){
	var element = document.getElementById(resName);
	var start = parseInt(element.firstChild.nodeValue);
	var max = parseInt(document.getElementById("storage").firstChild.nodeValue);
	var prod = element.title/3600;

	var res = new Object();
	res['name'] = resName;
	res['start'] = start;
	res['max'] = max;
	res['prod'] = prod;
	resis[resName] = res;
}
function tickRes(res){
	var resName = res['name'];
	var start = res['start'];
	var max = res['max'];
	var prod = res['prod'];

	var now = new Date();
	var time = (now.getTime()/1000+timeDiff)-timeStart;
	current = Math.min(Math.floor(start+prod*time), max);
	var element = document.getElementById(resName);
	element.firstChild.nodeValue = current;

	if(current == max){
		element.setAttribute('class', 'warn');
	}
}
function tick(){
	tickTime();

	for(var res in resis){
		tickRes(resis[res]);
	}
	for(var timer in timers){
		remove = tickTimer(timers[timer]);
		if(remove){
			timers.splice(timer, 1);
		}
	}
}
function tickTime(){
	var serverTime = document.getElementById("serverTime");
	if(serverTime != null){
		time = getLocalTime()+timeDiff;
		formatTime(serverTime, time, true);
	}
}
function tickTimer(timer){
	var time = timer['endTime']-(getLocalTime()+timeDiff);

	if(timer['reload'] && time < 0){
		document.location.href = document.location.href;
		formatTime(timer['element'], 0, false);
		return true;
	}
	
	if(!timer['reload'] && time <= 0){
		var parent = timer['element'].parentNode;
		parent.nextSibling.style.display = 'inline';
		parent.parentNode.removeChild(parent);

		return true;
	}

	formatTime(timer['element'], time, false);
	return false;
}
function getLocalTime(){
	var now = new Date();
	return Math.floor(now.getTime()/1000)
}
function getTime(element){
	if(element.firstChild.nodeValue == null){
		return -1;
	}
	part = element.firstChild.nodeValue.split(":");

	for(j = 1; j < 3; j++){
		if(part[j].charAt(0) == "0")
			part[j] = part[j].substring(1, part[j].length);
	}

	hours = parseInt(part[0]);
	minutes = parseInt(part[1]);
	seconds = parseInt(part[2]);
	time = hours*60*60+minutes*60+seconds;
	return time;
}
function formatTime(element, time, clamp){
	hours = Math.floor(time/3600);
	if(clamp){
		hours = hours%24;
	}
	minutes = Math.floor(time/60)%60;
	seconds = time%60;

	timeString = hours + ":";
	if(minutes < 10){
		timeString += "0";
	}
	timeString += minutes + ":";
	if(seconds < 10){
		timeString += "0";
	}
	timeString += seconds;

	element.firstChild.nodeValue = timeString;
}
function ask(question, href){
	if(confirm(question) == true){
		window.location.href = href;
	}
}
function setText(element, text){
	var textNode = document.createTextNode(text);
	element.removeChild(element.firstChild);
	element.appendChild(textNode);
}
function map_move(){
	var info = document.getElementById("info");
	if(window.pageYOffset)
		scrollY = window.pageYOffset;
	else
		scrollY = document.body.scrollTop;

	info.style.left = mx + 5 + "px";
	info.style.top = my - 100 + scrollY + "px";
}
function showinfo(v,u,ox,oy){
	map_move();
	$("#info").css("visibility","visible");
	$("#info").load('map_popup.php?v=' + v + '&u=' + u + '&ox=' + ox + '&oy=' + oy);	
}
function hideinfo(x){
	$("#info").css("visibility","hidden");
}
function autoresize_textarea(selector,max_rows){
	var textarea = $(selector);
	if(!textarea)
		return;
	max_rows = max_rows || 40;
	var current_rows = textarea[0].rows;
	textarea.keydown(function(){
		var rows = this.value.split('\n');
		var row_count = rows.length;
		for(var x=0;x<rows.length;x++)
			if(rows[x].length >= textarea[0].cols)
				row_count += Math.floor(rows[x].length/textarea[0].cols);
		row_count += 2;
		row_count = Math.min(row_count,max_rows);
		if(row_count > current_rows)
		this.rows = row_count
	})
}
function overviewGetLabels(){
	labels = Array();
	labels.push(gid("label_main"));
	labels.push(gid("label_place"));
	labels.push(gid("label_wood"));
	labels.push(gid("label_stone"));
	labels.push(gid("label_iron"));
	labels.push(gid("label_wall"));
	labels.push(gid("label_farm"));
	labels.push(gid("label_hide"));
	labels.push(gid("label_statue"));
	labels.push(gid("label_storage"));
	labels.push(gid("label_market"));
	labels.push(gid("label_barracks"));
	labels.push(gid("label_stable"));
	labels.push(gid("label_garage"));
	labels.push(gid("label_church"));
	labels.push(gid("label_snob"));
	labels.push(gid("label_smith"));

	for(var i=1; i<=10; i++)
		labels.push(gid("label_"+i));
	return labels;
}
function changeView(){
	labels = overviewGetLabels();
	for(i in labels){
		var label = labels[i];
		if(!label)
			continue;
		if(label.style.display == 'none'){
			label.style.display = '';
			if(i==0) setCookie('gfx_label', 0);
		}else{
			label.style.display = 'none';
			if(i==0) setCookie('gfx_label', 1);
		}
	}
	(gid('show_level').innerHTML == 'Esconder Nível dos Edifícios') ? gid('show_level').innerHTML = 'Mostrar níveis dos edifícios': gid('show_level').innerHTML = 'Esconder Nível dos Edifícios';
}
function selectAll(c,b){
	for(var a = 0; a < c.length; a++){
		c.elements[a].checked = b
	}
}
function escape_id(a){
	return "#" + a.replace("^#","").replace("[","\\[").replace("]","\\]")
}
function editToggle(a,b){
	$(escape_id(b)).toggle();
	$(escape_id(a)).toggle()
}
function insertCoord(form, element){
	part = element.value.split("|");
	if(part.length != 2)
		return;
	x = parseInt(part[0]);
	y = parseInt(part[1]);
	form.x.value = x;
	form.y.value = y;
}
function insertCoordNew(form, element){
	part = element.value.split(":");
	if(part.length != 3)
		return;
	form.con.value = parseInt(part[0]);
	form.sec.value = parseInt(part[1]);
	form.sub.value = parseInt(part[2]);
}
function insertNumber(a,c,b){
	if($(a).val() != c || b){
		$(a).val(c)
	}else{
		$(a).val("")
	}
}
function insertUnit(a,c,b){
	if($(a).val() != c || b){
		$(a).val(c)
	}else{
		$(a).val("")
	}
}
function xProcess(c,b){
	c = $("#"+c);
	b = $("#"+b);
	var g = c.val();
	var e = b.val();
	var a;
		var f;

	if(c.val().indexOf("|")!=-1){
		var d = g.split("|");
		a = parseInt(d[0]);
		f = parseInt(d[1]);
		c.val(a);
		b.focus().val(f);
		return true
	}
	if(g.length===3){
		b.val(null),b.focus()
	}else{
		if(g.length > 3){
			a = g.substr(0,3);
			f = g.substring(3);
			c.val(a);
			b.val(f).focus()
		}
	}
}
function selectAllUnits(c){
	var b = $("#selectAllUnits").attr("onclick");
	var a = (b.indexOf("true",0) < 0);
	$("#selectAllUnits").attr("onclick","selectAllUnits("+a+")");
	$(".unitsInput").each(function(f,g){
		var d = $(this).next("a").html();
		d = d.substr(1).substr(0,d.length-2);
		if(d > 0){
			insertUnit(g,d,c)
		}else{
			insertUnit(g,"",c)
		}
	})
}
function toggle_element(a){
	var b = $(a);
	if(b.css("display") == "none"){
		b.show()
	}else{
		b.hide()
	}
}
function toggle_visibility(a){
	return toggle_element(a)
}
function toggle_visibility_by_class(b,a){
	if(a == "table-row"){
		a = ""
	}
	$("."+b).each(function(){
		if($(this).css("display") == "none"){
			$(this).css("display",a)
		}else{
			$(this).css("display","none")
		}
	})
}
function expandCollapse(){
	for(var i=0; i<expandCollapse.arguments.length; i++){
		var element = document.getElementById(expandCollapse.arguments[i]);
		element.style.display = (element.style.display == "none") ? "block" : "none";
	}
}

(function(a){
	a.fn.redim = function(b){
		var d = 0;
		var c = a.browser.msie&&6==~~a.browser.version;
		if(!b.height&&!b.width){
			return this
		}
		if(b.height&&b.width){
			d = b.width/b.height
		}
		return this.one("load",function(){
			this.removeAttribute("height");
			this.removeAttribute("width");
			this.style.height = this.style.width="";
			var m = this.height;
			var l = this.width;
			var k = l/m;
			var i = b.height;
			var n = b.width;
			var j = d;
			j || (j=i?k+1:k-1);
			if(i&&m>i||n&&l>n){
				if(k > j){
					i = ~~(m/l*n)
				}else{
					n = ~~(l/m*i)
				}
				this.height = i;
				this.width = n
			}
		})
		.each(function(){
			if(this.complete || c){
				a(this).trigger("load")
			}
		})
	}
})(jQuery);
jQuery.fn.center = function(){
	this.css('position','absolute');
	this.css('top', (($(window).height()-this.outerHeight())/4)+$(window).scrollTop()+'px');
	this.css('left', (($(window).width()-this.outerWidth())/2)+$(window).scrollLeft()+'px');
	return this;
}
jQuery.cookie = function(name,value,options){
	if(typeof value != 'undefined'){
		options = options||{};
		if(value === null){
			value = '';
			options.expires = -1
		}
		var expires = '';
		if(options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)){
			var date;
			if(typeof options.expires == 'number'){
				date = new Date();
				date.setTime(date.getTime()+(options.expires*24*60*60*1000))
			}else{
				date = options.expires
			}
			expires = '; expires='+date.toUTCString()
		}
		var path = options.path?'; path='+(options.path):'';
		var domain = options.domain?'; domain='+(options.domain):'';
		var secure = options.secure?'; secure':'';
		document.cookie = [name,'=',encodeURIComponent(value),expires,path,domain,secure].join('')
	}else{
		var cookieValue = null;
		if(document.cookie && document.cookie != ''){
			var cookies = document.cookie.split(';');
			for(var i=0;i<cookies.length;i++){
				var cookie = jQuery.trim(cookies[i]);
				if(cookie.substring(0,name.length+1) == (name+'=')){
					cookieValue = decodeURIComponent(cookie.substring(name.length+1));
					break
				}
			}
		}
		return cookieValue
	}
}
var TWLan = {
	'go':function(url){
		return document.location.href=url;
	},
	'selectw':function(){
		var world = document.getElementById('world').value;
		return TWLan.go('login.php?world='+world);
	},
	'json':function(str){
		try{
			jQuery.parseJSON(str);
		}catch(e){
			return false;
		}
		return true;
	},
	'print_info':function(message,type,debug,stay,sms){
		var keep = stay && true;
		if(typeof type == 'undefined')
			type = 'error';
		$('.autoHideBox').stop(true,true).fadeOut(200, function(){
			$(this).remove();
		});

		var seed = Math.floor(Math.random()*500);
		$('<div id="box'+seed+'">'+message+'</div>')
		.insertBefore('.principal')
		.addClass('autoHideBox '+type)
		.fadeIn(200)
		.on('click', function(){
			if(!keep)
				$(this).stop(true,true).fadeOut(200, function(){
					$(this).remove();
				})
		}).center();
		setTimeout(function(){
			if(!keep && $('#box'+seed))
				$('#box'+seed).fadeOut(200,function(){
					$(this).remove();
				})
		},3000)
	},
	'fetch':function(opts){
		opt = opts || false;
		if(opt.length > 0)
			message = opt;
		else
			message = 'Por favor, aguarde enquanto o servidor processa sua ação!';
		TWLan.print_info(message,'info',false,true);
	},
	'request':function(data,opts){
		opt = opts || false;
		if(opt.length)
			message = opt;
		else
			message = 'Por favor, aguarde enquanto o servidor processa sua ação!';
		this.print_info(message,'info',false,true);
		data['vid'] = vid;

		$.ajax({
			type:"POST",
			url:"process.php",
			data:data,
			dataType:"text",
			statusCode:{
				404:function(){
					TWLan.print_info('Request file not found !');
				}
			},
			success:function(msg){
				if(TWLan.json(msg)){
					var msg = jQuery.parseJSON(msg);
					TWLan.print_info(msg.message,msg.type,msg.debug);
					return true;
				}else{
					TWLan.print_info(msg,'error','debug');
					return false;
				}
			}
		});
	},
}
function vmod(){
	var name = $("#name_input").val();
	$.ajax({
		url: "inc/submit.php",
		type: "POST",
		data: {
			'action': 'vmod',
			'vid': vid,
			'name': name
		},
		success: function (data){
			if(data != 'name_short' && data != 'name_long') {
				$('#name_text').html(data);
				$('#name_hide').hide();
				$('#name_show').show()
			}else{
				if(data == 'name_long')
					alert('Name can contain max 25 characters !');
				if(data == 'name_short')
					alert('Name can contain min 3 chars')
			}
		}
	})
}
function prepare(pid){
	$("#label_"+pid).toggle();
	$("#label_edit_"+pid).toggle()
}
function prebuild(build){
    $(".error").hide();
    $.ajax({
        url: 'inc/build.php',
        type: 'POST',
        data: {
            'action': 'build',
            'vid': vid,
            'build': build
        },
        datatype: 'text',
        cache: false,
        success: function (data) {
            if (data.split('|')[1] == 'success') {
                document.location.reload()
            } else {
                $(".error").html(data).show();
                $('[name=load]').hide()
            }
        }
    })
}
function stop(id) {
    $.ajax({
        url: 'inc/build.php',
        type: 'POST',
        data: {
            'action': 'stop_construct',
            'vid': vid,
            'id': id
        },
        datatype: 'text',
        cache: false,
        success: function (data) {
            if (data == 'success') {
                document.location.reload()
            }
        }
    })
}
function set_max(unit) {
    var max = parseInt($("#" + unit + "_area").html().replace('(', '').replace(')', ''));
    if (max > 0) {
        $("#" + unit).val(max);
        $("[name=area]").html('(0)')
    } else {
        var val = $("#" + unit + "_area").attr('max');
        $("#" + unit).val('');
        $("#" + unit + "_area").html('(' + val + ')');
        $.each($("[name=area]"), function () {
            var caller = $(this).attr('id');
            vall = $("#" + caller).attr('max');
            $("#" + caller).html('(' + vall + ')')
        })
    }
}