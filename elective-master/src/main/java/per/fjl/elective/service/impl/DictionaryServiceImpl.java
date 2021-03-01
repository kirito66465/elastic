package per.fjl.elective.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import per.fjl.elective.entity.pojo.Dictionary;
import per.fjl.elective.mapper.DictionaryMapper;
import per.fjl.elective.service.inter.DictionaryService;

import java.util.List;

/**
 * author: 严晨
 * date: 2021/2/8
 * time: 17:33
 * description: 字典的 Service 层
 */
@Service
public class DictionaryServiceImpl implements DictionaryService {

	@Autowired
	private DictionaryMapper dictionaryMapper;

	/**
	 * 查询出所有学院信息
	 * @return List<Dictionary>
	 */
	@Override
	public List<Dictionary> listCollege() {
		return dictionaryMapper.listCollege();
	}

	/**
	 * 根据学院 ID 查询出所有下属班级
	 * @param parent    学院 ID
	 * @return List<Dictionary>
	 */
	@Override
	public List<Dictionary> listClassByAll(int parent) {
		return dictionaryMapper.listClassByAll(parent);
	}

	/**
	 * 根据学院 ID 和届数查询出对应届数的所有下属班级
	 * @param parent    学院 ID
	 * @param grade     届数
	 * @return List<Dictionary>
	 */
	@Override
	public List<Dictionary> listClassByGrade(int parent, String grade) {
		return dictionaryMapper.listClassByGrade(parent, grade);
	}
}
