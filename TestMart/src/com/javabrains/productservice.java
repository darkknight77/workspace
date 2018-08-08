package com.javabrains;

import java.util.ArrayList;
import java.util.List;

public class productservice {
public List<String> booklist=new ArrayList<>();
public List<String> musiclist=new ArrayList<>();
public List<String> movieslist=new ArrayList<>();
	
public productservice() {
	// TODO Auto-generated constructor stub
	booklist.add("book1");
	booklist.add("book2");
	booklist.add("book3");
 
	musiclist.add("music1");
	musiclist.add("music2");
	musiclist.add("music3");
 
	movieslist.add("movies1");
	movieslist.add("movies2");
	movieslist.add("movies3");

}


public  List<String> getproductscategory()
	{
		List<String> categories=new ArrayList<>();
		categories.add("Books");
		categories.add("Music");
		categories.add("Movies");
		 return categories;
	}
	
	
	
public List<String> getProduct(String category)
{
	switch(category.toLowerCase())
	{
	case "books": return booklist;
	case "music": return musiclist;
	case "movies": return movieslist;
	
	
	}

return null;
}	
	

public boolean add(String category,String product)
{
	switch(category.toLowerCase())
	{
	case "books":
	    	booklist.add(product);
            break; 	
 	case "music": 
 		    musiclist.add(product);
            break;
    case "movies":
    	    movieslist.add(product);
            break;
	
	default : 
		return false;
	}

	return true;
}


	
}
