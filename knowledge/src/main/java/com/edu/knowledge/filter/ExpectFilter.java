package com.edu.knowledge.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.edu.knowledge.entities.User;
import com.edu.knowledge.utils.Constant;

@WebFilter(urlPatterns="/expect/*")
public class ExpectFilter implements Filter{

	@Override
	public void destroy() {}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		User user = (User) req.getSession().getAttribute(Constant.CURRENT_USER);
		if(user.getRole().getRoleName().equals(Constant.ROLE_MEMBER)) {
			res.sendRedirect(req.getContextPath() + "/403");
		}
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {}

}
