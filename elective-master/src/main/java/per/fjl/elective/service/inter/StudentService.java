package per.fjl.elective.service.inter;

import per.fjl.elective.entity.pojo.Student;

import java.util.Map;

/**
 * author: kirito
 * date: 2021/2/1
 * time: 19:44
 * description: 学生的 Service 接口层
 */
public interface StudentService {

	/**
	 * 学生注册
	 * @param student   学生实体
	 * @return Map<String, Object>
	 */
	Map<String, Object> register(Student student);

	/**
	 * 学生登录
	 * @param card      学号
	 * @param password  密码
	 * @return Map<String, Object> 存放登录成功与否、token 令牌
	 */
	Map<String, Object> login(String card, String password);

}
