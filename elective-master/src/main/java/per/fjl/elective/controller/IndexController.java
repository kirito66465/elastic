package per.fjl.elective.controller;

import cn.hutool.core.date.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import per.fjl.elective.entity.pojo.Dictionary;
import per.fjl.elective.entity.pojo.Student;
import per.fjl.elective.entity.vo.LoginVO;
import per.fjl.elective.entity.vo.RegisterVO;
import per.fjl.elective.enums.ErrorEnum;
import per.fjl.elective.exception.BusinessException;
import per.fjl.elective.service.inter.CheckCodeService;
import per.fjl.elective.service.inter.DictionaryService;
import per.fjl.elective.service.inter.StudentService;
import per.fjl.elective.service.inter.TeacherService;
import per.fjl.elective.util.ConvertUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * author: 严晨
 * date: 2021/2/1
 * time: 16:41
 * description:
 */
@Controller
public class IndexController {

	@Autowired
	private CheckCodeService checkCodeService;

	@Autowired
	private StringRedisTemplate stringRedisTemplate;

	@Autowired
	private StudentService studentService;

	@Autowired
	private TeacherService teacherService;

	@Autowired
	private DictionaryService dictionaryService;

	/**
	 * 请求 index 视图
	 * @return java.lang.String
	 */
	@RequestMapping(value = {"/index", ""})
	public String index(Model model) {
		Map<String, String> map = checkCodeService.getCheckCode(4, 120, 40);
		String img = map.get("img");
		String now = map.get("now");
		model.addAttribute("img", img);
		model.addAttribute("now", now);
		return "public/index";
	}

	/**
	 * 登录请求
	 * @param loginVO   登录视图对象
	 * @param request   http 请求
	 * @return java.lang.String
	 */
	@ResponseBody
	@RequestMapping(value = "/login")
	public String login(LoginVO loginVO, HttpServletRequest request) {
		System.out.println(loginVO.toString());
		String now = loginVO.getNow();
		if (!stringRedisTemplate.hasKey(now)) {
			throw new BusinessException(ErrorEnum.NONE_CHECK_CODE.getErrorCode(), ErrorEnum.NONE_CHECK_CODE.getErrorMsg());
		}
		String inputCode = loginVO.getCheckCode();
		String code = stringRedisTemplate.opsForValue().get(now);
		if (!inputCode.equals(code)) {
			return "验证码输入错误！";
		}
		String identity = loginVO.getIdentity();
		Map<String, Object> map = new HashMap<>();
		if ("stu".equals(identity)) {
			map = studentService.login(loginVO.getCard(), loginVO.getPassword());
		} else if ("tea".equals(identity)) {
			map = teacherService.login(loginVO.getCard(), loginVO.getPassword());
		}
		String isLogin = (String) map.get("result");
		String token = (String) map.get("token");
		if ("success".equals(isLogin)) {
			request.getSession().setAttribute("token", token);
			return token;
		} else if ("fail".equals(isLogin)) {
			return "fail";
		} else {
			return "transactional";
		}
	}

	/**
	 * 请求验证码
	 * @param model 模型
	 * @return java.lang.Object
	 */
	@ResponseBody
	@RequestMapping(value = "/getCodeImg")
	public Object getCodeImg(Model model) {
		Map<String, String> map = checkCodeService.getCheckCode(4, 120, 40);
		String img = map.get("img");
		String now = map.get("now");
		model.addAttribute("img", img);
		model.addAttribute("now", now);
		return map;
	}

	/**
	 * 请求注册视图
	 * @param model 模型
	 * @return java.lang.String
	 */
	@RequestMapping(value = "/register-input")
	public String registerInput(Model model) {
		String now = DateUtil.now();
		model.addAttribute("now", now);
		organizationDictionary(model);
		return "public/register";
	}

	/**
	 * 组织字典中的学院数据
	 * @param model 模型
	 */
	public void organizationDictionary(Model model) {
		List<Dictionary> collegeList = dictionaryService.listCollege();
		model.addAttribute("collegeList", collegeList);
	}

	/**
	 * 请求班级数据
	 * @param collegeId 学院 ID
	 * @return java.lang.Object
	 **/
	@ResponseBody
	@RequestMapping(value = "/getClassList")
	public Object getClassList(@RequestParam(value = "collegeId") String collegeId) {
		List<Dictionary> classList = dictionaryService.listClassByAll(Integer.parseInt(collegeId));
		return classList;
	}

	/**
	 * 学生注册
	 * @param registerVO    注册视图对象
	 * @param request       http 请求
	 * @return java.lang.String
	 **/
	@ResponseBody
	@RequestMapping(value = "/register")
	public String register(RegisterVO registerVO, HttpServletRequest request) {
		Student student = ConvertUtil.convertRegisterVOToStudent(registerVO);
		Map<String, Object> map = studentService.register(student);

		Boolean isRegister = (Boolean) map.get("result");
		String token = (String) map.get("token");
		if (isRegister) {
			request.getSession().setAttribute("token", token);
			return token;
		} else {
			return "transactional";
		}
	}

	/**
	 * 退出
	 * @param request   http 请求
	 * @return java.lang.String
	 **/
	@RequestMapping(value = "/exit")
	public String exit(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String token = (String) session.getAttribute("token");
		// 移除 token
		if (stringRedisTemplate.hasKey(token)) {
			stringRedisTemplate.delete(token);
		}
		session.invalidate();
		// index 页面注入验证码
		Map<String, String> map = checkCodeService.getCheckCode(4, 120, 40);
		String img = map.get("img");
		String now = map.get("now");
		model.addAttribute("img", img);
		model.addAttribute("now", now);
		return "public/index";
	}

}
