package per.fjl.elective.service.inter;

import java.util.Map;

/**
 * author: 严晨
 * date: 2021/2/8
 * time: 13:46
 * description: 老师的 Service 接口层
 */
public interface TeacherService {

	/**
	 * 老师登录
	 * @param card      学号
	 * @param password  密码
	 * @return Map<String, Object> 存放登录成功与否、token 令牌
	 */
	Map<String, Object> login(String card, String password);

}
