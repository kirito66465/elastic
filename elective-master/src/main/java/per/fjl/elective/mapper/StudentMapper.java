package per.fjl.elective.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import per.fjl.elective.entity.pojo.Student;

/**
 * author: 严晨
 * date: 2021/2/1
 * time: 16:08
 * description: 学生的 Mapper 层
 */
@Repository
public interface StudentMapper {

	/**
	 * 学生注册
	 * @param student   学生实体类
	 * @return java.lang.Integer
	 */
	Integer register(Student student);

	/**
	 * 学生登录
	 * @param card      学号
	 * @param password  密码
	 * @return java.lang.Integer
	 */
	Integer login(@Param("card") String card, @Param("password") String password);

	/**
	 * 根据学号查询该学生信息
	 * @param card  学号
	 * @return per.fjl.elective.entity.pojo.Student
	 */
	Student getStudentByCard(@Param("card") String card);

	/**
	 * 修改密码
	 * @param card      学号
	 * @param oldPwd    原密码
	 * @param newPwd    新密码
	 * @return java.lang.Integer
	 */
	Integer updatePwd(@Param("card") String card, @Param("oldPwd") String oldPwd, @Param("newPwd") String newPwd);

	/**
	 * 更新最近登录时间
	 * @param card          学号
	 * @param loginTime     最近登录时间
	 * @return java.lang.Integer
	 */
	Integer updateLoginTime(@Param("card") String card, @Param("loginTime") String loginTime);

}
