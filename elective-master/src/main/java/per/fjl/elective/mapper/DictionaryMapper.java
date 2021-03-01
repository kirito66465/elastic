package per.fjl.elective.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import per.fjl.elective.entity.pojo.Dictionary;

import java.util.List;

/**
 * author: 严晨
 * date: 2021/2/8
 * time: 17:22
 * description: 字典的 Mapper 层
 */
@Repository
public interface DictionaryMapper {

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
	List<Dictionary> listClassByAll(@Param("parent") int parent);

	/**
	 * 根据学院 ID 和届数查询出对应届数的所有下属班级
	 * @param parent    学院 ID
	 * @param grade     届数
	 * @return List<Dictionary>
	 */
	List<Dictionary> listClassByGrade(@Param("parent") int parent, @Param("grade") String grade);

}
