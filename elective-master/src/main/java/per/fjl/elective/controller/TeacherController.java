package per.fjl.elective.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import per.fjl.elective.service.inter.CheckCodeService;
import per.fjl.elective.service.inter.TeacherService;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * author: 严晨
 * date: 2021/2/8
 * time: 16:53
 * description: 老师的 Controller 层
 */
@Controller(value = "/tea")
public class TeacherController {

	@Autowired
	private CheckCodeService checkCodeService;

	@Autowired
	private TeacherService teacherService;

	@Autowired
	private StringRedisTemplate stringRedisTemplate;

	/**
	 * 请求老师首页视图
	 * @param model     模型
	 * @param request   http 请求
	 * @return java.lang.String
	 */
	@RequestMapping(value = "/tea/home")
	public String login(Model model, HttpServletRequest request) {
		String token = (String) request.getSession().getAttribute("token");
		if (stringRedisTemplate.hasKey(token)) {
			return "tea/home";
		} else {
			Map<String, String> map = checkCodeService.getCheckCode(4, 120, 40);
			String img = map.get("img");
			String now = map.get("now");
			model.addAttribute("img", img);
			model.addAttribute("now", now);
			return "public/index";
		}
	}

}
