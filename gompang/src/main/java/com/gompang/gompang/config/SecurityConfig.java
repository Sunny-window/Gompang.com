package com.gompang.gompang.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean // method에 붙는 anotation, container에서 method를 사용하여 반환값을 받을 수 있게 됨
    public BCryptPasswordEncoder bCryptPasswordEncoder(){ // 암호화
        return new BCryptPasswordEncoder();
    }

    @Bean 
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests(request -> request
                // .requestMatchers("/","/registForm","/registProc","/loginForm","/login").permitAll()
                // .requestMatchers("/css/**", "/js/**", "/images/**","/sub/**").permitAll()
                .requestMatchers("/members/**").hasAnyRole("ADMIN","MEMBER")
                .requestMatchers("/admin/**").hasRole("ADMIN")
                .anyRequest().permitAll() //.authenticated()
                );
        
        http.formLogin(login -> login
                .loginPage("/login")
                .loginProcessingUrl("/loginProc")
                .defaultSuccessUrl("/", true)
                .permitAll()
                );
        http.csrf(AbstractHttpConfigurer::disable);
        
        return http.build();
    }
}
