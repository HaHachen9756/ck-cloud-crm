package com.ck.cloud.crm.provider.command.system.notice.model;

import com.ck.cloud.crm.common.exception.GlobalException;
import com.ck.cloud.crm.common.exception.error.ErrorCode.Business;
import com.ck.cloud.crm.domain.system.entity.SysNoticeEntity;
import com.ck.cloud.crm.provider.command.system.notice.service.SysNoticeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * 公告通知模型工厂
 */
@Component
@RequiredArgsConstructor
public class NoticeModelFactory {

    private final SysNoticeService noticeService;

    public NoticeModel loadById(Long noticeId) {
        SysNoticeEntity byId = noticeService.getById(noticeId);

        if (byId == null) {
            throw new GlobalException(Business.COMMON_OBJECT_NOT_FOUND, noticeId, "公告通知");
        }

        return new NoticeModel(byId);
    }

    public NoticeModel create() {
        return new NoticeModel();
    }

}
