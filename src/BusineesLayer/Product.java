package BusineesLayer;

import DataLayer.DataLayer;

import javax.swing.table.DefaultTableModel;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class Product {
    private  int id;
    private  String name;
    private  double price;

    public Product(){

    }
    public Product(int id, String name , double price){
        this.id = id;
        this.name = name;
        this.price = price;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public static  Product GetProductByID(int ID){
        DataLayer layer = new DataLayer();

        Product product = null;
        try{
            var hash = new HashMap<String,Object>();
            hash.put("ID",ID);
            var result =  layer.SelectStoreProcedure("sp_GetProductByID",hash);

            while (result.next()){

                product = new Product();
                product.setId( result.getInt("ID"));
                product.setName( result.getString("Name"));
                product.setPrice( result.getDouble("Price"));


            }
            return product;

        }
        catch (Exception ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
    public static  void Insert(Product product){
        DataLayer layer = new DataLayer();
        var objectMap = new ArrayList<Object>() ;
        objectMap.add(product.getName());
        objectMap.add(product.getPrice());

        layer.InsertOrUpdateOrDelete("sp_insert_Product",objectMap);
    }
    public static  void Update(Product product){
        DataLayer layer = new DataLayer();
        ArrayList<Object> obj = new ArrayList<>();
        obj.add(product.getId());
        obj.add(product.getName());
        obj.add(product.getPrice());

        layer.InsertOrUpdateOrDelete("sp_Update_Product",obj);

    }
    public static  void delete(int ID){
        DataLayer layer = new DataLayer();
        ArrayList<Object> obj = new ArrayList<>();
        obj.add(ID);
        layer.InsertOrUpdateOrDelete("sp_delete_Product",obj);
    }
    public static DefaultTableModel SelectAll() throws SQLException {

        try{
            DataLayer layer = new DataLayer();
            return layer.SelectGetTable("select ID,Name, Price from Product where isDelete =0");
        }
        catch (Exception ex){
            throw ex;
        }

    }
    public static ArrayList<Product>  GetAllProducts(){

        try {

            var allProducts = SelectAll();
            ArrayList<Product> products = new ArrayList<>();
            for(int i=0;i<allProducts.getRowCount();i++){

                 products.add(new Product((int)allProducts.getValueAt(i,0)
                         ,String.valueOf( allProducts.getValueAt(i,1))
                         ,Double.parseDouble( allProducts.getValueAt(i,2).toString())));
            }
            return products;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public String toString() {
        return this.name;
    }
}
