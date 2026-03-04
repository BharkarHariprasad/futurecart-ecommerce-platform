package com.futurecart.model;

public class Product {
	int productId;
	int categoryId;
	int brandId;
    String name;
    String category;   
    String brand;
    String description;
    double price;
    String imageUrl;
    String featuredProduct;
    
    public Product() {
    	
    }

	public Product(int productId, int categoryId, int brandId, String name, String category, String brand, String description, double price,
			String imageUrl, String featuredProduct) {
		this.productId = productId;
		this.categoryId = categoryId;
		this.name = name;
		this.category = category;
		this.brand = brand;
		this.description = description;
		this.price = price;
		this.imageUrl = imageUrl;
		this.brandId = brandId;
		this.featuredProduct = featuredProduct;
	}

	public String getFeaturedProduct() {
		return featuredProduct;
	}

	public void setFeaturedProduct(String featuredProduct) {
		this.featuredProduct = featuredProduct;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getBrandId() {
		return brandId;
	}

	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
    
    
}
