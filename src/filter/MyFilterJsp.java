package filter;
/**
*@author 胡亚军
*@date2019年9月29日上午9:20:24
*
*/
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class MyFilterJsp implements Filter{
    public void init(FilterConfig config) throws ServletException{} //初始化过滤器
    public void destroy(){}//过滤器的生命周期结束

    public void doFilter(ServletRequest request, ServletResponse response,
    		FilterChain chain) throws IOException, ServletException {
    		HttpServletRequest req = (HttpServletRequest) request;
    		HttpServletResponse resp = (HttpServletResponse) response;
    		String conString = "";
    		conString = req.getHeader("REFERER");//获取父url--如果不是直接输入的话就是先前的访问过来的页面，要是用户输入了，这个父url是不存在的
    		if("".equals(conString) || null==conString){ //判断如果上一个目录为空的话，说明是用户直接输入url访问的
    		String servletPath = req.getServletPath();//当前请求url，去掉几个可以直接访问的页面
    		if(servletPath.contains("index.jsp") || servletPath.contains("administratorLoginPage.jsp")){ //跳过index.jsp和登陆Login.jsp
    		chain.doFilter(request, response);
    		} else {
    			System.out.println(servletPath);
    		resp.sendRedirect("index.jsp");//跳回首页
    		}
    		} else {
    		chain.doFilter(request, response);
    		}
    		}
}