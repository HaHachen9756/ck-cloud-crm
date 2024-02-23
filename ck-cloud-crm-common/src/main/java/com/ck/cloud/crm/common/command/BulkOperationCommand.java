package com.ck.cloud.crm.common.command;

import cn.hutool.core.collection.CollUtil;
import com.ck.cloud.crm.common.exception.GlobalException;
import com.ck.cloud.crm.common.exception.error.ErrorCode;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import lombok.Data;

/**
 * 命令侧批量处理
 */
@Data
public class BulkOperationCommand<T> {

    public BulkOperationCommand(List<T> idList) {
        if (CollUtil.isEmpty(idList)) {
            throw new GlobalException(ErrorCode.Business.COMMON_BULK_DELETE_IDS_IS_INVALID);
        }
        // 移除重复元素
        this.ids = new HashSet<>(idList);
    }

    private Set<T> ids;

}
