package per.fjl.elective.service.inter;

import java.util.Map;

/**
 * author: 严晨
 * date: 2021/2/8
 * time: 10:43
 * description: 验证码的 Service 接口层
 */
public interface CheckCodeService {

	/**
	 * 获取指定长宽，验证码长度的 Base64 格式验证码图片
	 * @param length    验证码长度
	 * @param width     图片宽度
	 * @param height    图片高度
	 * @return Map<String, String> 存放当前时间、验证码图片
	 */
	Map<String, String> getCheckCode(int length, int width, int height);

}
