<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/TR/REC-html40" version="1.0">
	<xsl:decimal-format name="euro" decimal-separator="," grouping-separator="."/>
	<xsl:template match="/order">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			</head>
			<body
				style="padding:4px;font-family: Helvetica Neue,Helvetica,Arial,sans-serif;line-height: 1.42857143;font-size:14px;">
				<div style="margin-bottom:30px; margin-top:20px">
					<img>
						<xsl:attribute name="src">
    								<xsl:value-of select="imgLogo" />
    								</xsl:attribute>
					</img>
				</div>

				<div>
					<div>
						<label style="display:inline-block;width:250px">
							<b>Numero Ordine</b>
						</label>
						<xsl:value-of select="number" />
					</div>
					<div>
						<label style="display:inline-block;width:250px">
							<b>Numero Transazione</b>
						</label>
						<xsl:value-of select="transaction" />
					</div>

					<br></br>
				</div>
				<!-- dettaglio ordine -->

				<!-- UTENTE -->
				<div>
					<div>
						<label style="display:inline-block;width:150px">
							<b>Email</b>
						</label>
						<xsl:value-of select="customer/mail" />
					</div>
					<div>
						<label style="display:inline-block;width:150px">
							<b>Nome</b>
						</label>
						<xsl:value-of select="customer/name" />
					</div>
					<div>
						<label style="display:inline-block;width:150px">
							<b>Cognome</b>
						</label>
						<xsl:value-of select="customer/surname" />
					</div>

					<br></br>
				</div>



				<table style="width:100%;padding:10px;text-align:left;font-size:14px;">
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



				<!-- CARRELLO -->
				<h4>CARRELLO</h4>

				<table border="0"
					style="width:100%;text-align:left;border-spacing:10px;font-size:14px;">
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
					<tbody style="vertical-align: top;">
						<xsl:for-each select="cart/item">
							<tr>
								<td colspan="2">

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
							<td colspan="6" class="text-right">Costo Spedizione</td>
							<td>
								<xsl:value-of select="format-number(deliveryCost, '#.###.##0,00' , 'euro')"/>
								
							</td>
						</tr>
						<tr>
							<td colspan="6" class="text-right">
								<strong>Totale</strong>
							</td>
							<td>
								<xsl:value-of select="format-number(totalCost, '#.###.##0,00' , 'euro')"/>
								
							</td>
						</tr>

					</tfoot>
					
				</table>


				<p style="page-break-before: always;font-size:30px">
					<label style="display:inline-block;font-size:40px;">INDIRIZZO DI SPEDIZIONE:</label>
					<br />
					<span style="padding:10px">
						<xsl:value-of select="shippingAddress/name" />
					</span>
					<span style="padding:10px">
						<xsl:value-of select="shippingAddress/surname" />
					</span>

					<br />

					<span style="padding:10px">
						<xsl:value-of select="shippingAddress/street" />
					</span>

					<br />

					<span style="padding:10px">
						<xsl:value-of select="shippingAddress/zipCode" />
					</span>

					<span style="padding:10px">
						<xsl:value-of select="shippingAddress/city" />
					</span>

					<span style="padding:10px">
						<xsl:value-of select="shippingAddress/prov" />
					</span>

					<br />

					<span style="padding:10px">
						<xsl:value-of select="shippingAddress/country" />
					</span>

					<br />
					<br />
					<br />

					<label style="display:inline-block;padding:10px">Telefono</label>
					<span style="padding:10px">
						<xsl:value-of select="shippingAddress/tel" />
					</span>

				</p>



			</body>
			<script>
				window.print();
			</script>

		</html>
	</xsl:template>
</xsl:stylesheet>