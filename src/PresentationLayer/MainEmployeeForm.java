package PresentationLayer;

import BusineesLayer.Employee;
import PresentationLayer.Helpers.ElementsFormData;
import PresentationLayer.Helpers.FormStatus;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.event.ActionEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class MainEmployeeForm  extends  ElementForm{

    public MainEmployeeForm(ElementsFormData abstact) {
        super(abstact);
    }

    @Override
    public void addNewElement(ActionEvent event) {
        EmployeeForm employeeForm = new EmployeeForm(new Employee(), FormStatus.Create,this );
        employeeForm.setVisible(true);
    }

    @Override
    public void editNewElement(ActionEvent event) {
      var emp =  Employee.GetEmployeeByID(this.getID());
        EmployeeForm employeeForm = new EmployeeForm(emp, FormStatus.Edit,this );
        employeeForm.setVisible(true);
    }

    @Override
    public void deleteElement(ActionEvent event) {

    }

    @Override
    public void printElement(ActionEvent event) {

    }

    @Override
    public void reloadData(DefaultTableModel table) {
        this.table.setModel(table);
    }
}
