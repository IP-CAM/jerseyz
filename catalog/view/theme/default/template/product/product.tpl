<?php echo $header; ?>

<div class="container-fluid product-page">

<ul class="breadcrumb">
<?php foreach ($breadcrumbs as $breadcrumb) { ?>
<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
<?php } ?>
</ul>

<div class="row">

<?php echo $column_left; ?>
<?php if ($column_left && $column_right) { ?>
<?php $class = 'col-sm-6'; ?>
<?php } elseif ($column_left || $column_right) { ?>
<?php $class = 'col-sm-9'; ?>
<?php } else { ?>
<?php $class = 'col-sm-12'; ?>
<?php } ?>

<div id="content" class="<?php echo $class; ?> product-content">

<?php echo $content_top; ?>

<div class="row">

<!-- LEFT CONTENT / IMAGES -->
<?php if ($column_left || $column_right) {
$class = 'col-sm-6';
} else {
$class = 'col-sm-7';
} ?>

<div class="<?php echo $class; ?> content-left">

<?php if ($thumb || $images) { ?>

<div class="product-images">

<div id="sync1" class="product-slideshow" style="opacity:1;">
<?php if ($thumb) { ?>
<div class="slide"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></div>
<?php } ?>
<?php if ($images) { ?>
<?php foreach ($images as $image) { ?>
<div class="slide"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></div>
<?php } ?>
<?php } ?>
</div>

<div id="sync2" class="product-slideshow" style="opacity:1;">
<?php if ($thumb) { ?>
<div class="slide"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></div>
<?php } ?>
<?php if ($images) { ?>
<?php foreach ($images as $image) { ?>
<div class="slide"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></div>
<?php } ?>
<?php } ?>
</div>

</div>

<?php } ?>

</div>

<!-- RIGHT CONTENT / PRODUCT INFO -->
<?php if ($column_left || $column_right) {
$class = 'col-sm-6';
} else {
$class = 'col-sm-5';
} ?>

<div class="<?php echo $class; ?> content-right">

<div class="product-info">

<h1><?php echo $heading_title; ?></h1>

<?php if ($description) { ?>
<div class="product-description">
<?php echo $description; ?>
</div>
<?php } ?>

<!--<ul class="list-unstyled">
<?php if ($manufacturer) { ?>
<li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
<?php } ?>
<li><?php echo $text_model; ?> <?php echo $model; ?></li>
<?php if ($reward) { ?>
<li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
<?php } ?>
<li><?php echo $text_stock; ?> <?php echo $stock; ?></li>
</ul>-->

<?php if ($price) { ?>
<div class="product-price">
<ul class="list-unstyled">
<?php if (!$special) { ?>
<li class="price-item"><span class="reg-price"><?php echo $price; ?></span></li>
<?php } else { ?>
<li class="price-item">
<span class="original-price"><?php echo $price; ?></span> &nbsp; <span class="special-price"><?php echo $special; ?></span>
</li>
<?php } ?>
<?php if ($points) { ?>
<li><?php echo $text_points; ?> <?php echo $points; ?></li>
<?php } ?>
<?php if ($discounts) { ?>
<li><hr></li>
<?php foreach ($discounts as $discount) { ?>
<li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
<?php } ?>
<?php } ?>
</ul>
</div>
<?php } ?>

<div id="product">

<?php if ($options) { ?>
<div class="product-options">
<?php foreach ($options as $option) { ?>

<?php if ($option['type'] == 'image') { ?>
<div class="product-option image-option form-group<?php echo ($option['required'] ? ' required' : ''); ?>">

<label class="control-label"><?php echo $option['name']; ?> :</label>
<div id="input-option<?php echo $option['product_option_id']; ?>">
<?php foreach ($option['product_option_value'] as $option_value) { ?>
<div class="radio">
<label>
<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php //echo $option_value['name']; ?>
<?php if ($option_value['price']) { ?>
(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
<?php } ?>
</label>
</div>
<?php } ?>
</div>

</div>
<?php } ?>

<?php if ($option['type'] == 'select') { ?>

<div class="product-option select-box form-group<?php echo ($option['required'] ? ' required' : ''); ?>">

<!--<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?> :</label>-->

<div>

<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">

<!--<option value=""><?php echo $text_select; ?></option>-->

<?php foreach ($option['product_option_value'] as $option_value) { ?>

<option value="<?php echo $option_value['product_option_value_id']; ?>">

<?php echo $option['name']; ?> : <?php echo $option_value['name']; ?>

<?php if ($option_value['price']) { ?>

(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)

<?php } ?>

</option>

<?php } ?>

</select>

</div>

</div>

<?php } ?>

<?php if ($option['type'] == 'radio') { ?>
<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
<label class="control-label"><?php echo $option['name']; ?></label>
<div id="input-option<?php echo $option['product_option_id']; ?>">
<?php foreach ($option['product_option_value'] as $option_value) { ?>
<div class="radio">
<label>
<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
<?php echo $option_value['name']; ?>
<?php if ($option_value['price']) { ?>
(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
<?php } ?>
</label>
</div>
<?php } ?>
</div>
</div>
<?php } ?>

<?php if ($option['type'] == 'checkbox') { ?>
<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
<label class="control-label"><?php echo $option['name']; ?></label>
<div id="input-option<?php echo $option['product_option_id']; ?>">
<?php foreach ($option['product_option_value'] as $option_value) { ?>
<div class="checkbox">
<label>
<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
<?php if ($option_value['image']) { ?>
<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
<?php } ?>
<?php echo $option_value['name']; ?>
<?php if ($option_value['price']) { ?>
(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
<?php } ?>
</label>
</div>
<?php } ?>
</div>
</div>
<?php } ?>

<?php if ($option['type'] == 'text') { ?>
<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
</div>
<?php } ?>

<?php if ($option['type'] == 'textarea') { ?>
<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
<textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
</div>
<?php } ?>

<?php if ($option['type'] == 'file') { ?>
<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
<label class="control-label"><?php echo $option['name']; ?></label>
<button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
</div>
<?php } ?>

<?php } ?>
</div>
<?php } ?>

<?php if ($recurrings) { ?>
<div class="product-recurring">
<h3><?php echo $text_payment_recurring ?></h3>
<div class="form-group required">
<select name="recurring_id" class="form-control">
<option value=""><?php echo $text_select; ?></option>
<?php foreach ($recurrings as $recurring) { ?>
<option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
<?php } ?>
</select>
<div class="help-block" id="recurring-description"></div>
</div>
</div>
<?php } ?>

<div class="product-add form-group">

<!--
<div class="product-amount">
<label class="control-label" for="input-quantity"><?php echo $entry_qty; ?> :</label>
<button class="minus"><i class="fa fa-minus"></i></button>
<input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
<button class="plus"><i class="fa fa-plus"></i></button>
</div>
-->

<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />

<button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="add2cart-btn"><?php echo $button_cart; ?></button>

</div>

<!-- AddThis Button BEGIN
<div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
AddThis Button END -->

<div class="product-share">

<a href="http://twitter.com/intent/tweet?status=<?php echo $heading_title; ?>+<?php $url = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]"; echo $url; ?>" target="_blank" class="tweet"><img src="/test/image/catalog/social-media/twitter-tweet.png" title="Tweet it!" alt="Tweet it!" /><span>Tweet it</span></a>

<a href="http://www.facebook.com/sharer/sharer.php?u=<?php $url = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]"; echo $url; ?>&title=<?php echo $heading_title; ?>" target="_blank" class="share"><img src="/test/image/catalog/social-media/facebook-share.png" title="Share it!" alt="Share it!" /><span>Share it</span></a>

<a href="http://pinterest.com/pin/create/bookmarklet/?media=[MEDIA]&url=<?php $url = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]"; echo $url; ?>&is_video=false&description=<?php echo $heading_title; ?>" target="_blank" class="pin"><img src="/test/image/catalog/social-media/pinterest-pin.png" title="Pin it!" alt="Pin it!" /><span>Pin it</span></a>

<?php if ($minimum > 1) { ?>
<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
<?php } ?>

</div>

</div>

</div>

</div>

</div>

<?php echo $content_bottom; ?>

</div>

<?php echo $column_right; ?>

</div>

</div>

<script type="text/javascript"><!--
$('#sync1').slick({
slidesToShow: 1,
slidesToScroll: 1,
arrows: true,
asNavFor: '#sync2'
});
$('#sync2').slick({
slidesToShow: 8,
slidesToScroll: 1,
asNavFor: '#sync1',
dots: false,
centerMode: false,
focusOnSelect: true
});
--></script>

<script>
$('.plus').click(function() {
  var oldVal = $(this).parent().find("input#input-quantity").val();
  if ( parseFloat(oldVal) >= 0 ) {
	var newVal = parseFloat(oldVal) + 1;
	$(this).parent().find("input#input-quantity").val(newVal);
  }
});
$('.minus').click(function() {
  var oldVal = $(this).parent().find("input#input-quantity").val();
  if ( parseFloat(oldVal) >= 2 ) {
	var newVal = parseFloat(oldVal) - 1;
	$(this).parent().find("input#input-quantity").val(newVal);
  }
});
</script>

<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				<!--$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');-->
				<!--$('button.cart-btn').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);-->

				// @mrlit // open cart after adding product
				$('.cart-btn').addClass('btn-active');
				$('.cart-menu').show("slide", {direction: "right"});
				overlayAction(on);

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > .cart-menu-container').load('index.php?route=common/cart/info .cart-menu-container > div');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

/*
$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
*/
//--></script>
<?php echo $footer; ?>
