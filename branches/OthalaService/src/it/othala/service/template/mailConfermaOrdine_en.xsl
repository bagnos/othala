<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/TR/REC-html40" version="1.0">
	<xsl:decimal-format name="euro" decimal-separator="," grouping-separator="."/>
	<xsl:template match="/order">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			</head>

			<body
				style="padding:4px;font-family: Helvetica Neue,Helvetica,Arial,sans-serif;line-height: 1.42857143;">
				<!-- logo -->
				
				
				<div>
					<img>
						<xsl:attribute name="src">
    								<xsl:value-of select="imgLogo" />
    								</xsl:attribute>
					</img>
				</div>

				<!-- grreting -->
				<p style="margin-top:20px">
					Dear
					<xsl:value-of select="customer/name" />
					,
					<br />
					<br />
					<xsl:choose>
						<xsl:when test="pending = 'false'">							
							your order has been received and it is being developed.
						</xsl:when>
						<xsl:when test="pending = 'spedito'">							
							your order has been sent.
						</xsl:when>
						<xsl:otherwise>
							your order is being verified in PayPal System, we will send you an email
							about payment outcome.							
						</xsl:otherwise>
					</xsl:choose>

				</p>

				<!-- nr ordine e transazione -->
				<div>
					<div>
						<label style="display:inline-block;width:150px">
							<b>Order Number </b>
						</label>
						<xsl:value-of select="number" />
					</div>
					<div>
						<label style="display:inline-block;width:150px">
							<b>Transaction Number </b>
						</label>
						<xsl:value-of select="transaction" />
					</div>

				</div>


				<!-- ringraziamenti -->
				<p>
					<xsl:choose>
						<xsl:when test="pending = 'false'">
							We will send you an email when we delivery your order.
						</xsl:when>
						<xsl:when test="pending = 'spedito'">
						</xsl:when>
						<xsl:otherwise>
							If your payment will be ok we will send you an email at the moment of delivery.
						</xsl:otherwise>
					</xsl:choose>
					<br />
					<br />
					thanks for the trust.
					<br />
					Please come and visit our shop!
				</p>
				<p>
					<strong>You can consult your orders in in the "My Order" section of your Area.
					</strong>
				</p>


				<!-- dettaglio ordine -->

				<!-- UTENTE -->
				<table style="width:100%;padding:10px;text-align:left;">
					<tr>
						<th>
							Email
						</th>
						<td>
							<xsl:value-of select="customer/mail" />
						</td>
					</tr>
					<tr>
						<th>
							Name
						</th>
						<td>
							<xsl:value-of select="customer/name" />
						</td>
					</tr>
					<tr>
						<th>
							Surname
						</th>
						<td>
							<xsl:value-of select="customer/surname" />
						</td>
					</tr>
				</table>



				<table style="width:100%;padding:10px;text-align:left;">
					<thead>
						<tr>
							<th>Billing Address</th>
							<th>Delivery Address</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<!-- INDIRIZZO FATTURAIZONE -->


								<p style="line-height: 1.42857143;">

									<label style="display:inline-block;width:90px">Name</label>
									<span>
										<xsl:value-of select="billingAddress/name" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Surname</label>
									<span>
										<xsl:value-of select="billingAddress/surname" />
									</span>
									<br />


									<label style="display:inline-block;width:90px">Telephone</label>

									<xsl:value-of select="billingAddress/telefono" />

									<br />

									<label style="display:inline-block;width:90px">Address</label>
									<span>
										<xsl:value-of select="billingAddress/street" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Cap</label>
									<span>
										<xsl:value-of select="billingAddress/zipCode" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">City</label>
									<span>
										<xsl:value-of select="billingAddress/city" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Province</label>
									<span>
										<xsl:value-of select="billingAddress/prov" />
									</span>
									<br />
									<label style="display:inline-block;width:90px">Nation</label>
									<span>
										<xsl:value-of select="billingAddress/country" />
									</span>

								</p>

							</td>
							<td>
								<!-- INDIRIZZO FATTURAIZONE -->
								<p style="line-height: 1.42857143;">
									<label style="display:inline-block;width:90px">Name</label>
									<span>
										<xsl:value-of select="shippingAddress/name" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Surname</label>
									<span>
										<xsl:value-of select="shippingAddress/surname" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Telephone</label>
									<span>
										<xsl:value-of select="shippingAddress/tel" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Address</label>
									<span>
										<xsl:value-of select="shippingAddress/street" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Cap</label>
									<span>
										<xsl:value-of select="shippingAddress/zipCode" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">City</label>
									<span>
										<xsl:value-of select="shippingAddress/city" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Province</label>
									<span>
										<xsl:value-of select="shippingAddress/prov" />
									</span>
									<br />
									<label style="display:inline-block;width:90px">Nation</label>
									<span>
										<xsl:value-of select="shippingAddress/country" />
									</span>

								</p>

							</td>
						</tr>
					</tbody>
				</table>

				<!-- METODO DI PAGAMENTO -->
				<div>
					<h4>PAYMENT</h4>
					<div>
						<img>

							<xsl:attribute name="src">
    								<xsl:value-of select="imgPayment" />
    								</xsl:attribute>
						</img>
					</div>
				</div>

				<!-- CARRELLO -->
				<h4>CART</h4>

				<table border="0" style="width:100%;text-align:left;border-spacing:10px;">
					<thead>
						<tr>
							<th colspan="2">Article</th>
							<th>Color</th>
							<th>Size</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Total Price</th>

						</tr>
					</thead>
					<tbody style="vertical-align: top;">
						<xsl:for-each select="cart/item">
							<tr>
								<td>
									<img style="width: 50px;height: 50px;float: left">
										<xsl:attribute name="src">
    								<xsl:value-of select="img" />
    								</xsl:attribute>
									</img>
								</td>
								<td>

									<xsl:value-of select="brand" />
									<br />

									<xsl:value-of select="description" />
									<br />

									Id.
									<xsl:value-of select="number" />
									<br />

								</td>
								<td>
									<xsl:value-of select="color" />
								</td>
								<td>
									<xsl:value-of select="size" />
								</td>

								<td>
									<xsl:value-of select="format-number(unitPrice, '#.###.##0,00' , 'euro')"/>
									
								</td>
								<td>
									<xsl:value-of select="quantity" />
								</td>
								<td>
									<xsl:value-of select="format-number(price, '#.###.##0,00' , 'euro')"/>
									
								</td>


							</tr>
						</xsl:for-each>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6" class="text-right">Delivery Cost</td>
							<td>
								<xsl:value-of select="format-number(deliveryCost, '#.###.##0,00' , 'euro')"/>
							
							</td>
						</tr>
						<tr>
							<td colspan="6" class="text-right">
								<strong>Total</strong>
							</td>
							<td>
								<xsl:value-of select="format-number(totalCost, '#.###.##0,00' , 'euro')"/>
								
							</td>
						</tr>

					</tfoot>
					
				</table>



			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>