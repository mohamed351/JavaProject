package PresentationLayer.StoreForm;

import BusineesLayer.Customer;
import BusineesLayer.Store;
import PresentationLayer.ElementForm;
import PresentationLayer.Helpers.FormStatus;

import javax.swing.*;
import java.awt.*;
import java.sql.SQLException;

public class StoreForm extends JFrame {

    int formStatus = FormStatus.Create;
     Store store;
    private JTextField  nameField, addressField;
    private JButton submitButton;
    ElementForm elementsFormData ;
    public StoreForm(Store Store , int formStatus  , ElementForm elementForm){
        this.store =Store ;
        this.formStatus = formStatus;
        this.elementsFormData =elementForm;
        setSize(400, 300);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        JPanel panel = new JPanel(new GridLayout(6, 2, 10, 10));
        panel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

        // Create labels and text fields
        if(store == null &&  formStatus == FormStatus.Create){
           this. store = new Store();
        }


        panel.add(new JLabel("Name:"));
        nameField = new JTextField();
        nameField.setText(store.getName());

        panel.add(nameField);

        panel.add(new JLabel("Address:"));
        addressField = new JTextField();
        addressField.setText(store.getAddress());
        panel.add(addressField);



        submitButton = new JButton("Submit");
        submitButton.addActionListener(e->{

            this.setVisible(false);
        });

        submitButton.addActionListener(e->{
            this.store.setName(nameField.getText());
            this.store.setAddress(addressField.getText());

            if(this.formStatus == FormStatus.Create) {

                Store.Insert (this.store);
                JOptionPane.showMessageDialog(null, "Successfully Added");
                try {
                    this.elementsFormData.reloadData(Store.SelectAll());
                    dispose();
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }

            }
            else{
                Store.Update(this.store);
                JOptionPane.showMessageDialog(null, "Successfully Edited");
                try {
                    this.elementsFormData.reloadData(Store.SelectAll());
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
