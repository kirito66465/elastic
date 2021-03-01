package per.fjl.elective.service.impl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import per.fjl.elective.entity.pojo.Student;
import per.fjl.elective.mapper.StudentMapper;
import per.fjl.elective.service.inter.StudentService;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * author: kirito
 * date: 2021/2/1
 * time: 19:45
 * description: 学生的 Service 层
 */
@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentMapper studentMapper;

	@Autowired
	private StringRedisTemplate stringRedisTemplate;


	/**
	 * 学生注册
	 * @param student   学生实体
	 * @return Map<String, Object>
	 */
	@Transactional
	@Override
	public Map<String, Object> register(Student student) {
		Map<String, Object> map = new HashMap<>();
		try {
			studentMapper.register(student);

			// 生成唯一令牌token
			String token = UUID.randomUUID().toString();
			if (stringRedisTemplate.hasKey(token)) {
				stringRedisTemplate.delete(token);
			}
			// redis 中以 json 格式存放登录学生信息
			JSONObject json = JSONUtil.parseObj(student, false, true);
			String info = json.toString();
			stringRedisTemplate.opsForValue().set(token, info, 1, TimeUnit.HOURS);
			map.put("token", token);
			map.put("result", true);
		} catch (Exception e) {
			map.put("result", false);
		}
		return map;
	}

	/**
	 * 学生登录
	 * @param card      学号
	 * @param password  密码
	 * @return Map<String, Object> 存放登录成功与否、token 令牌
	 */
	@Override
	public Map<String, Object> login(String card, String password) {
		Map<String, Object> map = new HashMap<>();
		try {
			if (studentMapper.login(card, password) == 1) {
				// 生成唯一令牌token
				String token = UUID.randomUUID().toString();
				if (stringRedisTemplate.hasKey(token)) {
					stringRedisTemplate.delete(token);
				}
				Student student = studentMapper.getStudentByCard(card);
				// redis 中以 json 格式存放登录学生信息
				JSONObject json = JSONUtil.parseObj(student, false, true);
				String info = json.toString();
				stringRedisTemplate.opsForValue().set(token, info, 1, TimeUnit.HOURS);

				// 更新最近登录时间
				String now = DateUtil.now();
				studentMapper.updateLoginTime(card, now);

				map.put("token", token);
				map.put("result", "success");
			} else {
				map.put("result", "fail");
			}
		} catch (Exception e) {
			map.put("result", "transactional");
		}
		return map;
	}

}
