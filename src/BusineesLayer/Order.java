package BusineesLayer;

import DataLayer.DataLayer;
import com.microsoft.sqlserver.jdbc.SQLServerDataTable;
import com.microsoft.sqlserver.jdbc.SQLServerException;

import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

public class Order {
    private int id;
    private String orderDate;
    private int employeeId;
    private int customerId;
    private int storeId;
    private String note;
    private int typeId;

    private   ArrayList<OrderDetail> orderDetail = new ArrayList<>();


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public static  int AddInvoice(Order order) throws SQLServerException {
        List<Object> list = new ArrayList<>();
        list.add(order.getCustomerId());
        list.add(1);
        list.add(order.getNote());
        list.add(1);
        SQLServerDataTable invoiceDetails = new SQLServerDataTable();
        invoiceDetails.addColumnMetadata("ProductID", Types.INTEGER);
        invoiceDetails.addColumnMetadata("Price", Types.DECIMAL);
        invoiceDetails.addColumnMetadata("Quantity", Types.DECIMAL);

        var orderList = order.getOrderDetail();
        for (OrderDetail detail : orderList) {
            invoiceDetails.addRow(detail.getProductId(), detail.getPrice(), detail.getQuantity());
        }
        list.add(invoiceDetails);
         DataLayer dataLayer = new DataLayer();
       return dataLayer.InsertOrUpdateOrDelete("sp_SubmitOrder",list,6);
    }

    public ArrayList<OrderDetail> getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(ArrayList<OrderDetail> orderDetail) {
        this.orderDetail = orderDetail;
    }

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }
}
