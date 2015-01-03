<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/order">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			</head>
<body style="padding:4px;font-family: Helvetica Neue,Helvetica,Arial,sans-serif;line-height: 1.42857143;font-size:14px;">
	<br />
	<div>
		<label style="display:inline-block;width:100%;"><b>1: Inserire la Distinta di 
        Cambio dentro al Pacco</b></label>
	</div>	
	<div>
		<label style="display:inline-block;width:100%;"><b>2: Apporre l'Etichetta di 
        Cambio sul pacco da spedire</b></label>
	</div>
	<div>
		<label style="display:inline-block;width:100%;"><b>3: Spedire il pacco</b></label>
	</div>
	<br />
	<br />
	<br />
	<div>
		<label style="display:inline-block;width:250px;">Tagliare lungo la linea tratteggiata</label>
	</div>
	<div>
		<label style="display:inline-block;width:100%;border-bottom-style:dotted;"></label>
	</div>
	<br />
	<br />
	<br />	
	
	<table style=" border-style:solid;border-color:Black;width:100%">
		<tr style="border-top:solid;border-bottom">
			<td style="border-right-style:solid;border-right-color:Black;width:50%">
				<div>
					<label style="display:inline-block;font-size:18px;"> 
						<b>ETICHETTA DI CAMBIO :</b>
					</label>
				</div>
				<br />			
				<div>
					<label style="display:inline-block;"> 
						<b>DA:</b>
					</label>
				</div>
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
				<br />
	
			</td>
			<td style="width:50%">
			    <br/>
				<div>
					<label style="display:inline-block;"> 
						<br/><b>A:</b>
					</label>
				</div>
				<!-- INDIRIZZO MERCHANT -->
				<p style="line-height: 1.42857143;">
				<label style="display:inline-block;width:90px">Nome</label>
				<span>
					<xsl:value-of select="merchant/name" />
				</span>
				<br />
                <label style="display:inline-block;width:90px">Indirizzo</label>
				<span>
					<xsl:value-of select="merchant/street" />
				</span>
				<br />

				<label style="display:inline-block;width:90px">Cap</label>
				<span>
					<xsl:value-of select="merchant/zipCode" />
				</span>
				<br />

				<label style="display:inline-block;width:90px">Città</label>
				<span>
					<xsl:value-of select="merchant/city" />
				</span>
				<br />

				<label style="display:inline-block;width:90px">Provincia</label>
				<span>
					<xsl:value-of select="merchant/prov" />
				</span>
				<br />
				<label style="display:inline-block;width:90px">Nazione</label>
				<span>
					<xsl:value-of select="merchant/country" />
				</span>

				</p>
				<br />
				<div>
					<img style="padding-left:200px;">
						<xsl:attribute name="src">
    						<xsl:value-of select="imgLogo" />
    						</xsl:attribute>
					</img>
				</div>						
			</td>
		</tr>

	</table>
	<br />
	<br />
	<br />
	<div>
		<label style="display:inline-block;width:250px;">Tagliare lungo la linea tratteggiata</label>
	</div>
	<div>
		<label style="display:inline-block;width:100%;border-bottom-style:dotted;"></label>
	</div>
	<P style="page-break-before: always"></P>
	<br />	
	<div>
		<label style="display:inline-block;width:250px;"><b>DISTINTA DI CAMBIO :</b></label>
	</div>
	<br />	
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
<h4>ELENCO ARTICOLI DA CAMBIARE</h4>

<table border="0"
	style="width:100%;text-align:left;border-spacing:10px;font-size:14px;">
	<thead>
		<tr>
			<th colspan="2">Articolo</th>
			<th>Colore</th>
			<th>Taglia</th>
			<th>Dettaglio Cambio</th>
			<th>Prezzo</th>
			<th>Prezzo Totale</th>

		</tr>
	</thead>
	<tfoot>

	</tfoot>
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
					<xsl:value-of select="cambio" />
				</td>
				<td>
					<xsl:value-of select="unitPrice" />
				</td>
				<td>
					<xsl:value-of select="price" />
				</td>


			</tr>
		</xsl:for-each>
	</tbody>
</table>

</body>
			<script>
				window.print();
			</script>

		</html>
		
	</xsl:template>
</xsl:stylesheet>