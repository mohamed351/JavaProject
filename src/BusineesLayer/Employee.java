package BusineesLayer;

import DataLayer.DataLayer;

import javax.swing.table.DefaultTableModel;
import java.sql.Array;
import java.sql.SQLException;
import java.util.*;

public class Employee {
    private  int id ;
    private  String userName ="";
    private String name = "";
    private  String password = "";
    private  double Salary;

    public static Employee LoginEmployee;

    public static ArrayList<Employee> GetEmployees(){
        ArrayList<Employee> employees = new ArrayList<Employee>();
        DataLayer data = new DataLayer();
        return employees;
    }



    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Double getSalary() {
        return Salary;
    }

    public void setSalary(Double salary) {
        Salary = salary;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public int getId() {
        return id;
    }

    public static  Employee LoginEmployee(String userName , String password){
        DataLayer layer = new DataLayer();
        Employee employee = null;
        try{
            var hash = new HashMap<String,Object>();
            hash.put("UserName",userName);
            hash.put("Password",password);
            var result =  layer.SelectStoreProcedure("sp_loginEmployee",hash);

            while (result.next()){

                employee = new Employee();
                employee.setId( result.getInt("ID"));
                employee.setUserName( result.getString("Name"));
                employee.setSalary( result.getDouble("Salary"));
                employee.setPassword( result.getString("Password"));
                Employee.LoginEmployee =employee;
            }
            return employee;

        }
        catch (Exception ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
    public static DefaultTableModel SelectEmployeesTable() throws SQLException {

        try{
            DataLayer layer = new DataLayer();
            return layer.SelectGetTable("Select ID, Name, Salary,UserName from Employees");
        }
        catch (Exception ex){
            throw ex;
        }

    }
    public static  Employee GetEmployeeByID(int ID){
        DataLayer layer = new DataLayer();

        Employee employee = null;
        try{
            var hash = new HashMap<String,Object>();
            hash.put("ID",ID);
            var result =  layer.SelectStoreProcedure("sp_GetEmployeeByID",hash);

            while (result.next()){

                employee = new Employee();
                employee.setId( result.getInt("ID"));
                employee.setName( result.getString("Name"));
                employee.setUserName( result.getString("UserName"));
                employee.setSalary( result.getDouble("Salary"));
                employee.setPassword( result.getString("Password"));

            }
            return employee;

        }
        catch (Exception ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
    public static  void InsertEmployee(Employee employee){
        DataLayer layer = new DataLayer();
        var objectMap = new ArrayList<Object>() ;
        objectMap.add(employee.getName());
        objectMap.add(employee.getSalary());
        objectMap.add(employee.getUserName());
        objectMap.add(employee.getPassword());
        layer.InsertOrUpdateOrDelete("sp_insert_Employee",objectMap);
    }
    public static  void Update(Employee employee){
        DataLayer layer = new DataLayer();
        ArrayList<Object> obj = new ArrayList<>();
        obj.add(employee.getId());
        obj.add(employee.getName());
        obj.add(employee.getSalary());
        obj.add(employee.getUserName());
        obj.add(employee.getPassword());
        layer.InsertOrUpdateOrDelete("sp_update_Employee",obj);
//        Map<String ,Object> objectMap = new HashMap<>();
//        objectMap.put("ID",employee.getId());
//        objectMap.put("Name",employee.getName());
//        objectMap.put("Salary",employee.getSalary());
//        objectMap.put("UserName",employee.getUserName());
//        objectMap.put("Password",employee.getPassword());
//        layer.InsertOrUpdateOrDelete("sp_update_Employee",objectMap);
    }
    public static  void delete(int ID){
//        DataLayer layer = new DataLayer();
//        Map<String ,Object> objectMap = new HashMap<>();
//        objectMap.put("ID",ID);
//        layer.InsertOrUpdateOrDelete("sp_delete_employee",objectMap);
    }


}
