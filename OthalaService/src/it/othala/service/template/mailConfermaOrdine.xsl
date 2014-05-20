<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/TR/REC-html40" version="1.0">
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
					Gentile
					<xsl:value-of select="customer/name" />
					,
					<br />
					<br />
					<xsl:choose>
						<xsl:when test="pending = 'false'">
							il tuo ordine è stato ricevuto ed è in corso di elaborazione.
						</xsl:when>
						<xsl:otherwise>
							il tuo ordine è in verifica presso il sistema PayPal, ti informeremo via
							mail sull' esito del pagamento.
						</xsl:otherwise>
					</xsl:choose>

				</p>

				<!-- nr ordine e transazione -->
				<div>
					<div>
						<label style="display:inline-block;width:150px">
							<b>Numero Ordine</b>
						</label>
						<xsl:value-of select="number" />
					</div>
					<div>
						<label style="display:inline-block;width:150px">
							<b>Numero Transazione</b>
						</label>
						<xsl:value-of select="transaction" />
					</div>

				</div>


				<!-- ringraziamenti -->
				<p>
					<xsl:choose>
						<xsl:when test="pending = 'false'">
							Quando il tuo ordine verrà messo in consegna ti informeremo con
							un'e-mail.
						</xsl:when>
						<xsl:otherwise>
							In caso di pagamento effettuato correttamente ti informeremo con
							un'e-mail al momento della spedizione.
						</xsl:otherwise>
					</xsl:choose>
					<br />
					<br />
					Grazie
					per la tua fiducia.
					<br />
					Ti aspettiamo nei negozi Degortes!
				</p>
				<p>
					<strong>Puoi consultare lo stato del tuo ordine dalla sezione Ordini in Il Mio Account.
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
							Nome
						</th>
						<td>
							<xsl:value-of select="customer/name" />
						</td>
					</tr>
					<tr>
						<th>
							Cognome
						</th>
						<td>
							<xsl:value-of select="customer/surname" />
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
										<xsl:value-of select="billingAddress/name" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Cognome</label>
									<span>
										<xsl:value-of select="billingAddress/surname" />
									</span>
									<br />


									<label style="display:inline-block;width:90px">Telefono</label>

									<xsl:value-of select="billingAddress/telefono" />

									<br />

									<label style="display:inline-block;width:90px">Indirizzo</label>
									<span>
										<xsl:value-of select="billingAddress/street" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Cap</label>
									<span>
										<xsl:value-of select="billingAddress/zipCode" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Città</label>
									<span>
										<xsl:value-of select="billingAddress/city" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Provincia</label>
									<span>
										<xsl:value-of select="billingAddress/prov" />
									</span>
									<br />
									<label style="display:inline-block;width:90px">Nazione</label>
									<span>
										<xsl:value-of select="billingAddress/country" />
									</span>

								</p>

							</td>
							<td>
								<!-- INDIRIZZO FATTURAIZONE -->
								<p style="line-height: 1.42857143;">
									<label style="display:inline-block;width:90px">Nome</label>
									<span>
										<xsl:value-of select="shippingAddress/name" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Cognome</label>
									<span>
										<xsl:value-of select="shippingAddress/surname" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Telefono</label>
									<span>
										<xsl:value-of select="shippingAddress/tel" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Indirizzo</label>
									<span>
										<xsl:value-of select="shippingAddress/street" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Cap</label>
									<span>
										<xsl:value-of select="shippingAddress/zipCode" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Città</label>
									<span>
										<xsl:value-of select="shippingAddress/city" />
									</span>
									<br />

									<label style="display:inline-block;width:90px">Provincia</label>
									<span>
										<xsl:value-of select="shippingAddress/prov" />
									</span>
									<br />
									<label style="display:inline-block;width:90px">Nazione</label>
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
					<h4>METODO DI PAGAMENTO</h4>
					<div>
						<img>

							<xsl:attribute name="src">
    								<xsl:value-of select="imgPayment" />
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
								<xsl:value-of select="deliveryCost" />
							</td>
						</tr>
						<tr>
							<td colspan="6" class="text-right">
								<strong>Totale</strong>
							</td>
							<td>
								&#8364;
								<xsl:value-of select="totalCost" />
							</td>
						</tr>

					</tfoot>
					<tbody style="vertical-align: top;">
						<xsl:for-each select="cart/item">
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