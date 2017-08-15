{*
* 2007-2017 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author Conekta <support@conekta.io>
*  @copyright 2007-2017 PrestaShop SA
*  @version v1.0.0
*  @license http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
*}

{if !empty($message)}
<div class="conekta-payment-errors" style="display:block;">{$message|escape:'htmlall':'UTF-8'}</div>
{/if}

<div id="conekta-ajax-loader"><img src="{$module_dir|escape:'htmlall':'UTF-8'}views/img/ajax-loader.gif" alt="" /> {l s='Transaction in progress, please wait.' mod='conekta_prestashop'}</div>

{if $card == 1 and $msi == 1 }

<p class="payment_module conekta-payment-module card-option" >
	<a class="conekta_title">{l s='Pago con tarjeta de crédito y débito' mod='conekta_prestashop'}</a>
</p>
<form data-ajax="false" action="{$module_dir|escape:'htmlall':'UTF-8'}charge.php" method="POST" id="conekta-payment-form" class="conekta-payment-form">

 <input type="hidden" value="card" name="type"/>
		{if isset($smarty.get.conekta_error)}<a id="conekta_error" name="conekta_error"></a><div class="conekta-payment-errors">{l s='There was a problem processing your credit card, please double check your data and try again.' mod='conekta_prestashop'}</div>{/if}
                <label>{l s='Nombre del tarjetahabiente' mod='conekta_prestashop'}</label><br />
                <input type="text" size="20" autocomplete="off" class="conekta-card-name" data-conekta="card[name]" />
                <br />
		<label>{l s='Número de tarjeta' mod='conekta_prestashop'}</label><br />
		<input type="text" size="20" autocomplete="off" class="conekta-card-number" data-conekta="card[number]" />
		<br />
		<div class="block-left">
		</div>
		<div class="block-left">
			<label>{l s='CVC' mod='conekta_prestashop'}</label><br />
			<input type="text" size="4" autocomplete="off" class="conekta-card-cvc" data-conekta="card[cvc]" />
		</div>
		<div class="clear"></div>
		<label>{l s='Fecha de Expiración (MM/YYYY)' mod='conekta_prestashop'}</label><br />
{* use this if the merchant would like the months to be names	*}
		{html_select_date month_extra='id="conekta-card-expiry-month" class="conekta-card-expiry-month" data-conekta="card[exp_month]" data-encrypted-name="month"' data-conekta="card[exp_year]" year_extra='id="conekta-card-expiry-year" class="conekta-card-expiry-year" data-encrypted-name="year"' display_days=false end_year="+10"}
		<br />
        <label>{l s='Tipo de Pago' mod='conekta_prestashop'}</label><br />
		<select id="monthly_installments" name="monthly_installments" autocomplete="off">
		<option selected="selected" value="1"> Pago único</option>
		<option value="3"> 3 meses </option>
		<option value="6"> 6 meses </option>
    <option value="9"> 9 meses </option>
		<option value="12"> 12 meses </option>
		</select>

<button type="submit" value="{l s='Realizar Pago' mod='conekta_prestashop'}" style="margin-top:20px;" id="conekta-submit-button" class="btn btn-default button button-medium" data-icon="check" data-iconpos="right" data-theme="b" >
<span>
{l s='Realizar Pago' mod='conekta_prestashop'}
</span>
</button>

	</form>

{/if}

{if $card == 1 && $msi == 0 }

<p class="payment_module conekta-payment-module card-option" >
<a class="conekta_title">{l s='Pago con tarjeta de crédito y débito (sin meses sin intereses)' mod='conekta_prestashop'}</a>
</p>
<form data-ajax="false" action="{$module_dir|escape:'htmlall':'UTF-8'}charge.php" method="POST" id="conekta-payment-form" class="conekta-payment-form">
 <input type="hidden" value="card" name="type"/>

{if isset($smarty.get.conekta_error)}<a id="conekta_error" name="conekta_error"></a><div class="conekta-payment-errors">{l s='There was a problem processing your credit card, please double check your data and try again.' mod='conekta_prestashop'}</div>{/if}
<label>{l s='Nombre del tarjetahabiente' mod='conekta_prestashop'}</label><br />
<input type="text" size="20" autocomplete="off" class="conekta-card-name" data-conekta="card[name]" />
<br />
<label>{l s='Número de tarjeta' mod='conekta_prestashop'}</label><br />
<input type="text" size="20" autocomplete="off" class="conekta-card-number" data-conekta="card[number]" />
<br />
<div class="block-left">
</div>
<div class="block-left">
<label>{l s='CVC' mod='conekta_prestashop'}</label><br />
<input type="text" size="4" autocomplete="off" class="conekta-card-cvc" data-conekta="card[cvc]" />
</div>
<div class="clear"></div>
<label>{l s='Fecha de Expiración (MM/YYYY)' mod='conekta_prestashop'}</label><br />
{* use this if the merchant would like the months to be names	*}
{html_select_date month_extra='id="conekta-card-expiry-month" class="conekta-card-expiry-month" data-conekta="card[exp_month]" data-encrypted-name="month"' data-conekta="card[exp_year]" year_extra='id="conekta-card-expiry-year" class="conekta-card-expiry-year" data-encrypted-name="year"' display_days=false end_year="+10"}
<br />
<button type="submit" value="{l s='Realizar Pago' mod='conekta_prestashop'}" style="margin-top:20px;" id="conekta-submit-button" class="conekta-submit-button btn btn-default button button-medium" data-icon="check" data-iconpos="right" data-theme="b" >
<span>
{l s='Realizar Pago' mod='conekta_prestashop'}
</span>
</button>

</form>
{/if}

{if $cash == 1}

<p class="payment_module conekta-payment-module cash-option" >

<a class="conekta_title ">{l s='Pago en efectivo con OxxoPay' mod='conekta_prestashop'}</a>
</p>


<form data-ajax="false" action="{$module_dir|escape:'htmlall':'UTF-8'}charge.php" method="POST" id="conekta-cash-form" class="conekta-payment-form">

<label> {l s='Haz clic en el siguiente boton para generar la ficha de pago' mod='conekta_prestashop'} </label>
<br />
<br />
 <input type="hidden" value="cash" name="type"/>
<button type="submit" value="{l s='Generar Ficha de Pago' mod='conekta_prestashop'}" id="conekta-submit-button" class="conekta-submit-button btn btn-default button button-medium" data-icon="check" data-iconpos="right" data-theme="b" >
<span>
{l s='Generar Ficha de Pago' mod='conekta_prestashop'}
</span>
</button>

</form>


{/if}

{if $spei == 1 }

<p class="payment_module conekta-payment-module spei-option" >
<a class="conekta_title">{l s='Pago por medio de SPEI' mod='conekta_prestashop'}</a>
</p>
<form data-ajax="false" action="{$module_dir|escape:'htmlall':'UTF-8'}charge.php" method="POST" class="conekta-payment-form" id="conekta-cash-form">
<label> {l s='Haz clic en el siguiente boton para generar la ficha de pago' mod='conekta_prestashop'} </label>
<br />
<br />
 <input type="hidden" value="spei" name="type"/>
<button type="submit" value="{l s='Generar CLABE para Realizar Pago' mod='conekta_prestashop'}" id="conekta-submit-button" class="conekta-submit-button btn btn-default button button-medium" data-icon="check" data-iconpos="right" data-theme="b" >
<span>
{l s='Generar CLABE para Realizar Pago' mod='conekta_prestashop' }
</span>

</button>

</form>

{/if}

{literal}
<script>
if ( !$.mobile ) {
	$(document).ready(function() {
    $('.payment_module').click(function(){
      var $selector = $(this);
      $(".conekta-payment-form").each(function() {
        $( this ).removeClass("active");
      });
      $selector.next("form").addClass("active");
      $(".payment_module").each(function() {
        $( this ).removeClass("active");
      });
      $selector.addClass("active");
    });
  });
} 
</script>
{/literal}
