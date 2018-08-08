package com.javabrains;

import java.util.ArrayList;
import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebService;

@WebService
public class ProductCatalog {
	productservice ps= new productservice();
	
	@WebMethod
	public List<String> getProductsCategory()
	{
		List<String> categories=new ArrayList<>();
		return ps.getproductscategory();
	}

	public List<String> getproducts(String category)
	{
		return ps.getProduct(category);
	}
	
	public boolean add(String category,String product)
	{
		return ps.add(category, product);
	}
	
}
