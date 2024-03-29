package com.ck.cloud.crm.provider.command.system.notice.handler;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ck.cloud.crm.provider.command.system.notice.model.NoticeModel;
import com.ck.cloud.crm.provider.command.system.notice.model.NoticeModelFactory;
import com.ck.cloud.crm.common.command.BulkOperationCommand;
import com.ck.cloud.crm.common.pojo.page.PageDTO;
import com.ck.cloud.crm.domain.system.dto.NoticeDTO;
import com.ck.cloud.crm.domain.system.entity.SysNoticeEntity;
import com.ck.cloud.crm.provider.command.system.notice.NoticeAddCommand;
import com.ck.cloud.crm.provider.command.system.notice.NoticeUpdateCommand;
import com.ck.cloud.crm.provider.command.system.notice.query.NoticeQuery;
import com.ck.cloud.crm.provider.command.system.notice.service.SysNoticeService;
import java.util.List;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 公告通知命令侧
 */
@Service
@RequiredArgsConstructor
public class NoticeCommandHandler {

    private final SysNoticeService noticeService;

    private final NoticeModelFactory noticeModelFactory;

    public PageDTO<NoticeDTO> getNoticeList(NoticeQuery query) {
        Page<SysNoticeEntity> page = noticeService.getNoticeList(query.toPage(), query.toQueryWrapper());
        List<NoticeDTO> records = page.getRecords().stream().map(NoticeDTO::new).collect(Collectors.toList());
        return new PageDTO<>(records, page.getTotal());
    }

    public NoticeDTO getNoticeInfo(Long id) {
        NoticeModel noticeModel = noticeModelFactory.loadById(id);
        return new NoticeDTO(noticeModel);
    }

    public void addNotice(NoticeAddCommand addCommand) {
        NoticeModel noticeModel = noticeModelFactory.create();
        noticeModel.loadAddCommand(addCommand);

        noticeModel.checkFields();

        noticeModel.insert();
    }

    public void updateNotice(NoticeUpdateCommand updateCommand) {
        NoticeModel noticeModel = noticeModelFactory.loadById(updateCommand.getNoticeId());
        noticeModel.loadUpdateCommand(updateCommand);

        noticeModel.checkFields();

        noticeModel.updateById();
    }

    public void deleteNotice(BulkOperationCommand<Integer> deleteCommand) {
        noticeService.removeBatchByIds(deleteCommand.getIds());
    }

}
