package per.fjl.elective.service.inter;

import per.fjl.elective.entity.pojo.Dictionary;

import java.util.List;

/**
 * author: 严晨
 * date: 2021/2/8
 * time: 17:32
 * description: 字典的 Service 接口层
 */
public interface DictionaryService {

	/**
	 * 查询出所有学院信息
	 * @return List<Dictionary>
	 */
	List<Dictionary> listCollege();

	/**
	 * 根据学院 ID 查询出所有下属班级
	 * @param parent    学院 ID
	 * @return List<Dictionary>
	 */
	List<Dictionary> listClassByAll(int parent);

	/**
	 * 根据学院 ID 和届数查询出对应届数的所有下属班级
	 * @param parent    学院 ID
	 * @param grade     届数
	 * @return List<Dictionary>
	 */
	List<Dictionary> listClassByGrade(int parent, String grade);

}
