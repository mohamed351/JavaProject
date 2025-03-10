package BusineesLayer;

import DataLayer.DataLayer;

import javax.swing.table.DefaultTableModel;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class Supplier {
    private  int Id;

    private  String name;

    private  String phoneNumber;

    private  String address;

    public Supplier(){

    }
    public Supplier(int Id, String name, String phoneNumber, String address){
        this.Id = Id;
        this.name = name;
        this.phoneNumber =phoneNumber;
        this.address = address;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    public static  Supplier GetSupplierByID(int ID){
        DataLayer layer = new DataLayer();

        Supplier supplier = null;
        try{
            var hash = new HashMap<String,Object>();
            hash.put("ID",ID);
            var result =  layer.SelectStoreProcedure("sp_GetSupplierByID",hash);

            while (result.next()){

                supplier = new Supplier();
                supplier.setId( result.getInt("ID"));
                supplier.setName( result.getString("Name"));
                supplier.setPhoneNumber( result.getString("PhoneNumber"));
                supplier.setAddress( result.getString("address"));



            }
            return supplier;

        }
        catch (Exception ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
    public static  void Insert(Supplier supplier){
        DataLayer layer = new DataLayer();
        var objectMap = new ArrayList<Object>() ;
        objectMap.add(supplier.getName());
        objectMap.add(supplier.getPhoneNumber());
        objectMap.add(supplier.getAddress());

        layer.InsertOrUpdateOrDelete("sp_insertSupplier",objectMap);
    }
    public static  void Update(Supplier supplier){
        DataLayer layer = new DataLayer();
        ArrayList<Object> obj = new ArrayList<>();
        obj.add(supplier.getId());
        obj.add(supplier.getName());
        obj.add(supplier.getPhoneNumber());
        obj.add(supplier.getAddress());

        layer.InsertOrUpdateOrDelete("sp_updateSupplier",obj);

    }
    public static  void delete(int ID){
        DataLayer layer = new DataLayer();
        ArrayList<Object> obj = new ArrayList<>();
        obj.add(ID);
        layer.InsertOrUpdateOrDelete("sp_delete_Supplier",obj);
    }
    public static DefaultTableModel SelectAll() throws SQLException {

        try{
            DataLayer layer = new DataLayer();
            return layer.SelectGetTable("select ID , Name , Phone, Address from Supplier where isDeleted =0");
        }
        catch (Exception ex){
            throw ex;
        }

    }
    public static  ArrayList<Supplier> GetAllSupplier(){

        try {
            var list = SelectAll();
            ArrayList<Supplier> suppliers = new ArrayList<>();
            for(int i=0;i<list.getRowCount();i++){
                suppliers.add(new Supplier((int) list.getValueAt(i,0),
                        String.valueOf(list.getValueAt(i,1)),
                        String.valueOf(list.getValueAt(i,2) ),
                        String.valueOf(list.getValueAt(i,3))
                        ));
            }
            return suppliers;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public String toString() {
        return this.name;
    }
}
