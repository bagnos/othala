package it.othala.servlet;

import it.othala.dto.ProfilePayPalDTO;
import it.othala.payment.paypal.dto.IpnDTO;
import it.othala.payment.paypal.exception.PayPalException;
import it.othala.payment.paypal.exception.PayPalIpnErrorException;
import it.othala.service.factory.OthalaFactory;
import it.othala.web.utils.ConfigurationUtil;
import it.othala.web.utils.PayPalUtil;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Servlet implementation class IpnPayPalServlet
 */
@WebServlet("/IpnPayPalServlet")
public class IpnPayPalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Log log = LogFactory.getLog(IpnPayPalServlet.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IpnPayPalServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		// TODO Auto-generated method stub

		ProfilePayPalDTO prof = PayPalUtil.getProfile(request);
 
		// recupero body orginario
		String originalRequest = getBody(request);
		//String originalRequest = "residence_country=IT&invoice=abc1234&address_city=San+Jose&first_name=John&payer_id=TESTBUYERID01&shipping=3.04&mc_fee=0.44&txn_id=616099981&receiver_email=othalaBusines2_api1.othala.it&quantity=1&custom=1&payment_date=14%3A56%3A44+18+Jun+2014+PDT&address_country_code=US&address_zip=95131&tax=2.02&item_name=something&address_name=John+Smith&last_name=Smith&receiver_id=seller%40paypalsandbox.com&item_number=AK-1234&verify_sign=AFcWxV21C7fd0v3bYYYRCpSSRl31AdjaQWOXh1uA4qBTjfxWKuAn3BGg&address_country=United+States&payment_status=Completed&address_status=unconfirmed&business=seller%40paypalsandbox.com&payer_email=buyer%40paypalsandbox.com¬ify_version=2.1&txn_type=web_accept&test_ipn=1&payer_status=unverified&mc_currency=EUR&mc_gross=1000.00&address_state=CA&mc_gross1=1000&payment_type=echeck&address_street=123%2C+any+street";
		
		try {

			OthalaFactory.getPaymentServiceInstance().processIpnMessage(originalRequest,
				prof,ConfigurationUtil.getMailProps(request));

		} catch (PayPalIpnErrorException | PayPalException e) {
			// TODO Auto-generated catch block
			throw new ServletException(e);
		}

	}
	
	
	public static String getBody(HttpServletRequest request) throws IOException {

		String body = null;
		StringBuilder stringBuilder = new StringBuilder();
		BufferedReader bufferedReader = null;

		try {
			InputStream inputStream = request.getInputStream();
			if (inputStream != null) {
				bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
				char[] charBuffer = new char[128];
				int bytesRead = -1;
				while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
					stringBuilder.append(charBuffer, 0, bytesRead);
				}
			} else {
				stringBuilder.append("");
			}
		} catch (IOException ex) {
			throw ex;
		} finally {
			if (bufferedReader != null) {
				try {
					bufferedReader.close();
				} catch (IOException ex) {
					throw ex;
				}
			}
		}

		body = stringBuilder.toString();
		return body;
	}
}
