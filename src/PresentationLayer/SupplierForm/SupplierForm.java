package PresentationLayer.SupplierForm;

import BusineesLayer.Customer;
import BusineesLayer.Supplier;
import PresentationLayer.ElementForm;
import PresentationLayer.Helpers.FormStatus;

import javax.swing.*;
import java.awt.*;
import java.sql.SQLException;

public class SupplierForm  extends JFrame {
    int formStatus = FormStatus.Create;
    final Supplier supplier;
    private JTextField  nameField, PhoneNumber, addressField;
    private JButton submitButton;
    ElementForm elementsFormData ;
    public SupplierForm(Supplier supplier , int formStatus  , ElementForm elementForm){
        this.supplier = supplier;
        this.formStatus = formStatus;
        this.elementsFormData =elementForm;
        setSize(400, 300);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        JPanel panel = new JPanel(new GridLayout(6, 2, 10, 10));
        panel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

        // Create labels and text fields
        if(supplier == null &&  formStatus == FormStatus.Create){
            supplier = new Supplier();
        }


        panel.add(new JLabel("Name:"));
        nameField = new JTextField();
        nameField.setText(supplier.getName());

        panel.add(nameField);

        panel.add(new JLabel("Phone:"));
        PhoneNumber = new JTextField();
        PhoneNumber.setText(supplier.getPhoneNumber());
        panel.add(PhoneNumber);

        panel.add(new JLabel("Address:"));
        addressField = new JTextField();
        addressField.setText(supplier.getAddress());
        panel.add(addressField);



        submitButton = new JButton("Submit");
        submitButton.addActionListener(e->{

            this.setVisible(false);
        });

        submitButton.addActionListener(e->{
            this.supplier.setName(nameField.getText());
            this.supplier.setPhoneNumber(PhoneNumber.getText());
            this.supplier.setAddress(addressField.getText());

            if(this.formStatus == FormStatus.Create) {

                Supplier.Insert (this.supplier);
                JOptionPane.showMessageDialog(null, "Successfully Added");
                try {
                    this.elementsFormData.reloadData(Customer.SelectAll());
                    dispose();
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }

            }
            else{
                Supplier.Update(this.supplier);
                JOptionPane.showMessageDialog(null, "Successfully Edited");
                try {
                    this.elementsFormData.reloadData(Supplier.SelectAll());
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

