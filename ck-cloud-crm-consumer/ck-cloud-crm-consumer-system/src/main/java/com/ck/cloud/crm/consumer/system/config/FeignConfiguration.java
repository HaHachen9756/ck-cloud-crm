package com.ck.cloud.crm.consumer.system.config;

import com.ck.cloud.crm.consumer.system.feign.SysNoticeClient;
import com.ck.cloud.crm.consumer.system.feign.fallback.SysNoticeClientFallback;
import org.springframework.context.annotation.Bean;

public class FeignConfiguration {

    @Bean
    public SysNoticeClient sysNoticeClientFallback() {
        return new SysNoticeClientFallback();
    }

}
