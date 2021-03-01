package per.fjl.elective.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import per.fjl.elective.entity.pojo.Teacher;

/**
 * author: 严晨
 * date: 2021/2/1
 * time: 16:24
 * description: 老师的 Mapper 层
 */
@Repository
public interface TeacherMapper {

	/**
	 * 老师登录
	 * @param card      学号
	 * @param password  密码
	 * @return java.lang.Integer
	 */
	Integer login(@Param("card") String card, @Param("password") String password);

	/**
	 * 根据学号查询该老师信息
	 * @param card  学号
	 * @return per.fjl.elective.entity.pojo.Teacher
	 */
	Teacher getTeacherByCard(@Param("card") String card);

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
