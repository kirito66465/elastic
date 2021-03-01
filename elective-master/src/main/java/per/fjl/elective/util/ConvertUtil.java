package per.fjl.elective.util;

import per.fjl.elective.entity.pojo.Student;
import per.fjl.elective.entity.vo.RegisterVO;
import per.fjl.elective.entity.vo.StudentVO;

/**
 * author: 严晨
 * date: 2021/2/9
 * time: 10:41
 * description: 对象转换工具类
 */
public class ConvertUtil {

	/**
	 * Student 转换为 StudentVO
	 * @param student       学生实体
	 * @param collegeName   学院名称
	 * @param className     班级名称
	 * @return per.fjl.elective.entity.vo.StudentVO
	 */
	public static StudentVO convertStudentToStudentVO(Student student, String collegeName, String className) {
		StudentVO studentVO = new StudentVO();
		studentVO.setCard(student.getCard());
		studentVO.setCollegeName(collegeName);
		studentVO.setClassName(className);
		studentVO.setName(student.getName());
		studentVO.setLoginTime(student.getLoginTime());
		return studentVO;
	}

	/**
	 * RegisterVO 转换为 Student
	 * @param registerVO    注册视图对象
	 * @return per.fjl.elective.entity.pojo.Student
	 */
	public static Student convertRegisterVOToStudent(RegisterVO registerVO) {
		Student student = new Student();
		student.setCard(registerVO.getCard());
		student.setPassword(registerVO.getPassword());
		student.setName(registerVO.getName());
		student.setCollegeId(registerVO.getCollegeId());
		student.setClassId(registerVO.getClassId());
		student.setLoginTime(registerVO.getNow());
		return student;
	}

}
