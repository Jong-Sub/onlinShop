package jdbc.repository;

import java.util.List;
import VO.KakaoClient;

public interface ClientRepository {
    List<KakaoClient> findAll();
    KakaoClient findOne(Long cli_no);
    KakaoClient save(KakaoClient cli);
    void delete(Long cli_no);      
}