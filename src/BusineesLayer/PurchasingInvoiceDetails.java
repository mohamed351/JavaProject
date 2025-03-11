package BusineesLayer;

public class PurchasingInvoiceDetails {
    private int id;
    private int purchaseorderId;
    private int productId;
    private double quantity;
    private double price;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPurchaseorderId() {
        return purchaseorderId;
    }

    public void setPurchaseorderId(int purchaseorderId) {
        this.purchaseorderId = purchaseorderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
