package per.fjl.elective.entity.pojo;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Table;
import java.io.Serializable;

/**
 * author: 严晨
 * date: 2021/2/1
 * time: 15:37
 * description: 课程实体类
 */
@Data
@NoArgsConstructor
@Table(name = "t_course")
public class Course implements Serializable {

	/** 课程 ID */
	private Integer id;
	/** 课程类型 */
	private Integer type;
	/** 课程名称 */
	private String name;
	/** 开课老师学号 */
	private String teaId;
	/** 课程学分 */
	private Integer credit;
	/** 起始周 */
	private Integer start;
	/** 结束周 */
	private Integer end;
	/** 开课学期 */
	private Integer semester;
	/** 开课年级 */
	private Integer grade;
	/** 开课学院 ID */
	private Integer collegeId;
	/** 限定人数 */
	private Integer limitNum;
	/** 已选人数 */
	private Integer chosen;

}
