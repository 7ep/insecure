package asc;


public class Product {
	private int productId;
	private String name,shortDescription,longDescription,imageFile;
	private int available;
	
	public Product(int  productId, String name, String shortDescription, String longDescription, String imageFile, int available) {
		this.productId = productId;
		this.name = name;
		this.shortDescription = shortDescription;
		this.longDescription = longDescription;
		this.imageFile = imageFile;
		this.available = available;
	}

	public int getAvailable() {
		return available;
	}
	public String getImageFile() {
		return imageFile;
	}
	public String getLongDescription() {
		return longDescription;
	}
	public String getName() {
		return name;
	}
	public int getProductId() {
		return productId;
	}
	public String getShortDescription() {
		return shortDescription;
	}

	
}
