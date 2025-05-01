// JavaScript Document
var interAutoSlide;
var scrollBanner = {
	tempo: 8000,
	tempo2: null,
	tempoFull: 20000,
	initAutoSlide: true,
	posAtual: null,
	banners: null,
	tamanhoBanner: null,
	navKey: true,
	iptFocus: false,
	animateComplete: true,
	init: function(){
		this.tamanhoBanner = $('li.img','.banners').width();
		this.banners = $('li','.botoes').length;
		this.tempo2 = this.tempo;
		$('ul','.banners').css('width',(this.tamanhoBanner * this.banners)+'px');
		$.each($('li','.botoes'), function(index) {
			$(this).attr('pos',index);
			$(this).bind('click',function(){
				scrollBanner.tempo = scrollBanner.tempoFull;
				scrollBanner.selBanner($(this).attr('pos'));				
			});
		});
		$('li','.botoes').attr('sel','false')
		this.selBanner(0);
		
		if(this.navKey == true){
			$('input').bind('focus',function(){scrollBanner.iptFocus = true}).bind('blur',function(){scrollBanner.iptFocus = false})
			$(document).keydown(function(event) {
				if(!scrollBanner.iptFocus){
					if(scrollBanner.posAtual != (scrollBanner.banners)-1){
						if (event.keyCode == 37) {
							scrollBanner.tempo = scrollBanner.tempoFull;
							//anterior
							if(scrollBanner.posAtual == 0){
								scrollBanner.selBanner(parseInt(scrollBanner.banners) - 2)
							}else{
								scrollBanner.selBanner(parseFloat(scrollBanner.posAtual) -1)
							}
						} else if (event.keyCode == 39) {
							scrollBanner.tempo = scrollBanner.tempoFull;
							//proxima
							if(scrollBanner.posAtual == (parseFloat(scrollBanner.banners) -2)){
								scrollBanner.selBanner(0)
							}else{
								scrollBanner.selBanner(parseFloat(scrollBanner.posAtual) +1)
							}
						}
					}
				}
			});
		}
	},
	selBanner: function(pos){
		if((pos != this.posAtual) && (this.animateComplete)){
			this.animateComplete = false;
			this.timerAutoSlide(true);
			$.each($('li','.botoes'), function(index,obj) {
				var arrClass = $(obj).attr('class')
				if(arrClass){
					arrClass = arrClass.split(' ')[1]
					if(arrClass){$(obj).removeClass(arrClass)}
				}
			});
			$('li','.botoes').attr('sel','false')
			$('li[pos='+pos+']','#bannersEsq').attr('sel','true').addClass($('li[pos='+pos+']','#bannersEsq').attr('class')+'Hover')
			this.scroll(pos);
		}
	},
	scroll: function(pos){
		var scrollAte = (pos > this.posAtual) ? ('+='+((pos - this.posAtual)*this.tamanhoBanner)) : ('-='+((this.posAtual - pos)*this.tamanhoBanner))
		$('.banners','#bannersEsq').animate({scrollLeft: scrollAte}, 400, function(){scrollBanner.animateComplete = true; scrollBanner.timerAutoSlide(false)})
		this.posAtual = pos;
	},
	timerAutoSlide: function(md){
		window.clearTimeout(interAutoSlide)
		if(!md && this.initAutoSlide){
			if(this.posAtual == (this.banners)-1){
				this.tempo = 3600000
			}
			interAutoSlide = window.setTimeout(function(){scrollBanner.autoSlide()},this.tempo);
			this.tempo = this.tempo2;
		};
	},
	autoSlide: function(){
		if(this.banners>0){
			if(this.posAtual == (parseFloat(this.banners) -2)){
				this.selBanner(0)
			}else{
				this.selBanner(parseFloat(this.posAtual) +1)
			}
		}
	}
}