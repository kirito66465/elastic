package per.fjl.elective.enums;

/**
 * author: 严晨
 * date: 2021/2/1
 * time: 15:53
 * description: 选课状态枚举
 */
public enum Status {

	/** 该选课记录有效，即成功选上该课程 */
	SUCCESS(1, "选上"),
	/** 该选课记录无效，已被废弃(学期不对应/退选) */
	FAIL(0, "废弃");

	private Integer status;
	private String msg;

	private Status(Integer status, String msg) {
		this.status = status;
		this.msg = msg;
	}

	public Integer getStatus() {
		return this.status;
	}

	public String getMsg() {
		return this.msg;
	}

}
