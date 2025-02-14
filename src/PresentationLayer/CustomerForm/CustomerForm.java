package PresentationLayer.CustomerForm;

import BusineesLayer.Customer;
import BusineesLayer.Employee;
import PresentationLayer.ElementForm;
import PresentationLayer.Helpers.FormStatus;

import javax.swing.*;
import java.awt.*;
import java.sql.SQLException;

public class CustomerForm  extends JFrame {
    int formStatus = FormStatus.Create;
    final Customer customer;
    private JTextField  nameField, PhoneNumber;
    private JButton submitButton;
    ElementForm elementsFormData ;
    public CustomerForm(Customer customer , int formStatus  , ElementForm elementForm){
        this.customer = customer;
        this.formStatus = formStatus;
        this.elementsFormData =elementForm;
        setSize(400, 300);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        JPanel panel = new JPanel(new GridLayout(6, 2, 10, 10));
        panel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

        // Create labels and text fields
        if(customer == null &&  formStatus == FormStatus.Create){
            customer = new Customer();
        }


        panel.add(new JLabel("Name:"));
        nameField = new JTextField();
        nameField.setText(customer.getName());

        panel.add(nameField);

        panel.add(new JLabel("Phone:"));
        PhoneNumber = new JTextField();
        PhoneNumber.setText(customer.getPhone());
        panel.add(PhoneNumber);



        submitButton = new JButton("Submit");
        submitButton.addActionListener(e->{

            this.setVisible(false);
        });

        submitButton.addActionListener(e->{
            this.customer.setName(nameField.getText());
            this.customer.setPhone(PhoneNumber.getText());

            if(this.formStatus == FormStatus.Create) {

                Customer.Insert (this.customer);
                JOptionPane.showMessageDialog(null, "Successfully Added");
                try {
                    this.elementsFormData.reloadData(Customer.SelectAll());
                    dispose();
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }

            }
            else{
                Customer.Update(this.customer);
                JOptionPane.showMessageDialog(null, "Successfully Edited");
                try {
                    this.elementsFormData.reloadData(Customer.SelectAll());
                    dispose();
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }

            }
        });
        panel.add(submitButton);
        add(panel);
    }


}
