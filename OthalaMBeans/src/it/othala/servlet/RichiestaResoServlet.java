package it.othala.servlet;

import it.othala.dto.RefoundFullDTO;
import it.othala.enums.TypeStateOrder;
import it.othala.service.factory.OthalaFactory;
import it.othala.util.HelperCrypt;
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

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Servlet implementation class RichiestaResoServlet
 */
@WebServlet("/RichiestaResoServlet")
public class RichiestaResoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static Log log = LogFactory.getLog(RichiestaResoServlet.class);
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RichiestaResoServlet() {
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
		
		try {
			String keyRefund = request.getParameter("keyRefund");
			if (keyRefund != null) {
				
				RefoundFullDTO refundDTO= (RefoundFullDTO) request.getSession().getAttribute(keyRefund);
				
				//inserire html per stampa reso
				String html="";
				if (refundDTO.getFgChangeRefound().equalsIgnoreCase("C"))
				{
					html=OthalaFactory.getOrderServiceInstance().stampaCambioHTML(refundDTO.getIdRefound(), ConfigurationUtil.getMailProps(request).getPathImgLogo());
				}
				else
				{
					html=OthalaFactory.getOrderServiceInstance().stampaResoHTML(refundDTO.getIdRefound(), ConfigurationUtil.getMailProps(request).getPathImgLogo());
				}
				PrintWriter out = response.getWriter();
				response.setHeader("Expires", "0");
				response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
				response.setHeader("Pragma", "public");
				response.setContentType("text/html;charset=UTF-8");
				out.write(html);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			warning(response, "errore nella spedizione dell'ordine", e);
			return;
		}
		
	}

	
	protected void warning(HttpServletResponse response, String error, Exception e) {
		OthalaUtil.warning(response, error, e, log);

		/*
		 * if (e != null) { out.print("<P>Exception is: ");
		 * out.println(e.toString()); out.print("Traceback is: ");
		 * out.print("<PRE>"); e.printStackTrace(out); out.print("</PRE>"); }
		 * System.out.print("StampaPDF: "); System.out.println(error); if (e !=
		 * null) { System.out.println(e.toString()); }
		 */
	}
}
