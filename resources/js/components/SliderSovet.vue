<template>
  <div dark>
    <ul class='content-center mobile-nav-top slide-start' id='fifty-fifty-slider-stack-id'>
  <div class='ffs-nav'>
    <div class='ffs-nav-count'>
      <span class='ffs-current'>1</span>
      <span>/</span>
      <span class='ffs-total'>3</span>
    </div>
    <a style="border: none" class='prev'>
      <span uk-icon="chevron-left"></span>
    </a>
    <a style="border: none" class='next'>
      <span uk-icon="chevron-right"></span>
    </a>
  </div>
  <li class='ffs-slide active the-one'>
    <div class='ffs-slide-content'>
      <div class='ffs-slide-content-inner'>
        <h2 class='ffs-slide-title'>Title</h2>
        <div class='ffs-slide-text'>
          <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Molestias ratione reiciendis neque quae ea earum laboriosam eligendi harum. Odio officia nemo nulla sunt hic aspernatur cumque sed necessitatibus tempora amet.</p>
        </div>
        <!-- <a class='ffs-slide-action' href='#'>힘들구만...</a> -->
      </div>
    </div>
    <div class='ffs-slide-image'></div>
  </li>
  <li class='ffs-slide'>
    <div class='ffs-slide-content'>
      <div class='ffs-slide-content-inner'>
        <h2 class='ffs-slide-title'>Title</h2>
        <div class='ffs-slide-text'>
          <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Molestias ratione reiciendis neque quae ea earum laboriosam eligendi harum. Odio officia nemo nulla sunt hic aspernatur cumque sed necessitatibus tempora amet.</p>
          <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Molestias ratione reiciendis neque quae ea earum laboriosam eligendi harum. Odio officia nemo nulla sunt hic aspernatur cumque sed necessitatibus tempora amet.</p>
        </div>
        <!-- <a class='ffs-slide-action' href='#'>힘들구만...</a> -->
      </div>
    </div>
    <div class='ffs-slide-image'></div>
  </li>
  <li class='ffs-slide'>
    <div class='ffs-slide-content'>
      <div class='ffs-slide-content-inner'>
        <h2 class='ffs-slide-title'>Title</h2>
        <div class='ffs-slide-text'>
          <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Molestias ratione reiciendis neque quae ea earum laboriosam eligendi harum. Odio officia nemo nulla sunt hic aspernatur cumque sed necessitatibus tempora amet.</p>
        </div>
        <!-- <a class='ffs-slide-action' href='#'>힘들구만...</a> -->
      </div>
    </div>
    <div class='ffs-slide-image'></div>
  </li>
</ul>
</div>

</template>

<script>
// import $ from 'jquery';
  export default {
    name: 'SliderSovet',

    mounted() {
      this.slider_3()
    },
    
    methods: {
      slider_3(){
        // $(function(){
	
	// var fiftySlider = {
	// 	active: 0,
	// 	$el: $('#fifty-fifty-slider-stack-id'),
	// 	$slides: $('#fifty-fifty-slider-stack-id .ffs-slide'),
	// 	$navCount: $('#fifty-fifty-slider-stack-id .ffs-nav-count'),
	// 	numSlides: $('#fifty-fifty-slider-stack-id .ffs-slide').length,
	// 	initialize: function(){
	// 		this.setHeight();
	// 		this.updateCount();
	// 		this.$navCount.find('.ffs-total')
	// 			.html(this.numSlides)
	// 	},
	// 	updateCount: function(){
	// 		this.$navCount.find('.ffs-current')
	// 			.html(this.active+1)
	// 	},
	// 	setHeight: function(){
	// 		var elementHeights = this.$slides.map(function() {
	// 			return $(this).height();
	// 		}).get();

	// 		var maxHeight = Math.max.apply(null, elementHeights);
			
	// 		this.$el.css('height', maxHeight).addClass('height-set');
	// 		this.$slides.css('bottom', '');
	// 	},
	// 	nextSlide: function(){
	// 		this.$el.removeClass('slide-start');
	// 		if(this.active+1 < this.numSlides){
	// 			$(this.$slides[this.active+1]).addClass('active');
	// 			if(this.active+1 == this.numSlides-1){
	// 				this.$el.addClass('slide-end');
	// 			}
	// 			this.active++;
	// 		}
	// 		this.updateCount();
	// 		this.setHeight();
	// 	},
	// 	prevSlide: function(){
	// 		this.$el.removeClass('slide-end');
	// 		if(this.active-1 >= 0){
	// 			$(this.$slides[this.active]).removeClass('active the-one');
	// 			$(this.$slides[this.active-1]).addClass('the-one')
	// 			if(this.active-1 == 0){
	// 				this.$el.addClass('slide-start');
	// 			}
	// 			this.active--;
	// 		}
	// 		this.updateCount();
	// 		this.setHeight();
	// 	}
	// }

	// $(window).resize(function(){
	// 	fiftySlider.$slides.css('bottom', 'auto');
	// 	fiftySlider.setHeight();
	// });

	// fiftySlider.initialize();
	
	// $('#fifty-fifty-slider-stack-id a.next').click(function(){
	// 	fiftySlider.nextSlide();
	// })

	// $('#fifty-fifty-slider-stack-id a.prev').click(function(){
	// 	fiftySlider.prevSlide();
	// })

// });

      }
    }
  }
</script>

<style>
#fifty-fifty-slider-stack-id {
  border-radius: 10px;
  max-width: 800px;
  min-height: 450px;
  padding: 0;
  display: flex;
  margin: 50px auto;
  overflow: hidden;
  list-style: none;
  position: relative;
  align-items: stretch;
  font-family: "Nunito";
  transition: all 0s ease-in-out;
}

#fifty-fifty-slider-stack-id .ffs-slide {
  top: 0;
  left: 0;
  z-index: 1;
  width: 100%;

  bottom: auto;
  display: flex;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  position: absolute;
  pointer-events: none;
  box-sizing: border-box;
  transform: all 0.3s ease-in-out;
}
#fifty-fifty-slider-stack-id .ffs-slide.active .ffs-slide-content {
  transform: translateX(0%);
}
#fifty-fifty-slider-stack-id .ffs-slide.active .ffs-slide-image {
  transform: translateX(0%);
}
#fifty-fifty-slider-stack-id .ffs-slide-content, #fifty-fifty-slider-stack-id .ffs-slide-image {
  width: 50%;
  flex: 0 1 auto;
  position: relative;
  pointer-events: auto;
  box-sizing: border-box;
}
#fifty-fifty-slider-stack-id .ffs-slide-content {
  z-index: 2;
  display: flex;
  position: relative;
  padding-bottom: 50px;
  transform: translateX(200%);
  transition: transform 0.6s 0s ease-in-out;
  flex-direction: column;
  justify-content: center;
}
#fifty-fifty-slider-stack-id .ffs-slide-content-inner {
  padding: 20px 25px;
  box-sizing: border-box;
}
#fifty-fifty-slider-stack-id .ffs-slide-content .ffs-slide-title {
  color: white;
  font-size: 30px;
  line-height: 48px;
  margin-bottom: 10px;
}
#fifty-fifty-slider-stack-id .ffs-slide-content .ffs-slide-text p {
  color: rgba(255, 255, 255, 0.5);
  font-size: 14px;
  line-height: 22.4px;
  margin-top: 20px;
}
#fifty-fifty-slider-stack-id .ffs-slide-content .ffs-slide-action {
  color: white;
  font-size: 16px;
  padding: 7px 20px;
  border: 2px solid;
  background: none;
  border-radius: 30px;
  border-color: rgba(255, 255, 255, 0.2);
  display: inline-block;
  box-sizing: border-box;
  text-decoration: none;
  transition: all 0.3s ease;
}
#fifty-fifty-slider-stack-id .ffs-slide-content .ffs-slide-action:hover {
  color: white;
  background: none;
  border-color: white;
}
#fifty-fifty-slider-stack-id .ffs-slide-image {
  z-index: 1;
  transform: translateX(100%);
  transition: transform 0s 0.3s ease-in-out;
}

#fifty-fifty-slider-stack-id .ffs-nav {
  left: 0;
  bottom: 0;
  width: 50%;
  z-index: 10;
  color: white;
  display: flex;
  padding: 10px 20px;
  position: absolute;
  align-items: center;
  box-sizing: border-box;
  justify-content: flex-end;
}
#fifty-fifty-slider-stack-id .ffs-nav-count {
  font-size: 14px;
  margin-right: auto;
}
#fifty-fifty-slider-stack-id .ffs-nav a {
  width: 30px;
  height: 30px;
  border-radius: 30px;
  border: 2px solid white;
  opacity: 0.5;
  display: flex;
  color: inherit;
  line-height: 0;
  cursor: pointer;
  align-items: center;
  justify-content: center;
  transform: translateY(0%);
  transition: all 0.3s ease-in-out;
}
#fifty-fifty-slider-stack-id .ffs-nav a i {
  line-height: 0;
  font-size: 20px;
}
#fifty-fifty-slider-stack-id .ffs-nav a:hover {
  opacity: 1;
}
#fifty-fifty-slider-stack-id .ffs-nav a:first-of-type {
  margin-right: 10px;
}
#fifty-fifty-slider-stack-id.slide-end .ffs-nav a.next {
  opacity: 0;
  visibility: hidden;
  pointer-events: none;
  transform: translateY(100%);
}
#fifty-fifty-slider-stack-id.slide-start .ffs-nav a.prev {
  opacity: 0;
  visibility: hidden;
  pointer-events: none;
  transform: translateY(100%);
}

#fifty-fifty-slider-stack-id.height-set .ffs-slide {
  bottom: 0;
}
#fifty-fifty-slider-stack-id.hide-titles .ffs-slide-title {
  display: none;
}
#fifty-fifty-slider-stack-id.hide-text .ffs-slide-text {
  display: none;
}
#fifty-fifty-slider-stack-id.hide-actions .ffs-slide-action {
  display: none;
}
#fifty-fifty-slider-stack-id.content-top .ffs-slide-content {
  justify-content: flex-start;
}
#fifty-fifty-slider-stack-id.content-center {
  justify-content: center;
}
#fifty-fifty-slider-stack-id.content-bottom {
  justify-content: flex-end;
}

#fifty-fifty-slider-stack-id .ffs-slide:nth-of-type(1) .ffs-slide-content {
  background: #212121;
}
#fifty-fifty-slider-stack-id .ffs-slide:nth-of-type(1) .ffs-slide-image {
  background: url(https://images.unsplash.com/photo-1522205393480-69ac15dafb07?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=1cdd41f80a21709d55bc35ec17415275&auto=format&fit=crop&w=750&q=80) no-repeat center center;
  background-size: cover;
}
#fifty-fifty-slider-stack-id .ffs-slide:nth-of-type(2) .ffs-slide-content {
  background: #212121;
}
#fifty-fifty-slider-stack-id .ffs-slide:nth-of-type(2) .ffs-slide-image {
  background: url(https://images.unsplash.com/photo-1501484311399-ed1e8632445d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=347e5f45d9bc400b9fa37dc99d078f9b&auto=format&fit=crop&w=1050&q=80) no-repeat center center;
  background-size: cover;
}
#fifty-fifty-slider-stack-id .ffs-slide:nth-of-type(3) .ffs-slide-content {
  background: #212121;
}
#fifty-fifty-slider-stack-id .ffs-slide:nth-of-type(3) .ffs-slide-image {
  background: url(https://images.unsplash.com/photo-1499792914147-5e4c9a4a9684?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=161799cf6c9503ea10fbdb38afd88dca&auto=format&fit=crop&w=661&q=80) no-repeat center center;
  background-size: cover;
}

@media (max-width: 500px) {
  #fifty-fifty-slider-stack-id {
    min-height: 450px;
  }
  #fifty-fifty-slider-stack-id .ffs-nav {
    width: 100%;
  }
  #fifty-fifty-slider-stack-id .ffs-slide {
    width: 100%;
    flex: 1 0 auto;
    flex-direction: column-reverse;
  }
  #fifty-fifty-slider-stack-id .ffs-slide-content {
    width: 100%;
    flex: 1 0 auto;
    transform: translateX(100%);
  }
  #fifty-fifty-slider-stack-id .ffs-slide-image {
    width: 100%;
    height: 300px;
    flex: 0 1 auto;
    transform: translateX(100%);
    transition: transform 0.6s 0s ease-in-out;
  }
  #fifty-fifty-slider-stack-id.mobile-nav-top .ffs-slide-content {
    padding-bottom: 0;
    padding-top: 50px;
  }
  #fifty-fifty-slider-stack-id.mobile-nav-top .ffs-nav {
    top: 300px;
    bottom: auto;
  }
  #fifty-fifty-slider-stack-id.mobile-nav-top.slide-start .ffs-nav a.prev {
    transform: translateY(-100%);
  }
  #fifty-fifty-slider-stack-id.mobile-nav-top.slide-end .ffs-nav a.next {
    transform: translateY(-100%);
  }
}
</style>
