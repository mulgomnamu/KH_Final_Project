package kh.com.medi.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class LogAOP {
	
	@Around("within(kh.com.medi.dao.impl.*)")
	public Object loggerAop(ProceedingJoinPoint joinpoint) throws Throwable{
		
		String signatureStr = joinpoint.getSignature().toShortString();
		
		try {
			System.out.println("loggerApp : " + signatureStr  + " 메소드 실행");	// 어떤 메소드가 호출되었는지 확인 가능
			Object obj = joinpoint.proceed();									// 핵심기능 실행(신호 받는 부분)
			return obj;
		} finally {
		}
		
	}

}
