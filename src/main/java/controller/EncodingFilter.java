package controller;

import org.springframework.web.filter.CharacterEncodingFilter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Description 继承spring中过滤器，使用servlet3.0注解配置
 * @Author LaiYu
 * @Date 2018/10/31 16:26
 */

@WebFilter(urlPatterns = "/*")
public class EncodingFilter extends CharacterEncodingFilter{

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        System.out.println("===过滤器作用啦");
        super.doFilterInternal(request, response, filterChain);
    }
}
