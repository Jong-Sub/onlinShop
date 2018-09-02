package jdbc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import VO.KakaoClient;

@Repository
public class ClientRowMapper implements RowMapper {
	@Override
	public KakaoClient mapRow(ResultSet rs, int rowNum) throws SQLException {
		Long empno = rs.getLong("cli_no");
		String ename = rs.getString("cli_name");
		return new KakaoClient(empno, ename);
   }
}