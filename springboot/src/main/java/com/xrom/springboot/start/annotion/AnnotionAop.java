package com.xrom.springboot.start.annotion;


import com.xrom.springboot.start.domain.Person;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseBody;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;

@Aspect
@Component
public class AnnotionAop {

    @Pointcut("@annotation(com.xrom.springboot.start.annotion.LogAop)")
    public void dataFilteringCut() {

    }

    @Around("dataFilteringCut()")
    public void before(ProceedingJoinPoint joinPoint) throws Throwable {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();
        LogAop logAop = AnnotationUtils.getAnnotation(method, LogAop.class);
        String logType = logAop.logType();
        Person person = (Person) joinPoint.getArgs()[0];
        if ("2".equals(logType)) {
            System.out.println("我是2啊");
        } else {
            System.out.println("我是1啊");
        }
        joinPoint.proceed();
    }
}
