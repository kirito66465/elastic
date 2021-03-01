package per.fjl.elective.service.impl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import per.fjl.elective.entity.pojo.Teacher;
import per.fjl.elective.mapper.TeacherMapper;
import per.fjl.elective.service.inter.TeacherService;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * author: 严晨
 * date: 2021/2/8
 * time: 13:53
 * description: 老师的 Service 层
 */
@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	private TeacherMapper teacherMapper;

	@Autowired
	private StringRedisTemplate stringRedisTemplate;

	/**
	 * 老师登录
	 * @param card      学号
	 * @param password  密码
	 * @return Map<String, Object> 存放登录成功与否、token 令牌
	 */
	@Transactional
	@Override
	public Map<String, Object> login(String card, String password) {
		Map<String, Object> map = new HashMap<>();
		try {
			if (teacherMapper.login(card, password) == 1) {
				// 生成唯一令牌token
				String token = UUID.randomUUID().toString();
				if (stringRedisTemplate.hasKey(token)) {
					stringRedisTemplate.delete(token);
				}
				Teacher teacher = teacherMapper.getTeacherByCard(card);
				// redis 中以 json 格式存放登录老师信息
				JSONObject json = JSONUtil.parseObj(teacher, false, true);
				String info = json.toString();
				stringRedisTemplate.opsForValue().set(token, info, 1, TimeUnit.HOURS);

				// 更新最近登录时间
				String now = DateUtil.now();
				teacherMapper.updateLoginTime(card, now);

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
