package per.fjl.elective;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * author: 严晨
 * date: 2021/02/01
 * time: 15:15
 * description: Spring Boot 项目启动类
 */
@MapperScan(basePackages = "per.fjl.elective.mapper")
@SpringBootApplication(scanBasePackages = "per.fjl.elective")
public class ElectiveApplication {

	public static void main(String[] args) {
		SpringApplication.run(ElectiveApplication.class, args);
	}

}
