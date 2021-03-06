
<li>
<button type="button" class="nav-option-btn cart-btn" data-loading-text="...">
<i class="fa fa-shopping-cart"></i><!--<span id="cart-total"><?php echo $text_items; ?></span>-->
</button>
</li>

<div id="cart" class="nav-option-menu cart-menu" style="display:none;">

<div class="cart-menu-container">

<!--<ul>-->

<?php if ($products || $vouchers) { ?>

<!--<li>-->

<div class="cart-menu-top">

<h1 class="cart-menu-header"><?php echo $text_cart_title; ?></h1>

<table class="table">

<?php foreach ($products as $product) { ?>

<tr>

<td class="cart-thumb text-center">
<?php if ($product['thumb']) { ?>
<a href="<?php echo $product['href']; ?>">
<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" />
</a>
<?php } ?>
</td>

<td class="cart-details text-left">

<a href="<?php echo $product['href']; ?>" class="product-title"><?php echo $product['name']; ?></a>

<?php if ($product['option']) { ?>
<?php foreach ($product['option'] as $option) { ?>
<p class="product-option"><?php //echo $option['name']; ?><?php echo $option['value']; ?></p>
<?php } ?>
<?php } ?>
<p class="product-total"><?php echo $product['total']; ?></p>
<p class="product-quantity"><?php echo $product['quantity']; ?></p>
<p class="cart-btn"><button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></p>
</td>

<!--<td id="qty" class="text-right">
<?php echo $product['quantity']; ?>
</td>-->

<!--<td class="text-right"><?php echo $product['total']; ?></td>-->

<!--<td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>-->

</tr>

<?php } ?>

<?php foreach ($vouchers as $voucher) { ?>
<tr>
<td class="text-center"></td>
<td class="text-left"><?php echo $voucher['description']; ?></td>
<td class="text-right">x&nbsp;1</td>
<td class="text-right"><?php echo $voucher['amount']; ?></td>
<td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
</tr>
<?php } ?>

</table>

</div>

<!--</li>-->

<!--<li>-->

<div class="cart-menu-bottom">

<div class="cart-total">
<?php foreach ($totals as $total) { ?>
<p class="text-center"><?php echo $total['title']; ?> : <?php echo $total['text']; ?></p>
<?php } ?>
</div>
<a href="<?php echo $checkout; ?>" class="button btn-full"><?php echo $text_checkout; ?></a>

</div>

<!--</li>-->

<?php } else { ?>
<div class="cart-empty">
<h1 class="cart-menu-header"><?php echo $text_cart_title; ?></h1>
<p class="text-center"><?php echo $text_empty; ?></p>
</div>
<?php } ?>

<!--</ul>-->

</div>

</div>

<!--<script>
$('.plus').click(function() {
  var oldVal = $(this).parent().find("input").val();
  if ( parseFloat(oldVal) >= 0 ) {
	var newVal = parseFloat(oldVal) + 1;
	$(this).parent().find("input").val(newVal);
  }
});
</script>-->
