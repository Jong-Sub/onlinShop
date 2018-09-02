package DAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import VO.KakaoClient;
import jdbc.repository.ClientRepository;

@SpringBootApplication
public class Jdbc2Application implements CommandLineRunner {
	public static void main(String[] args) {
		SpringApplication.run(Jdbc2Application.class, args);
	}
	
	@Autowired
	ClientRepository clientRepository;

	public void run(String...args) {
		//전체 고객 SELECT
		List<KakaoClient> clients = clientRepository.findAll();             
		for(KakaoClient c : clients) {     
			System.out.println(c);   
		}
		System.out.println("---------------------");                   
		
		//2번 고객 SELECT
		KakaoClient c = clientRepository.findOne(2L);
		System.out.println(c);
		System.out.println("---------------------");                   
		
		//3번 고객 DELETE
		clientRepository.delete(3L);
		clients = clientRepository.findAll();                  
		for(KakaoClient c1 : clients) {    
			System.out.println(c1);  
		}
		System.out.println("---------------------");                   

		//4번 고객 INSERT
		c = clientRepository.save(new KakaoClient(4L, "4길동"));
		clients = clientRepository.findAll();                  
		for(KakaoClient c1 : clients) {    
			System.out.println(c1);  
		}                   
		System.out.println("---------------------");                   

		//'5길동' 고객 INSERT
		KakaoClient c5 = new KakaoClient("5길동");
		c = clientRepository.save(c5);             
		clients = clientRepository.findAll();                  
		for(KakaoClient c1 : clients) {    
			System.out.println(c1);  
		}                   
	}
}

