package com.ck.cloud.crm.provider.command.system.notice.model;

import cn.hutool.core.bean.BeanUtil;
import com.ck.cloud.crm.common.enums.BasicEnumUtil;
import com.ck.cloud.crm.common.enums.common.NoticeTypeEnum;
import com.ck.cloud.crm.common.enums.common.StatusEnum;
import com.ck.cloud.crm.domain.system.entity.SysNoticeEntity;
import com.ck.cloud.crm.provider.command.system.notice.NoticeAddCommand;
import com.ck.cloud.crm.provider.command.system.notice.NoticeUpdateCommand;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 公告通知
 */
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
public class NoticeModel extends SysNoticeEntity {

    public NoticeModel(SysNoticeEntity entity) {
        if (entity != null) {
            BeanUtil.copyProperties(entity, this);
        }
    }

    public void loadAddCommand(NoticeAddCommand command) {
        if (command != null) {
            BeanUtil.copyProperties(command, this, "noticeId");
        }
    }

    public void loadUpdateCommand(NoticeUpdateCommand command) {
        if (command != null) {
            loadAddCommand(command);
        }
    }

    public void checkFields() {
        BasicEnumUtil.fromValue(NoticeTypeEnum.class, getNoticeType());
        BasicEnumUtil.fromValue(StatusEnum.class, getStatus());
    }

}
