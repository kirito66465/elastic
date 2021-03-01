package per.fjl.elective.service.impl;

import cn.hutool.core.date.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import per.fjl.elective.service.inter.CheckCodeService;
import per.fjl.elective.util.CheckCodeUtil;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * author: 严晨
 * date: 2021/2/8
 * time: 10:45
 * description: 验证码的 Service 层
 */
@Service
public class CheckCodeServiceImpl implements CheckCodeService {

	@Autowired
	private StringRedisTemplate stringRedisTemplate;

	/**
	 * 获取指定长宽，验证码长度的 Base64 格式验证码图片
	 * @param length    验证码长度
	 * @param width     图片宽度
	 * @param height    图片高度
	 * @return Map<String, String> 存放当前时间、验证码图片
	 */
	@Override
	public Map<String, String> getCheckCode(int length, int width, int height) {
		String checkCode = CheckCodeUtil.getStringRandom(length);
		String now = DateUtil.now();
		stringRedisTemplate.opsForValue().set(now, checkCode, 1, TimeUnit.MINUTES);
		String img = "";
		try {
			img = "data:img/png;base64," + CheckCodeUtil.imageToBase64(width, height, checkCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, String> map = new HashMap<>();
		map.put("now", now);
		map.put("img", img);
		return map;
	}

}
