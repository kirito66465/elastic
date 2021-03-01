package per.fjl.elective.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import per.fjl.elective.entity.pojo.Student;

import java.io.Serializable;

/**
 * author: 严晨
 * date: 2021/2/8
 * time: 8:50
 * description: 学生视图对象
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudentVO implements Serializable {

	/** 学号 */
	private String card;
	/** 学院名称 */
	private String collegeName;
	/** 班级名称 */
	private String className;
	/** 姓名 */
	private String name;
	/** 最近登录时间 */
	private String loginTime;

}
