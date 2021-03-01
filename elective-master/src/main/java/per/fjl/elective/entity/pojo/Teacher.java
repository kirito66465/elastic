package per.fjl.elective.entity.pojo;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Table;
import java.io.Serializable;

/**
 * author: 严晨
 * date: 2021/2/1
 * time: 15:35
 * description: 老师实体类
 */
@Data
@NoArgsConstructor
@Table(name = "t_tea")
public class Teacher implements Serializable {

	/** 学号 */
	private String card;
	/** 密码 */
	private String password;
	/** 学院 ID */
	private Integer collegeId;
	/** 姓名 */
	private String name;
	/** 最近登录时间 */
	private String loginTime;

}
