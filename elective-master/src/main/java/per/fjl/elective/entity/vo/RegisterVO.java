package per.fjl.elective.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * author: 严晨
 * date: 2021/2/9
 * time: 10:35
 * description: 注册视图对象
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RegisterVO implements Serializable {

	/** 学号 */
	private String card;
	/** 密码 */
	private String password;
	/** 姓名 */
	private String name;
	/** 学院 ID */
	private Integer collegeId;
	/** 班级 ID */
	private Integer classId;
	/** 时间 */
	private String now;

}
