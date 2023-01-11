package com.xrom.springboot.start.annotion;


import javax.validation.constraints.NotNull;
import java.lang.annotation.*;


@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD})
@Documented
public @interface LogAop {

    @NotNull
    String logType();
}
