package per.fjl.elective.handler;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import per.fjl.elective.entity.other.AjaxResult;
import per.fjl.elective.enums.ErrorEnum;
import per.fjl.elective.exception.BusinessException;

/**
 * author: 严晨
 * date: 2021/2/8
 * time: 15:32
 * description: 全局异常处理类
 */
@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

	/**
	 * 处理自定义异常
	 */
	@ExceptionHandler(value = BusinessException.class)
	public AjaxResult bizExceptionHandler(BusinessException e) {
		log.error(e.getMessage(), e);
		return AjaxResult.defineError(e);
	}

	/**
	 * 处理其他异常
	 */
	@ExceptionHandler(value = Exception.class)
	public AjaxResult exceptionHandler( Exception e) {
		log.error(e.getMessage(), e);
		return AjaxResult.otherError(ErrorEnum.INTERNAL_SERVER_ERROR);

	}

}