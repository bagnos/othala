package it.othala.web.utils;

import it.othala.dto.AccountDTO;
import it.othala.util.HelperCrypt;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {
	private static String getCookieValue(HttpServletRequest request, String name) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (name.equals(cookie.getName())) {
					return cookie.getValue();
				}
			}
		}
		return null;
	}

	private static void addCookie(HttpServletResponse response, String name, String value, int maxAge) {
		Cookie cookie = new Cookie(name, value);
		cookie.setPath("/");
		cookie.setMaxAge(maxAge);
		response.addCookie(cookie);
	}

	private static void removeCookie(HttpServletResponse response, String name) {
		addCookie(response, name, null, 0);
	}

	public static String getCookieValueFromAccount(AccountDTO acc) {
		return HelperCrypt.encrypt(acc.getEmail() + ";" + acc.getName() + ";" + acc.getSurname());
	}

	public static AccountDTO getAccountFromCookie(HttpServletRequest request) {

		String cookieName = ConfigurationUtil.getProperty("COOKIE_NAME");
		String cookieValue = CookieUtil.getCookieValue(request, cookieName);
		if (cookieValue != null) {

			String decryptValue = HelperCrypt.decrypt(cookieValue);
			String[] values = decryptValue.split(";");
			AccountDTO acc = new AccountDTO();
			acc.setEmail(values[0]);
			acc.setName(values[1]);
			acc.setSurname(values[2]);
			return acc;
		} else {
			return null;
		}

	}

	public static void addCookieLogin(HttpServletResponse response, AccountDTO acc) {

		String cookieName = ConfigurationUtil.getProperty("COOKIE_NAME").trim();
		int cookieAge = Integer.valueOf(ConfigurationUtil.getProperty("COOKIE_AGE").trim());

		CookieUtil.addCookie(response, cookieName, CookieUtil.getCookieValueFromAccount(acc), cookieAge);

	}

	public static void removeCookieLogin(HttpServletResponse response) {

		String cookieName = ConfigurationUtil.getProperty("COOKIE_NAME").trim();
		removeCookie(response, cookieName);

	}
}
