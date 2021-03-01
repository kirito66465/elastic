package per.fjl.elective.entity.other;

import per.fjl.elective.enums.ErrorEnum;
import per.fjl.elective.exception.BusinessException;

/**
 * author: 严晨
 * date: 2021/2/8
 * time: 15:25
 * description: 封装的返回结果类
 */
public class AjaxResult {

	/** 是否成功 */
	private Boolean success;
	/** 状态码 */
	private Integer code;
	/** 提示信息 */
	private String msg;
	/** 数据 */
	private Object data;

	public AjaxResult() { }

	/**
	 * 自定义返回结果的构造方法
	 * @param success   是否成功
	 * @param code      状态码
	 * @param msg       消息
	 * @param data      数据
	 */
	public AjaxResult(Boolean success, Integer code, String msg, Object data) {
		this.success = success;
		this.code = code;
		this.msg = msg;
		this.data = data;
	}

	/**
	 * 自定义异常返回的结果
	 * @param de    异常
	 * @return per.fjl.elective.entity.other.AjaxResult
	 */
	public static AjaxResult defineError(BusinessException de) {
		AjaxResult result = new AjaxResult();
		result.setSuccess(false);
		result.setCode(de.getErrorCode());
		result.setMsg(de.getErrorMsg());
		result.setData(null);
		return result;
	}

	/**
	 * 其他异常处理方法返回的结果
	 * @param errorEnum 错误枚举
	 * @return per.fjl.elective.entity.other.AjaxResult
	 */
	public static AjaxResult otherError(ErrorEnum errorEnum) {
		AjaxResult result = new AjaxResult();
		result.setMsg(errorEnum.getErrorMsg());
		result.setCode(errorEnum.getErrorCode());
		result.setSuccess(false);
		result.setData(null);
		return result;
	}

	public Boolean getSuccess() {
		return success;
	}

	public void setSuccess(Boolean success) {
		this.success = success;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

}