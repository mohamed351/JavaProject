package BusineesLayer;

import DataLayer.DataLayer;

import javax.swing.table.DefaultTableModel;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Store {
    private  int id;
    private  String name;
    private  String address;

    public Store(){

    }
    public Store(int id, String name, String address){
        this.id = id;
        this.name = name;
        this.address = address;
    }

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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public static  Store GetStoreByID(int ID){
        DataLayer layer = new DataLayer();

        Store store = null;
        try{
            var hash = new HashMap<String,Object>();
            hash.put("ID",ID);
            var result =  layer.SelectStoreProcedure("sp_GetStoreByID",hash);

            while (result.next()){

                store = new Store();
                store.setId( result.getInt("ID"));
                store.setName( result.getString("Name"));
                store.setAddress( result.getString("Address"));


            }
            return store;

        }
        catch (Exception ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
    public static  void Insert(Store store){
        DataLayer layer = new DataLayer();
        var objectMap = new ArrayList<Object>() ;
        objectMap.add(store.getName());
        objectMap.add(store.getAddress());

        layer.InsertOrUpdateOrDelete("sp_insert_Store",objectMap);
    }
    public static  void Update(Store store){
        DataLayer layer = new DataLayer();
        ArrayList<Object> obj = new ArrayList<>();
        obj.add(store.getId());
        obj.add(store.getName());
        obj.add(store.getAddress());

        layer.InsertOrUpdateOrDelete("sp_Update_Store",obj);

    }
    public static  void delete(int ID){
        DataLayer layer = new DataLayer();
        ArrayList<Object> obj = new ArrayList<>();
        obj.add(ID);
        layer.InsertOrUpdateOrDelete("sp_delete_Store",obj);
    }
    public static DefaultTableModel SelectAll() throws SQLException {

        try{
            DataLayer layer = new DataLayer();
            return layer.SelectGetTable("select ID, Name, Address from Store where isDelete =0");
        }
        catch (Exception ex){
            throw ex;
        }

    }
    public static List<Store> GetAllStore(){
        DefaultTableModel listStore = null;
        List<Store> stores = new ArrayList<>();
        try {
            listStore = SelectAll();
            for(int i=0;i<listStore.getRowCount();i++){
                stores.add(new Store((int) listStore.getValueAt(i,0) ,
                        String.valueOf( listStore.getValueAt(i,1)),
                        String.valueOf( listStore.getValueAt(i,2))
                        ));


            }

            return stores;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    public String toString() {
        return this.name;
    }
}
