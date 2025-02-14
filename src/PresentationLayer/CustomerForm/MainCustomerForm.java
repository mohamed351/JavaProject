package PresentationLayer.CustomerForm;

import BusineesLayer.Customer;
import BusineesLayer.Employee;
import PresentationLayer.ElementForm;
import PresentationLayer.EmployeeForm;
import PresentationLayer.Helpers.ElementsFormData;
import PresentationLayer.Helpers.FormStatus;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.event.ActionEvent;
import java.sql.SQLException;

public class MainCustomerForm extends ElementForm {
    public MainCustomerForm(ElementsFormData abstact) {
        super(abstact);
    }

    @Override
    public void addNewElement(ActionEvent event) {
        CustomerForm customerForm = new CustomerForm(new Customer(), FormStatus.Create,this );
        customerForm.setVisible(true);
    }

    @Override
    public void editNewElement(ActionEvent event) {
        var customer =  Customer.GetCustomerByID (this.getID());
        CustomerForm customerForm = new CustomerForm(customer, FormStatus.Edit,this );
        customerForm.setVisible(true);
    }

    @Override
    public void deleteElement(ActionEvent event) {
        var data =   JOptionPane.showConfirmDialog(null,"Do you want to delete Customer");
        if(data == 0){
            var customer =  Customer.GetCustomerByID (this.getID());
            if(customer == null){
                return;
            }
            Customer.delete(customer.getId());

            try {
                reloadData( Customer.SelectAll());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public void printElement(ActionEvent event) {

    }

    @Override
    public void reloadData(DefaultTableModel table) {
        this.table.setModel(table);
    }
}
