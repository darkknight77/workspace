package app.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import app.model.Book;
import app.repository.BookRepository;

@Component
public class BookCommandLineRunner implements CommandLineRunner {

    private static final Logger log = LoggerFactory
            .getLogger(BookCommandLineRunner.class);

    @Autowired
    private BookRepository repository;

    @Override
    public void run(String... args) {
        // save a couple of customers
        repository.save(new Book("Ranga", "Admin","Jason",50));
        repository.save(new Book("Ravi", "Book","bjbj",87));
        repository.save(new Book("Satish", "Admin","jk",89));
        repository.save(new Book("Raghu", "Book","jhjh",56));

        log.info("-------------------------------");
        log.info("Finding all Books");
        log.info("-------------------------------");
        for (Book Book : repository.findAll()) {
            log.info(Book.toString());
        }

        log.info("-------------------------------");
        log.info("Finding Book with id 1");
        log.info("-------------------------------");
        Book Book = repository.findOne(1L);
        log.info(Book.toString());

        log.info("-------------------------------");
        log.info("Finding all Admins");
        log.info("-------------------------------");
       


    }

}
