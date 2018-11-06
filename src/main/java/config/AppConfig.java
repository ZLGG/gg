package config;

import controller.LoginInterceptor;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

/**
 * @Description DispatcherServlet配置类
 * @Author LaiYu
 * @Date 2018/10/31 15:11
 */

@EnableWebMvc //相当于<mvc：annotation-driven/>
@Configuration
@ComponentScan("controller")
public class AppConfig implements WebMvcConfigurer {

    /**
     * @Description <mvc:default-servlet-mapping/>
     * @Author LaiYu
     * @Date 2018/10/31 15:13
     * @Param [configurer]
     * @return void
     **/
    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    /**
     * @Description 配置视图解析器
     * @Author LaiYu
     * @Date 2018/10/31 15:15
     * @Param [registry]
     * @return void
     **/
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.jsp("/WEB-INF/pages/",".jsp");
    }

    /**
     * @Description 配置拦截器
     * @Author LaiYu
     * @Date 2018/10/31 15:29
     * @Param [registry]
     * @return void
     **/
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginInterceptor()).excludePathPatterns(
                "/","/invalidLogin","/index","/login");
    }

}
