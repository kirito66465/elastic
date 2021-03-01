package per.fjl.elective.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import per.fjl.elective.enums.ErrorEnum;
import per.fjl.elective.exception.BusinessException;
import per.fjl.elective.service.inter.CheckCodeService;
import per.fjl.elective.service.inter.StudentService;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * author: kirito
 * date: 2021/2/1
 * time: 19:48
 * description: 学生的 Controller 层
 */
@Controller(value = "/stu")
public class StudentController {

	@Autowired
	private CheckCodeService checkCodeService;

	@Autowired
	private StudentService studentService;

	@Autowired
	private StringRedisTemplate stringRedisTemplate;

	/**
	 * 请求学生首页视图
	 * @param model     模型
	 * @param request   http 请求
	 * @return java.lang.String
	 */
	@RequestMapping(value = "/stu/home")
	public String login(Model model, HttpServletRequest request) {
		// request.getSession();
		String token = (String) request.getSession().getAttribute("token");
		if (token == null) {
			throw new BusinessException(ErrorEnum.NO_AUTH.getErrorCode(), ErrorEnum.NO_AUTH.getErrorMsg());
		} else {
			if (stringRedisTemplate.hasKey(token)) {
				return "stu/home";
			} else {
				// index 页面注入验证码
				Map<String, String> map = checkCodeService.getCheckCode(4, 120, 40);
				String img = map.get("img");
				String now = map.get("now");
				model.addAttribute("img", img);
				model.addAttribute("now", now);
				return "public/index";
			}
		}
	}

}
