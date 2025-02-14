package PresentationLayer;

import BusineesLayer.Employee;
import PresentationLayer.Helpers.ElementsFormData;
import PresentationLayer.Helpers.FormStatus;

import javax.swing.*;
import java.awt.*;
import java.sql.SQLException;

public class EmployeeForm  extends JFrame {
    int formStatus = FormStatus.Create;
    final Employee employee;
    private JTextField idField, userNameField, nameField, passwordField, salaryField;
    private JButton submitButton;
    ElementForm  elementsFormData ;
    public EmployeeForm(Employee employee , int formStatus  , ElementForm elementForm){
            this.employee = employee;
            this.formStatus = formStatus;
        this.elementsFormData =elementForm;
        setSize(400, 300);
         setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        JPanel panel = new JPanel(new GridLayout(6, 2, 10, 10));
        panel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

        // Create labels and text fields
        if(employee == null &&  formStatus == FormStatus.Create){
            employee = new Employee();
        }


        panel.add(new JLabel("Username:"));
        userNameField = new JTextField();
        userNameField.setText(employee.getUserName());

        panel.add(userNameField);

        panel.add(new JLabel("Name:"));
        nameField = new JTextField();
        nameField.setText(employee.getName());
        panel.add(nameField);

        panel.add(new JLabel("Password:"));
        passwordField = new JPasswordField();
        passwordField.setText(employee.getPassword());
        panel.add(passwordField);

        panel.add(new JLabel("Salary:"));
        salaryField = new JTextField();
        salaryField.setText(employee.getSalary().toString());
        panel.add(salaryField);


        submitButton = new JButton("Submit");
        submitButton.addActionListener(e->{

            this.setVisible(false);
        });

        submitButton.addActionListener(e->{
            this.employee.setUserName(userNameField.getText());
            this.employee.setPassword(passwordField.getText());
            this.employee.setName(nameField.getText());
            this.employee.setSalary(Double.parseDouble(salaryField.getText()));
            if(this.formStatus == FormStatus.Create) {

                Employee.InsertEmployee(this.employee);
                JOptionPane.showMessageDialog(null, "Successfully Added");
                try {
                    this.elementsFormData.reloadData(Employee.SelectEmployeesTable());
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }
                dispose();
            }
            else{
                Employee.Update(this.employee);
                JOptionPane.showMessageDialog(null, "Successfully Edited");
                try {
                    this.elementsFormData.reloadData(Employee.SelectEmployeesTable());
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }
            }
        });
        panel.add(submitButton);
        add(panel);
    }


}
