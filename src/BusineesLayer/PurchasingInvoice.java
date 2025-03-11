package BusineesLayer;

import DataLayer.DataLayer;
import com.microsoft.sqlserver.jdbc.SQLServerDataTable;
import com.microsoft.sqlserver.jdbc.SQLServerException;

import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

public class PurchasingInvoice {

   private int id;
    private int supplierid;
    private  int storeId;
    private  int employeeId;
    private String purchasingInvoiceDate;
    private  ArrayList<PurchasingInvoiceDetails> details = new ArrayList<>();
    private  String note;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(int supplierid) {
        this.supplierid = supplierid;
    }

    public String getPurchasingInvoiceDate() {
        return purchasingInvoiceDate;
    }

    public void setPurchasingInvoiceDate(String purchasingInvoiceDate) {
        this.purchasingInvoiceDate = purchasingInvoiceDate;
    }

    public ArrayList<PurchasingInvoiceDetails> getDetails() {
        return details;
    }

    public void setDetails(ArrayList<PurchasingInvoiceDetails> details) {
        this.details = details;
    }

    public static int AddInvoice(PurchasingInvoice order) throws SQLServerException {
        if (order == null) {
            throw new IllegalArgumentException("Order cannot be null.");
        }

        List<Object> list = new ArrayList<>();
        list.add(order.getSupplierid());
        list.add(Employee.LoginEmployee.getId());
        list.add(order.getNote());
        list.add(order.getStoreId());

        SQLServerDataTable invoiceDetails = new SQLServerDataTable();
        invoiceDetails.addColumnMetadata("ProductID", Types.INTEGER);
        invoiceDetails.addColumnMetadata("Price", Types.DECIMAL);
        invoiceDetails.addColumnMetadata("Quantity", Types.DECIMAL);

        List<PurchasingInvoiceDetails> orderList = order.getDetails();
        if (orderList.isEmpty()) {
            throw new IllegalArgumentException("Invoice details cannot be empty.");
        }

        for (PurchasingInvoiceDetails detail : orderList) {
            invoiceDetails.addRow(detail.getProductId(), detail.getPrice(), detail.getQuantity());
        }

        list.add(invoiceDetails);


        int[] outputIndexes = {6};
        DataLayer dataLayer = new DataLayer();


        int output = dataLayer.InsertOrUpdateOrDelete("sp_purchaseOrder", list, outputIndexes);

        return output;
    }


    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }
}
