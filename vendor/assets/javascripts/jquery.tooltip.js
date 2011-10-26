/**
 * Provides simple intelligent tooltip popups.
 *
 * @package    jQuery
 * @subpackage Elixon Tooltip
 * @author     Daniel Sevcik <sevcik@webdevelopers.cz>
 * @version    1.1
 * @copyright  2011 Daniel Sevcik
 * @since      2011-08-25T07:31:34+0200
 * @access     public
 */
(function( $ ){
	var methods = {
		getET: function(settings) {
			var $this=$(this);
			var $et;
			
			if ($this.is('.et')) {
				$et=$this;
			} else {
				$et=$(this).data('et') || methods.init.apply(this, [settings]);
			}

			if (!$et) {
				$.error("You cannot call Elixon Toolkit this way!");
				return $();
			}

			if (settings) methods.updateContent($et, settings);
			return $et;
		},
		init: function(settings) {
			var $this=$(this);
			
			// Main block
			var $etBlock=$('#et');
			if (!$('#et').length) {
				$etBlock=$('<div id="et"></div>').appendTo(document.body);
			}
			if ($etBlock.next().length) { // move as last element to stay always on top
				$etBlock.appendTo(document.body);
			}

			// Bubble
			var $et=$this.data('et');
			if (!$et || !$et.length) {
				var $etClose='<span onclick="$(this).parent().data(\'etSrc\').et(\'hide\');" class="etCtrl etClose">×</span>';
				$et=$('<div style="display: none;"></div>')
					.append($etClose)
					.appendTo($etBlock)
					.click(function() {methods.top.apply($(this).data('etSrc'));}) 
				;
				$(window).add($et).add($this).resize(function() {$this.et('align');});
			} 
			$this.data('et', $et);
			$et.data('etSrc', $this);

			// Content
			methods.updateContent($et, settings);

			// Style
			return $et
				.css({'visibility': 'visible', 'display': 'none'})
				.data('etGroup', $.trim(settings.group) ? $.trim(settings.group).split(/\s+/) : [])
				.attr('class',
					 'et '
					 +'etOff '
					 +(typeof settings.fx == 'string' ? 'et'+settings.fx.charAt(0).toUpperCase()+settings.fx.slice(1)+'Fx ' : '')
					 +settings.color+' '
					 +settings.className+' '
					 +methods.classNameByPosition(settings.position, settings.align)
					);
		},
		updateContent: function ($et, settings) {
			var $content=$.isFunction(settings.generator) ? $(settings.generator.apply($et.data('etSrc'))) : $(settings.content);
			if ($content.length) {
				$('<div></div>').append($('> *:not(.etCtrl)', $et)); // on subsequent 'show' when using $et.html('') or .remove() it kills handler

				// Content may be loaded slowly (images, iframe, ...)
				// -- causes infinite recursive call
				// var adjustFce=function() {setTimeout(function() {$et.et('align');}, 1000);};
				// var doc=$content.get(0).contentDocument;
				// $content.ready(adjustFce).load(adjustFce); 
				
				$et.append($content);
			}
			
			// To avoid regenerating the content
			delete settings.generator;
			delete settings.content;			
		},
		defaultGenerator: function () {
			var $this=$(this);
			var $ret=$();

			// Link
			if ($this.is('a[href]:not([href^="javascript:"])')) {
				// Content link
				if ($this.attr('href').match(/^#/)) {
				  $ret=$($this.attr('href'));	
				}
				if (!$ret.length) {
					//$ret=$('<iframe seamless="seamless"></iframe>').attr('src', $this.attr('href'));
					$ret=$('<object></object>').attr('data', $this.attr('href'));					
					$this.attr('type') && $ret.attr('type', $this.attr('type'));
				}
			}

			// Default @title|text()
			if (!$ret.length) {
				if ($this.attr('title')) { // to avoid duplicate browser tooltip & et
					$this.attr('data-title', $this.attr('title')).removeAttr('title'); 
				}
				$ret=$('<div class="title"></div>').text($this.attr('data-title') || $this.text());
			}
				
			return $ret;
		},
		top: function (settings) {
			// We cannot move $(this) because it would loose the focus in INPUT
			// we rather shuffle everything else
			var $et=methods.getET.apply(this, [settings]); // it is hooked on .et's onclick - so $(this)
			var $nested=methods.nested($et);
			$et.before($et.nextAll('.et').not($nested)); // move everything from above below
			$nested.appendTo($('#et')); // move nested above
		},
		show: function(settings) {
			var $et=methods.getET.apply(this, [settings]);

			// Hide all from the same group
			var groups=$et.data('etGroup');
			$('#et > .et').each(function () {
				for (var i=0; i < groups.length; i++) {
					if ($.inArray(groups[i], $(this).data('etGroup')) != -1) {
						return $(this).et('hide');
					}
				}
			});
			
			// move at the end to stay on top
			methods.top.apply(this);
			if ($et.is('.etOff')) {
				$et.toggleClass('etOn').toggleClass('etOff');
				// Fx
				methods.align.apply(this, [settings]);
				methods.getFX(settings).apply($et, [settings, true]);

				// @workaround IE8 sometimes misses arrows and fixes them on mouse over automatically
				// $et.removeClass('et').addClass('et'); -- animation may take sometime so we use .animate()
				$et.animate("zoom: 1", function() {$et.removeClass('et').addClass('et');});
			}

			methods.nested($et).filter('.etInnerOn').removeClass('etInnerOn').appendTo($('#et')).each(function() {
				$(this).data('etSrc').et('show');
			});
		},
		hide: function(settings) {
			var $et=methods.getET.apply(this, [settings]);
			var $src=$et.data('etSrc');
			
			if ($et.is('.etOn')) {
				$et.toggleClass('etOn').toggleClass('etOff');
				methods.getFX(settings).apply($et, [settings, false]);
			}

			// Hide nested tooltips too
			methods.nested($et).filter('.etOn').addClass('etInnerOn').each(function() {
				$(this).data('etSrc').et('hide');
			});
		},
		toggle: function(settings) {
			var $et=methods.getET.apply(this, [settings]);
			methods[$et.is('.etOn') ? 'hide' : 'show'].apply(this, [settings]);
		},
		nested: function($et) {
			return $('#et > .et').filter(function() {return $(this).data('etSrc').closest('.et').is($et);});
		},
		showFX: function(settings, show) {
			show ? $(this).show() : $(this).hide();
		},
		fadeFX: function(settings, show) {
			show ? $(this).fadeIn() : $(this).fadeOut();
		},
		slideFX: function(settings, show) {
			show ? $(this).slideDown() : $(this).slideUp();
		},
		getFX: function (settings) {
			// Fx
			if ($.isFunction(settings.fx)) {
				return settings.fx;
			} else if (typeof settings.fx == 'string' && $.isFunction(methods[settings.fx+'FX'])) {
				return methods[settings.fx+'FX'];
			} else {
				$.error("Unknown effect: ("+(typeof settings.fx)+") "+settings.fx);
				return function () {$.error("Elixon Tooltip: Unsupported FX");};
			}
		},
		align: function(settings) {
			var $et=methods.getET.apply(this, [settings]);
			var $src=$et.data('etSrc');
			var detectPosition=!settings.position || settings.position == 'auto';
			var detectAlign=!settings.align || settings.align == 'auto';
			
			if (detectPosition) {
				// Class name hints: .et(Bottom|Top|Right|Left|Start|Center|End) on parents
				var tryPosition=methods.getPositionHint($src, {'bottom': '.etBottom', 'top': '.etTop', 'right': '.etRight', 'left': '.etLeft', 'auto': '.etAuto'});
				if (!tryPosition) tryPosition=$src.is(':input') ? ['left', 'right', 'bottom', 'top'] : ['bottom', 'top', 'right', 'left'];
			} else {
				var tryPosition=[settings.position];
			}

			if (detectAlign) {
				// Class name hints: .et(Bottom|Top|Right|Left|Start|Center|End) on parents
				var tryAlign=methods.getPositionHint($src, {'center': '.etCenter', 'end': '.etEnd', 'start': '.etStart', 'auto': '.etAuto'});
				if (!tryAlign) tryAlign=['center', 'end', 'start'];
			} else {
				var tryAlign=[settings.align];				
			}

			// Find position
			var prefPos;
			for(var p=0; p < tryPosition.length; p++) {
				for(var a=0; a < tryAlign.length; a++) {
					var pos=methods.coord.apply(this, [tryPosition[p], tryAlign[a]]);
					pos.position=tryPosition[p];
					pos.align=tryAlign[a];
					pos.weight=$et.is('.etOn') && tryPosition.length + tryAlign.length > 2 ? methods.positionWeight($et, pos) : 100;
					if (!prefPos || prefPos.weight < pos.weight) prefPos=pos;
				}
			}
			
			$et
				.css({'left': prefPos.left, 'top': prefPos.top})
				.removeClass('etBottom etRight etLeft etTop etCenter etStart etEnd')
				.addClass(methods.classNameByPosition(prefPos.position, prefPos.align))
			;
		},
		getPositionHint: function($src, search) {
			var sel=[];
			for (var i in search) sel.push(search[i]);
			var $hint=$src.closest(sel.join(', ')).not('.et'); // .not('.et') for nested tooltips
			if ($hint.length) {
				for (var i in search) {
					if ($hint.is(search[i])) {
						return i == 'auto' ? false : [i];
					}
				}
			} else {
				return false;
			}
		},
		classNameByPosition: function(position, align) {
			return 'et'+position.charAt(0).toUpperCase()+position.slice(1)+' '
				+'et'+align.charAt(0).toUpperCase()+align.slice(1);
		},
		positionWeight: function($et, coord) {
			var weight=0;
			var $src=$et.data('etSrc');
			var $form=$src.closest('form');
			var colisions=[
				[$(window), 400], // vieport
				[$('.etOn').not($et), -150], // other tooltips
				[$(':input:visible.error, :button:visible.error', $form).not($src), -100], // fields that need to be filled in
				[$(':input:visible, :button:visible', $form).not('.error').not($src), -150], // inputs in the same form				
				[$('label:visible[for="'+$src.attr('id')+'"]', $form).not($src), -250],
				[$('img:visible').not($src), -10]				
			];

			// Arrow overflow
			for (var i=0; i < colisions.length; i++) {
				var $o=colisions[i][0];
				var mod=colisions[i][1];
				$o.each(function() {
					var $this=$(this);
					var coord2=$this.offset() || {left: $this.scrollLeft(), top: $this.scrollTop()};
					coord2.bottom=coord2.top + $this.height();
					coord2.right=coord2.left + $this.width();

					var overX=Math.min(coord.right, coord2.right) - Math.max(coord.left, coord2.left);
					if (overX < 0) overX=0;

					var overY=Math.min(coord.bottom, coord2.bottom) - Math.max(coord.top, coord2.top);
					if (overY < 0) overY=0;

					var colisionWeight=overX * overY * mod;
					weight+=colisionWeight;
				});
			}
			return weight;
		},
		coord: function(position, align) {
			var $et=methods.getET.apply(this);
			var $this=$et.data('etSrc');
		  	var pos=$this.offset();
			var arrowOffset=15;
			var cornerOffset=30;

			// render the size
			var s={'visibility': $et.css('visibility'), 'display': $et.css('display')};
			$et.css({'visibility': 'hidden', 'display': 'block'}); 

			switch (position) {
			case 'top':
				pos.top-=$et.outerHeight() + 2 * arrowOffset;
				break;
			case 'right':
				pos.left+=$this.outerWidth() + 1 * arrowOffset;
				break;
			case 'bottom':
				pos.top+=$this.outerHeight();				
				break;
			case 'left':
				pos.left-=$et.outerWidth() + 1 * arrowOffset;
				break;
			}

			switch (align+':'+position) {
			case 'start:top':
			case 'start:bottom':
				pos.left-=cornerOffset;
				break;
			case 'center:bottom':
			case 'center:top':				
				pos.left+=$this.outerWidth() / 2 - $et.outerWidth() / 2;				
				break;
			case 'end:top':
			case 'end:bottom':				
				pos.left+=$this.outerWidth() - $et.outerWidth() + cornerOffset;
				break;
			case 'start:right':
			case 'start:left':
				pos.top-=cornerOffset;
				break;
			case 'center:right':
			case 'center:left':
				pos.top+=$this.outerHeight() / 2 - $et.outerHeight() / 2;								
				break;
			case 'end:right':
			case 'end:left':
				pos.top+=$this.outerHeight() - $et.outerHeight() + cornerOffset;				
				break;
			}
			$et.css({'visibility': s.visibility, 'display': s.display}); // restore the visibility

			return {'left': pos.left, 'top': pos.top, 'right': pos.left + $et.outerWidth(), 'bottom': pos.top + $et.outerHeight()};
		}
	};

	
	$.fn.et=function() {
		// Identify parameters
		var params={options: {}};
		$.each(arguments, function(k, v) {
			var t=typeof v;
			if (t == 'string') {
				if (methods[v] || v == 'defaults') {
					params.method=v;
				} else if (v.match(/^hover|click|focus|blur$/)) {
					params.toggle=v;
					if (!params.method) params.method='init'; // only attaching event by default
				} else {
					params.content=v;
				}
			} else if ($.isPlainObject(v)) {
				params.options=v;
			} else if ($.isFunction(v)) {
				params.generator=v;
			} else if (typeof v == 'object') {
				params.content=v;
			} else if (typeof v == 'number') {
				params.duration=v;
			} else {
				$.error('Unknown argument #'+k+': '+(typeof v));
			}
		});
		var options={};
		$.extend(options, $.fn.et.defaults.options || {}, params.options);
		$.extend(params, $.fn.et.defaults || {});
		params.options=options;

		// just setting defaults
		if (params.method == 'defaults') {
			delete params.method;
			$.extend($.fn.et.defaults, params);
			return this;
		}

		// 'show' is default action if content is specified
		if (!params.method && (params.generator || params.content)) params.method='show';

		// Method calling logic
		return this.each(function() {
			var $this=$(this).is('.et') ? $(this).data('etSrc') : $(this);
			
			// Settings per Tooltip
			var settings = $this.data('etSettings') || {
				'method': 'show', // show, hide, align, top, toggle
				'content': false, // HTML or selector
				'generator': methods.defaultGenerator, // per-item content generating function
				'color' : 'dark', // sets this class on .et element
				'fx': 'fade', // FX name 'show', 'fade', 'slide' or function(settings, show)
				'position': 'auto', // top, left, bottom, right
				'align': 'auto', // start, center, end
				'className': '', // addition class names on div.et
				'group': '', // white space separated names of groups. Only one popup from a group can be visible at a time.
				'toggle': false, // click, hover, focus, blur
				'duration': 0 // autohide after specified time (ms)
			};
			$.extend(settings, params, params.options);
			//console.log(settings, params, params.options);
			delete settings.options;

			// Remove default generator
			if (settings.content !== false) delete settings.generator;
			if (typeof settings.content == 'string') settings.content=$(settings.content);

			// Do it
			methods[settings.method].apply(this, [settings]);

			// Duration
			if (settings.duration && settings.method == 'show') {
				clearTimeout(settings.durationTimeout);				
				settings.durationTimeout=setTimeout(function () {$this.et('hide');}, settings.duration);
			} else if (settings.method == 'hide') {
				clearTimeout(settings.durationTimeout);
			}

			// Toggle Event
			if (settings.toggle == 'click' && $this.is('a[href]')) {
				$this[settings.toggle](function() {$(this).et('toggle'); return false;}); // for links cancel the default action if type is "click"
			} else if (settings.toggle) {
				$this[settings.toggle](function() {$(this).et('toggle');});
			}
			delete settings.toggle; // to avoid re-attaching of the event with other calls

			// Store current settings
			$this.data('etSettings', settings);
		});
	};

	$.fn.et.defaults={ // Defaults
		'options': {}
	};
})( jQuery );

