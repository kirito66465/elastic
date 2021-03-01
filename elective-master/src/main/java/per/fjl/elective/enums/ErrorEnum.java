package per.fjl.elective.enums;

/**
 * author: 严晨
 * date: 2021/2/8
 * time: 15:30
 * description: 状态码枚举
 */
public enum ErrorEnum {
	// 数据操作错误定义
	SUCCESS(200, "成功"),
	NO_PERMISSION(403,"你没得权限"),
	NO_AUTH(401,"未登录"),
	NOT_FOUND(404, "未找到该资源!"),
	INTERNAL_SERVER_ERROR(500, "服务器异常请联系管理员"),
	NONE_CHECK_CODE(501, "没有存储验证码，服务器错误！"),
	;

	/** 错误码 */
	private Integer errorCode;

	/** 错误信息 */
	private String errorMsg;

	ErrorEnum(Integer errorCode, String errorMsg) {
		this.errorCode = errorCode;
		this.errorMsg = errorMsg;
	}

	public Integer getErrorCode() {
		return errorCode;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

}
