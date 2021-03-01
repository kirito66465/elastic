package per.fjl.elective.exception;

/**
 * author: 严晨
 * date: 2021/2/8
 * time: 15:28
 * description: 自定义异常封装类
 */
public class BusinessException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	/**
	 * 错误状态码
	 */
	protected Integer errorCode;

	/**
	 * 错误提示
	 */
	protected String errorMsg;

	public BusinessException() { }

	public BusinessException(Integer errorCode, String errorMsg) {
		this.errorCode = errorCode;
		this.errorMsg = errorMsg;
	}

	public Integer getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(Integer errorCode) {
		this.errorCode = errorCode;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

}