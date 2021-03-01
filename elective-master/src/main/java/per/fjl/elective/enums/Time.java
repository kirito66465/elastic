package per.fjl.elective.enums;

/**
 * author: 严晨
 * date: 2021/2/1
 * time: 16:02
 * description: 学年学期枚举
 */
public enum Time {

	/** 上学期 */
	UPPER(1, "上学期"),
	/** 下学期 */
	LOWER(2, "下学期"),
	/** 大一 */
	FIRST(1, "大一"),
	/** 大二 */
	SECOND(2, "大二"),
	/** 大三 */
	THIRD(3, "大三"),
	/** 大四 */
	FOURTH(4, "大四");

	private Integer code;
	private String name;

	private Time(Integer code, String name) {
		this.code = code;
		this.name = name;
	}

	public Integer getCode() {
		return this.code;
	}

	public String getName() {
		return this.name;
	}

}
