//package com.example.demo.config;
//
//import com.example.demo.mapper.UserMapper;
//import lombok.RequiredArgsConstructor;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
//import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
//import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer;
//import org.springframework.security.config.annotation.web.configurers.LogoutConfigurer;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.provisioning.InMemoryUserDetailsManager;
//import org.springframework.security.web.SecurityFilterChain;
//
//@Configuration
//@EnableWebSecurity
////@EnableMethodSecurity
////@RequiredArgsConstructor
//public class WebSecurityConfig{
//
//    @Bean
//    public static BCryptPasswordEncoder bCryptPasswordEncoder()
//    {
//        return new BCryptPasswordEncoder();
//    }
//
////    @Bean
////    public WebSecurityCustomizer webSecurityCustomizer()
////    {
////        return (web) -> web.ignoring()
////                .requestMatchers(PathRequest.toStaticResources().atCommonLocations());
////    }
//
//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception
//    {
////        http.csrf(AbstractHttpConfigurer::disable)
////                .authorizeHttpRequests(re -> re
////                        .requestMatchers( "/login", "/signup", "/", "/**")
////                        .permitAll()
////                        .anyRequest()
////                        .authenticated())
////                .formLogin(form ->form
////                        .loginPage("/login")
////                        .defaultSuccessUrl("/", true)
////                        .permitAll())
////                .logout(LogoutConfigurer::permitAll);
//        //
////                .formLogin(page -> page.loginPage("/login")
////                        .defaultSuccessUrl("/", true));
////        http.headers(test -> test.frameOptions(HeadersConfigurer.FrameOptionsConfig::disable));
////        http.csrf(AbstractHttpConfigurer::disable)
////                .authorizeHttpRequests(request -> request
////                        .requestMatchers("/resource/css/**", "resource/css/**", "/login").permitAll());
////        http.formLogin(login -> login
////                .loginPage("/login").defaultSuccessUrl("/", true));
//        http
//                .authorizeHttpRequests(request -> request.requestMatchers("/**").permitAll()
//                        .anyRequest()
//                        .authenticated())
//                .formLogin(form -> form
//                        .usernameParameter("user_id")
//                        .passwordParameter("pwd")
//                        .defaultSuccessUrl("/", true));
//        return http.build();
//    }
//    @Autowired
//    private UserMapper userMapper;
//
//    @Bean
//    public UserDetailsService userDetailsService()
//    {
//        InMemoryUserDetailsManager manager = new InMemoryUserDetailsManager();
////        manager.createUser(User.withUsername("admin").password("0000").build());
//
//
//        return manager;
//    }
//}

//@Configuration
//public class SecurityConfig {
//
//    @Bean
//    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//        http
//                .authorizeRequests(authorizeRequests ->
//                        authorizeRequests
//                                .antMatchers("/", "/home", "/login", "/css/**", "/js/**", "/images/**").permitAll()
//                                .anyRequest().authenticated()
//                )
//                .formLogin(formLogin ->
//                        formLogin
//                                .loginPage("/login")
//                                .permitAll()
//                )
//                .logout(logout ->
//                        logout.permitAll()
//                );
//        return http.build();
//    }
//
//    @Bean
//    public InMemoryUserDetailsManager userDetailsService() {
//        UserDetails user = User.withDefaultPasswordEncoder()
//                .username("user")
//                .password("password")
//                .roles("USER")
//                .build();
//        return new InMemoryUserDetailsManager(user);
//    }
//
//    @Bean
//    public PasswordEncoder passwordEncoder() {
//        return new BCryptPasswordEncoder();
//    }
//}



