package per.fjl.elective.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * author: 严晨
 * date: 2021/2/8
 * time: 10:59
 * description: 登录视图对象
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginVO implements Serializable {

	/** 学号 */
	private String card;
	/** 密码 */
	private String password;
	/** 时间（验证码存储在 Redis 中对应的 key） */
	private String now;
	/** 验证码 */
	private String checkCode;
	/** 身份 */
	private String identity;

}
