package com.ck.cloud.config.basic;

import java.util.TimeZone;

import com.ck.cloud.config.basic.security.xss.JsonHtmlXssTrimSerializer;
import org.springframework.boot.autoconfigure.jackson.Jackson2ObjectMapperBuilderCustomizer;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;

/**
 * Jackson 配置
 */
@Configuration
public class JacksonConfiguration implements Jackson2ObjectMapperBuilderCustomizer {
    @Override
    public void customize(Jackson2ObjectMapperBuilder jacksonObjectMapperBuilder) {
        // 防 XSS 脚本注入
        jacksonObjectMapperBuilder.deserializers(new JsonHtmlXssTrimSerializer());
        // 默认时区配置
        jacksonObjectMapperBuilder.timeZone(TimeZone.getDefault());
    }
}
