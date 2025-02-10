package BusineesLayer;

import DataLayer.DataLayer;

import javax.swing.table.DefaultTableModel;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

public class Employee {
    private  int id ;
    private  String userName;
    private String name;
    private  String password;
    private  Double Salary;

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
            return layer.SelectGetTable("Select * from Employees");
        }
        catch (Exception ex){
            throw ex;
        }

    }
}
