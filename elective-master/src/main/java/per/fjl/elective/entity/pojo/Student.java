package per.fjl.elective.entity.pojo;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Table;
import java.io.Serializable;

/**
 * author: 严晨
 * date: 2021/2/1
 * time: 15:27
 * description: 学生实体类
 */
@Data
@NoArgsConstructor
@Table(name = "t_stu")
public class Student implements Serializable {

	/** 学号 */
	private String card;
	/** 密码 */
	private String password;
	/** 学院 ID */
	private Integer collegeId;
	/** 班级 ID */
	private Integer classId;
	/** 姓名 */
	private String name;
	/** 最近登录时间 */
	private String loginTime;

}
