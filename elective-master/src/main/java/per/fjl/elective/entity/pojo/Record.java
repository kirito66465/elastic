package per.fjl.elective.entity.pojo;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Table;
import java.io.Serializable;

/**
 * author: 严晨
 * date: 2021/2/1
 * time: 15:43
 * description: 选课记录实体类
 */
@Data
@NoArgsConstructor
@Table(name = "t_record")
public class Record implements Serializable {

	/** 选课记录 ID */
	private Integer id;
	/** 学生学号 */
	private String stuId;
	/** 课程 ID */
	private Integer courseId;
	/** 老师学号 */
	private String teaId;
	/** 学生所属学院 ID */
	private Integer collegeId;
	/** 学生所属班级 ID */
	private Integer classId;
	/** 选课时间 */
	private String createTime;
	/** 选课类型 */
	private Integer type;
	/** 选课状态 */
	private Integer status;

}
