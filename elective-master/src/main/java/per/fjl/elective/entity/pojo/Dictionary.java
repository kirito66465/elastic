package per.fjl.elective.entity.pojo;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Table;
import java.io.Serializable;

/**
 * author: 严晨
 * date: 2021/2/1
 * time: 15:47
 * description: 字典实体类；学院、班级
 */
@Data
@NoArgsConstructor
@Table(name = "t_dict")
public class Dictionary implements Serializable {

	/** 字典 ID */
	private Integer id;
	/** 名称 */
	private String name;
	/** 父节点 ID */
	private Integer parent;
	/** 届数 */
	private String grade;

}
