package config;

import dao.UserMapper;
import entity.User;
import entity.UserExample;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.sql.SQLException;
import java.util.List;

/**
 * @Description 测试IOC
 * @Author LaiYu
 * @Date 2018/10/28 4:15
 */
public class test {
    public static void main(String[] args) throws SQLException {
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(GlobalConfig.class);
        for(String s: context.getBeanDefinitionNames()){
            System.out.println(s);
        }
    }
}
