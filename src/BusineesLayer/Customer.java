package BusineesLayer;

import DataLayer.DataLayer;

import javax.swing.table.DefaultTableModel;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class Customer {

    private  int id;
    private  String name;
    private  String phone;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public static  Customer GetCustomerByID(int ID){
        DataLayer layer = new DataLayer();

        Customer customer = null;
        try{
            var hash = new HashMap<String,Object>();
            hash.put("ID",ID);
            var result =  layer.SelectStoreProcedure("sp_GetCustomerByID",hash);

            while (result.next()){

                customer = new Customer();
                customer.setId( result.getInt("ID"));
                customer.setName( result.getString("Name"));
                customer.setPhone( result.getString("Phone"));


            }
            return customer;

        }
        catch (Exception ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
    public static  void Insert(Customer customer){
        DataLayer layer = new DataLayer();
        var objectMap = new ArrayList<Object>() ;
        objectMap.add(customer.getName());
        objectMap.add(customer.getPhone());

        layer.InsertOrUpdateOrDelete("sp_insert_Customer",objectMap);
    }
    public static  void Update(Customer customer){
        DataLayer layer = new DataLayer();
        ArrayList<Object> obj = new ArrayList<>();
        obj.add(customer.getId());
        obj.add(customer.getName());
        obj.add(customer.getPhone());

        layer.InsertOrUpdateOrDelete("sp_Update_Customer",obj);

    }
    public static  void delete(int ID){
        DataLayer layer = new DataLayer();
        ArrayList<Object> obj = new ArrayList<>();
        obj.add(ID);
        layer.InsertOrUpdateOrDelete("sp_delete_Customer",obj);
    }
    public static DefaultTableModel SelectAll() throws SQLException {

        try{
            DataLayer layer = new DataLayer();
            return layer.SelectGetTable("select ID, Name, Phone from Customer where isDeleted =0");
        }
        catch (Exception ex){
            throw ex;
        }

    }



}
