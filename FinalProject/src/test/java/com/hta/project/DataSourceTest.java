package com.hta.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class DataSourceTest {

	private static final Logger logger = LoggerFactory.getLogger(DataSourceTest.class);
	
	@Autowired
	private DataSource dataSource;
	
//	@Test
	public void testConnection() {
		try(Connection conn = dataSource.getConnection()){
			logger.info("conn : " + conn);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testQuery() {
		try(Connection conn = dataSource.getConnection()){
			PreparedStatement pstmt = conn.prepareStatement(
					"select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') from dual");
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			logger.info("conn : " + rs.getString(1));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
