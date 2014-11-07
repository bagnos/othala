package it.othala.filter; 

import it.othala.account.model.CustomerLoginBean;
import it.othala.dto.AccountDTO;
import it.othala.web.utils.CookieUtil;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	/*@Inject
	private CustomerLoginBean loginBean;*/

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException,
			ServletException {
		// TODO Auto-generated method stub
		
		HttpServletRequest reqHttp = (HttpServletRequest) req;
		
		HttpSession session = reqHttp.getSession(true);  
	    // Get the bean from the session  
	    CustomerLoginBean loginBean = (CustomerLoginBean)session.getAttribute("customerLoginBean");
	    
	    if (loginBean==null)
	    {
	    	loginBean =new CustomerLoginBean();
	    	session.setAttribute("customerLoginBean", loginBean);
	    }
		
		HttpServletRequest request = (HttpServletRequest) req;
		
		

		if (loginBean.getEmail() == null) {

			AccountDTO acc = CookieUtil.getAccountFromCookie(request);
			if (acc != null) {

				loginBean.updateLoginBean(acc);

			}

		}
		chain.doFilter(req, res);

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
