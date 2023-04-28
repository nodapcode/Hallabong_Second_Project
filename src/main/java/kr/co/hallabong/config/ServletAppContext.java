package kr.co.hallabong.config;


import javax.annotation.Resource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.hallabong.bean.CustBean;
import kr.co.hallabong.interceptor.CheckLoginInterceptor;
import kr.co.hallabong.mapper.CategoryMapper;
import kr.co.hallabong.mapper.CustMapper;
import kr.co.hallabong.interceptor.TopMenuInterceptor;

@ComponentScan("kr.co.hallabong.beans") //스캔할 패키지
@ComponentScan("kr.co.hallabong.controller") //스캔할 패키지
@ComponentScan("kr.co.hallabong.dao") //스캔할 패키지
@ComponentScan("kr.co.hallabong.service") //스캔할 패키지
@PropertySource("/WEB-INF/properties/db.properties")
@Configuration
@EnableWebMvc //Controller로 등록되어 있는 클래스 셋팅
public class ServletAppContext implements WebMvcConfigurer {

	@Value("${db.classname}")
	private String db_classname;
	
	@Value("${db.url}")
	private String db_url;
	
	@Value("${db.username}")
	private String db_username;
	
	@Value("${db.password}")
	private String db_password;
	
	
	@Resource(name = "CustBean")
	private CustBean CustBean;
	
	
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		// view 경로와 확장자 셋팅
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// 이미지,영상, 소리 등 정적파일 경로 매핑
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/resources/");
	}
	@Bean
	   public BasicDataSource dataSource() {
	      BasicDataSource source = new BasicDataSource();
	      source.setDriverClassName(db_classname);
	      source.setUrl(db_url);
	      source.setUsername(db_username);
	      source.setPassword(db_password);
	      
	      return source;
	   }
	
	@Bean
	   public SqlSessionFactory factory(BasicDataSource source) throws Exception{
		
	      SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
	      factoryBean.setDataSource(source);
	      
	      SqlSessionFactory factory = factoryBean.getObject();
	      return factory;
	   }   
	
	
	//properties와 충돌되어 오류가 발생 되므로 분리하여 등록
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}
	
	@Bean
	public MapperFactoryBean<CustMapper> getCustMapper(SqlSessionFactory factory) throws Exception{
		MapperFactoryBean<CustMapper> factoryBean = new MapperFactoryBean<CustMapper>(CustMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<CategoryMapper> getCategoryMapper(SqlSessionFactory factory) throws Exception{
		MapperFactoryBean<CategoryMapper> factoryBean = new MapperFactoryBean<CategoryMapper>(CategoryMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	

	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		
		ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();
		res.setBasename("/WEB-INF/properties/error_message");
		
		return res;
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		WebMvcConfigurer.super.addInterceptors(registry);
		//메뉴 , 로그인 세션정보
		TopMenuInterceptor topMenuInterceptor = new TopMenuInterceptor(CustBean);
		InterceptorRegistration reg1 = registry.addInterceptor(topMenuInterceptor);
		reg1.addPathPatterns("/**"); // 모든 요청에 대하여 작동
		
		//로그인 처리
		CheckLoginInterceptor checkLoginInterceptor=new CheckLoginInterceptor(CustBean);
		InterceptorRegistration reg2 = registry.addInterceptor(checkLoginInterceptor);

		reg2.addPathPatterns("/user/modify","/user/logout","/board/*");
		reg2.excludePathPatterns("/board/main");
		
		
	}
	
	
	
}

