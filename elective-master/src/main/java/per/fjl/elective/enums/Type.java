package per.fjl.elective.enums;

/**
 * author: 严晨
 * date: 2021/2/1
 * time: 15:58
 * description: 课程类型枚举
 */
public enum Type {

	/** 专业课 */
	PROFESSIONAL(1, "专业课"),
	/** 通识课 */
	GENERAL(2, "通识课"),
	/** 体育课 */
	PHYSICAL(3, "体育课");

	private Integer code;
	private String name;

	private Type(Integer code, String name) {
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
