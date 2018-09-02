package jdbc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import VO.KakaoClient;

@Repository
@Transactional(readOnly=true)
public class ClientRepositoryImpl implements ClientRepository{
	private SimpleJdbcInsert jdbcInsert;
    private JdbcTemplate jdbcTemplate;

    @Autowired
	RowMapper<KakaoClient> clientRowMapper;
	
    @Autowired
    public void setDataSource(DataSource dataSource) {
    	this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<KakaoClient> findAll() {
    	List<KakaoClient> clients = jdbcTemplate.query("select cli_no, cli_name from kshop_client",clientRowMapper);
    	return clients;
    }

    @Override
	public KakaoClient findOne(Long cli_no) {
    	return (KakaoClient)jdbcTemplate.queryForObject("select cli_no, cli_name from kshop_client where cli_no = ?", clientRowMapper, cli_no);
    }

    @Override
    @Transactional(readOnly=false)
    public KakaoClient save(KakaoClient client) {
    	SqlParameterSource param = new BeanPropertySqlParameterSource(client);
    	if (client.getCliNo() == null) {
    		Number key = jdbcInsert.executeAndReturnKey(param);
    		client.setCliNo(key.longValue());                   
    	}
    	else {
    		this.jdbcTemplate.update("insert into kshop_client (cli_no, cli_name) values (?, ?)", client.getCliNo(), client.getCliName());
    	}
    	return client;               
    }

    @Override
    @Transactional(readOnly=false)
    public void delete(Long cli_no) {
    	this.jdbcTemplate.update("delete from kshop_client where cli_no = ?", cli_no);
    }

    //생성자가 실행된 후에 실행
    @PostConstruct
    public void init() {
    	//INSERT SQL Auto Create
    	jdbcInsert = new SimpleJdbcInsert(jdbcTemplate).withTableName("kshop_client").usingGeneratedKeyColumns("cli_no");
    }
}