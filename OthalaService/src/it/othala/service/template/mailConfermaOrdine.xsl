<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/TR/REC-html40" version="1.0">
	<xsl:template match="/">
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
    								<xsl:value-of select="order/imgLogo" />
    								</xsl:attribute>
					</img>
				</div>

				<!-- grreting -->
				<p style="margin-top:20px">
					Gentile
					<xsl:value-of select="order/customer/name" />
					,
					<br />
					<br />
					il tuo ordine è stato ricevuto ed è in corso di elaborazione.
				</p>

				<!-- nr ordine e transazione -->
				<div>
					<div>
						<label style="display:inline-block;width:130px">
							<b>Numero Ordine</b>
						</label>
						<xsl:value-of select="order/number" />
					</div>
					<div>
						<label style="display:inline-block;width:130px">
							<b>Numero Transazione</b>
						</label>
						<xsl:value-of select="order/transaction" />
					</div>

				</div>


				<!-- ringraziamenti -->
				<p>
					Quando il tuo ordine verrà messo in consegna ti informeremo con un'e-mail.
					<br />
					<br />
					Grazie
					per la tua fiducia.
					<br />
					Ti aspettiamo nei negozi Degortes!
				</p>
				<p>
					<strong>Puoi consultare lo stato del tuo ordine e la fattura d'acquisto
						dalla sezione
						Ordini in Il Mio Account.
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
							<xsl:value-of select="order/customer/mail" />
						</td>
					</tr>
					<tr>
						<th>
							Nome
						</th>
						<td>
							<xsl:value-of select="order/customer/name" />
						</td>
					</tr>
					<tr>
						<th>
							Cognome
						</th>
						<td>
							<xsl:value-of select="order/customer/surname" />
						</td>
					</tr>
				</table>



				<table style="width:100%;padding:10px;text-align:left;">
					<thead>
						<tr>
							<th>Indirizzo Fatturazione</th>
							<th>Indirizzo Spedizione</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<!-- INDIRIZZO FATTURAIZONE -->


								<p style="line-height: 1.42857143;">

									<label style="display:inline-block;width:90px">Nome</label>
									<span>
										<xsl:value-of select="order/billingAddress/name" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Cognome</label>
									<span>
										<xsl:value-of select="order/billingAddress/surname" />
									</span>
									<br />


									<label style="display:inline-block;width:90px">Telefono</label>

									<xsl:value-of select="order/billingAddress/telefono" />

									<br />

									<label style="display:inline-block;width:90px">Indirizzo</label>
									<span>
										<xsl:value-of select="order/billingAddress/street" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Cap</label>
									<span>
										<xsl:value-of select="order/billingAddress/zipCode" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Città</label>
									<span>
										<xsl:value-of select="order/billingAddress/city" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Provincia</label>
									<span>
										<xsl:value-of select="order/billingAddress/prov" />
									</span>

								</p>

							</td>
							<td>
								<!-- INDIRIZZO FATTURAIZONE -->
								<p style="line-height: 1.42857143;">
									<label style="display:inline-block;width:90px">Nome</label>
									<span>
										<xsl:value-of select="order/shippingAddress/name" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Cognome</label>
									<span>
										<xsl:value-of select="order/shippingAddress/surname" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Telefono</label>
									<span>
										<xsl:value-of select="order/shippingAddress/tel" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Indirizzo</label>
									<span>
										<xsl:value-of select="order/shippingAddress/street" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Cap</label>
									<span>
										<xsl:value-of select="order/shippingAddress/zipCode" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Città</label>
									<span>
										<xsl:value-of select="order/shippingAddress/city" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Provincia</label>
									<span>
										<xsl:value-of select="order/shippingAddress/prov" />
									</span>

								</p>

							</td>
						</tr>
					</tbody>
				</table>

				<!-- METODO DI PAGAMENTO -->
				<div>
					<h4>METODO DI PAGAMENTO</h4>
					<div>
						<img>

							<xsl:attribute name="src">
    								<xsl:value-of select="order/imgPayment" />
    								</xsl:attribute>
						</img>
					</div>
				</div>

				<!-- CARRELLO -->
				<h4>CARRELLO</h4>

				<table border="0" style="width:100%;text-align:left;border-spacing:10px;">
					<thead>
						<tr>
							<th colspan="2">Articolo</th>
							<th>Colore</th>
							<th>Taglia</th>
							<th>Prezzo</th>
							<th>Quantità</th>
							<th>Prezzo Totale</th>

						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="6" class="text-right">Costo Spedizione</td>
							<td>
								&#8364;
								<xsl:value-of select="order/deliveryCost" />
							</td>
						</tr>
						<tr>
							<td colspan="6" class="text-right">
								<strong>Totale</strong>
							</td>
							<td>
								&#8364;
								<xsl:value-of select="order/totalCost" />
							</td>
						</tr>

					</tfoot>
					<tbody style="vertical-align: top;">
						<xsl:for-each select="order/cart/item">
							<tr>
								<td>
									<img style="width: 95px;height: 126px;float: left">
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
									<xsl:value-of select="unitPrice" />
								</td>
								<td>
									<xsl:value-of select="quantity" />
								</td>
								<td>
									&#8364;
									<xsl:value-of select="price" />
								</td>


							</tr>
						</xsl:for-each>
					</tbody>
				</table>



			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>