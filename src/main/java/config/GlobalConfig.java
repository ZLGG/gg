package config;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.*;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;
import java.io.IOException;

/**
 * @Description Spring父容器的配置
 * @Author LaiYu
 * @Date 2018/10/28 3:50
 */
@Configuration
@ComponentScan(basePackages = "service")
@PropertySource(value = {"classpath:jdbc.properties"})//数据库外部配置
@MapperScan(basePackages = "dao") //spring-mybatis整合注解
public class GlobalConfig {

    @Value("${jdbc.username}")
     private String username;

    @Value("${jdbc.password}")
    private String password;

    @Value("${jdbc.driverClass}")
    private String driverClass;

    @Value("${jdbc.url}")
    private String url;


    @Bean
    public DataSource dataSource123(){
        System.out.println("dataSource创建啦");
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        dataSource.setDriverClassName(driverClass);
        dataSource.setUrl(url);
        System.out.println("dataSource创建完成");
        return dataSource;
    }


    @Bean
    public SqlSessionFactoryBean sqlSessionFactoryBean() throws IOException {
        System.out.println("sqlSessionFactoryBean创建啦");
        SqlSessionFactoryBean sqlSessionFactoryBean= new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource123());
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        sqlSessionFactoryBean.setMapperLocations(resolver.getResources("classpath*:/mapper/*.xml"));

        return sqlSessionFactoryBean;
    }

//    @Bean
//    @Lazy
//    public MapperScannerConfigurer mapperScannerConfigurer(){
//        System.out.println("mapperScannerConfigurer创建案例");
//        MapperScannerConfigurer mapperScannerConfigurer = new MapperScannerConfigurer();
//        mapperScannerConfigurer.setBasePackage("dao");
//        return mapperScannerConfigurer;
//    }

}
