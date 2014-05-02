<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/TR/REC-html40" version="1.0">
	<xsl:template match="/">
		<html>
			<head>
				<meta charset="utf-8" />
			</head>

			<body>
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
						<label style="display:inline-block;width:140px">Ordine</label>
						<xsl:value-of select="number" />
					</div>
					<div>
						<label style="display:inline-block;width:140px">Transazione</label>
						<xsl:value-of select="transaction" />
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
					Ti aspettiamo nei negozi Degothes
				</p>
				<p>
					<strong>Puoi consultare lo stato del tuo ordine e la fattura d'acquisto
						dalla sezione
						Ordini in Il Mio Account.
					</strong>
				</p>
				<p>Il dettaglio dell'ordine è mostrato di seguito perché possa consultarlo:
				</p>

				<!-- dettaglio ordine -->


				<table style="width:100%;padding:10px;text-align:left;">
					<thead>
						<tr>
							<th>Utente</th>
							<th>Indirizzo Fatturazione</th>
							<th>indirizzo Spedizione</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<!-- UTENTE -->
								<div>
									<label style="display:inline-block;width:140px">Email</label>
									<xsl:value-of select="order/customer/mail" />
								</div>
								<div>
									<label style="display:inline-block;width:140px"><xsl:value-of select="order/customer/name" /></label>
									simone
								</div>
								<div>
									<label style="display:inline-block;width:140px"><xsl:value-of select="order/customer/surname" /></label>
									bagnolesi
								</div>
							</td>

							<td>
								<!-- INDIRIZZO FATTURAIZONE -->
								<div>
									<h4>INDIRIZZO DI FATTURAZIONE</h4>
									<div class="well">
										<div>
											<label style="display:inline-block;width:140px">Nome</label>
											<span><xsl:value-of select="order/billinAddress/name" /></span>
										</div>
										<div>
											<label style="display:inline-block;width:140px">Cognome</label>
											<span><xsl:value-of select="order/billinAddress/surname" /></span>

										</div>

										<div>
											<label style="display:inline-block;width:140px">Telefono</label>
											<span><xsl:value-of select="order/billinAddress/tel" /></span>
										</div>

										<div>
											<label style="display:inline-block;width:140px">Indirizzo</label>
											<span><xsl:value-of select="order/billinAddress/street" /></span>
										</div>

										<div>
											<label style="display:inline-block;width:140px">Cap</label>
											<span><xsl:value-of select="order/billinAddress/zipCode" /></span>
										</div>

										<div>
											<label style="display:inline-block;width:140px">Città</label>
											<span><xsl:value-of select="order/billinAddress/city" /></span>
										</div>

										<div>
											<label style="display:inline-block;width:140px">Provincia</label>
											<span><xsl:value-of select="order/billinAddress/prov" /></span>
										</div>
									</div>
								</div>

							</td>
							<td>
								<!-- INDIRIZZO FATTURAIZONE -->
								<div>
									<h4>INDIRIZZO DI SPEDIZIONE</h4>
									<div class="well">
										<div>
											<label style="display:inline-block;width:140px">Nome</label>
											<span><xsl:value-of select="order/shippingAddress/name" /></span>
										</div>
										<div>
											<label style="display:inline-block;width:140px">Cognome</label>
											<span><xsl:value-of select="order/shippingAddress/surname" /></span>

										</div>

										<div>
											<label style="display:inline-block;width:140px">Telefono</label>
											<span><xsl:value-of select="order/shippingAddress/tel" /></span>
										</div>

										<div>
											<label style="display:inline-block;width:140px">Indirizzo</label>
											<span><xsl:value-of select="order/shippingAddress/street" /></span>
										</div>

										<div>
											<label style="display:inline-block;width:140px">Cap</label>
											<span><xsl:value-of select="order/shippingAddress/zipCode" /></span>
										</div>

										<div>
											<label style="display:inline-block;width:140px">Città</label>
											<span><xsl:value-of select="order/shippingAddress/city" /></span>
										</div>

										<div>
											<label style="display:inline-block;width:140px">Provincia</label>
											<span><xsl:value-of select="order/shippingAddress/prv" /></span>
										</div>
									</div>
								</div>

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

				<table border="0" style="width:100%;padding:10px;text-align:left;">
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
								€
								<xsl:value-of select="order/deliveryCost" />
							</td>
						</tr>
						<tr>
							<td colspan="6" class="text-right">
								<strong>Totale</strong>
							</td>
							<td>
								€
								<xsl:value-of select="order/totalCost" />
							</td>
						</tr>

					</tfoot>
					<tbody>
						<xsl:for-each select="order/cart/item">
							<tr>
								<td>
									<img>
										<xsl:attribute name="src">
    								<xsl:value-of select="img" />
    								</xsl:attribute>
									</img>
								</td>
								<td>
									<h5>
										<xsl:value-of select="brand" />
									</h5>
									<h6>
										<xsl:value-of select="description" />
									</h6>
									<h6>
										<xsl:value-of select="number" />
									</h6>
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
									€
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