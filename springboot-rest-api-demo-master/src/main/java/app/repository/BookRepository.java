package app.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.repository.CrudRepository;

import app.model.Book;



public interface BookRepository extends  CrudRepository<Book, String>{

	Book findOne(long l);

	Object findByRole(String string);

}
