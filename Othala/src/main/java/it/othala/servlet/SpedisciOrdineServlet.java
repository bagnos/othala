package it.othala.servlet;

import it.othala.dto.MailPropertiesDTO;
import it.othala.dto.OrderFullDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.service.factory.OthalaFactory;
import it.othala.service.interfaces.IPaymentService;
import it.othala.web.utils.ConfigurationUtil;
import it.othala.web.utils.OthalaUtil;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SpedisciOrdineServlet
 */
@WebServlet("/SpedisciOrdineServlet")
public class SpedisciOrdineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SpedisciOrdineServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int idOrder = 0;
		String fgRis = null;
		try {
			idOrder = Integer.valueOf(request.getParameter("idOrder"));
			fgRis = request.getParameter("fgRis");

			if (fgRis == null) {
				OthalaFactory.getOrderServiceInstance().updateStateOrder(idOrder, null, TypeStateOrder.SPEDITO);
				MailPropertiesDTO mail = ConfigurationUtil.getMailProps(request);
				OrderFullDTO order = OthalaFactory.getOrderServiceInstance().getOrders(idOrder, null, null).get(0);
				OthalaFactory.getPaymentServiceInstance().sendMailAcceptedPyament(order, mail, "SPEDITO");
						
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			warning(response, "errore nella spedizione dell'ordine", e);
			return;
		}
		try {
			stampaOrdine(idOrder, response,request);
			return;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			warning(response, "errore nella stampa dell'ordine, provare la ristampa", e);
		}
	}

	private void stampaOrdine(int idOrder, HttpServletResponse response,HttpServletRequest request) throws Exception {
		//File pdfCarrello = OthalaFactory.getOrderServiceInstance().stampaOrdine(idOrder);
		
		String img=ConfigurationUtil.getOrderPrintImageUrl(request);
		String html=OthalaFactory.getOrderServiceInstance().stampaOrdineHTML(idOrder,img);
		
		PrintWriter out = response.getWriter();
		response.setHeader("Expires", "0");
		response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
		response.setHeader("Pragma", "public");
		response.setContentType("text/html;charset=UTF-8");
		out.write(html);

	}

	protected void warning(HttpServletResponse response, String error, Exception e) {
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException exc) {
			// egad - we can't tell the user a thing!
			System.err.println("Othala! IO error " + exc + " trying to tell user about " + error + " " + e);
			return;
		}
		out.println("<H1>Attenzione si è verificato il seguente errore!</h1>");
		out.println("<H3>");
		out.println(error);
		out.println("</H3>");

		/*
		 * if (e != null) { out.print("<P>Exception is: ");
		 * out.println(e.toString()); out.print("Traceback is: ");
		 * out.print("<PRE>"); e.printStackTrace(out); out.print("</PRE>"); }
		 * System.out.print("StampaPDF: "); System.out.println(error); if (e !=
		 * null) { System.out.println(e.toString()); }
		 */
	}
}
