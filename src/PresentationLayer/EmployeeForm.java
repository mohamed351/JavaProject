package PresentationLayer;

import BusineesLayer.Employee;
import PresentationLayer.Helpers.FormStatus;

import javax.swing.*;
import java.awt.*;

public class EmployeeForm  extends JFrame {
    int formStatus = FormStatus.Create;
    Employee employee;
    private JTextField idField, userNameField, nameField, passwordField, salaryField;
    private JButton submitButton;

    public EmployeeForm(Employee employee , int formStatus){
            this.employee = employee;
            this.formStatus = formStatus;
        setSize(400, 300);
             setLocationRelativeTo(null);

        JPanel panel = new JPanel(new GridLayout(6, 2, 10, 10));
        panel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

        // Create labels and text fields


        panel.add(new JLabel("Username:"));
        userNameField = new JTextField();
        panel.add(userNameField);

        panel.add(new JLabel("Name:"));
        nameField = new JTextField();
        panel.add(nameField);

        panel.add(new JLabel("Password:"));
        passwordField = new JPasswordField();
        panel.add(passwordField);

        panel.add(new JLabel("Salary:"));
        salaryField = new JTextField();
        panel.add(salaryField);


        submitButton = new JButton("Submit");
        submitButton.addActionListener(e->{

            this.setVisible(false);
        });
        panel.add(submitButton);
        add(panel);
    }
}
