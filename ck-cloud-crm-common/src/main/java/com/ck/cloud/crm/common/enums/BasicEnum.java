package com.ck.cloud.crm.common.enums;

/**
 * 普通的枚举接口
 */
public interface BasicEnum<T> {

    /**
     * 获取枚举的值
     *
     * @return 枚举值
     */
    T getValue();

    /**
     * 获取枚举的描述
     *
     * @return 描述
     */
    String description();

}
