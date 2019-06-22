package com.example.framework.db.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.example.framework.db.config.DBProperty;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;

/**
 * @author 夏之阳
 * 创建时间：2016-03-14 15:04
 * 创建说明：数据库配置
 */

@Configuration
@MapperScan(basePackages = "com.example.platform.repository.mapper")
public class DBConfig {
    @Autowired
    private DBProperty dbProperty;

    /**
     * 配置数据源
     * @return 数据源的bean
     */
    @Bean
    public DataSource dataSource(){
        DruidDataSource dataSource=new DruidDataSource();
        dataSource.setUrl(dbProperty.getUrl());
        dataSource.setUsername(dbProperty.getUsername());
        dataSource.setPassword(dbProperty.getPassword());
        dataSource.setDriverClassName(dbProperty.getDriverClassName());
        return dataSource;
    }

    /**
     * 事务管理bean
     * @return 事务管理的bean
     */
    @Bean
    public DataSourceTransactionManager dataSourceTransactionManager(){
        return new DataSourceTransactionManager(dataSource());
    }

    /**
     * MyBatis SqlSession 工厂
     * @return MyBatis SqlSession 工厂
     * @throws Exception MyBatis初始化的时候有可能报错
     */
    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean=new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource());
        return sqlSessionFactoryBean.getObject();
    }
}