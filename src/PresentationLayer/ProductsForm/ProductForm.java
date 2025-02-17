package PresentationLayer.ProductsForm;

import BusineesLayer.Customer;
import BusineesLayer.Product;
import PresentationLayer.ElementForm;
import PresentationLayer.Helpers.FormStatus;

import javax.swing.*;
import java.awt.*;
import java.sql.SQLException;

public class ProductForm  extends JFrame {

    int formStatus = FormStatus.Create;
    final Product product;
    private JTextField  nameField, priceField;
    private JButton submitButton;
    ElementForm elementsFormData ;
    public ProductForm(Product product , int formStatus  , ElementForm elementForm){
        this.product = product;
        this.formStatus = formStatus;
        this.elementsFormData =elementForm;
        setSize(400, 300);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        JPanel panel = new JPanel(new GridLayout(6, 2, 10, 10));
        panel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

        // Create labels and text fields
        if(product == null &&  formStatus == FormStatus.Create){
            product = new Product();
        }


        panel.add(new JLabel("Name:"));
        nameField = new JTextField();
        nameField.setText(product.getName());

        panel.add(nameField);

        panel.add(new JLabel("Price:"));
        priceField = new JTextField();
        priceField.setText(String.valueOf( product.getPrice()));
        panel.add(priceField);



        submitButton = new JButton("Submit");
        submitButton.addActionListener(e->{

            this.setVisible(false);
        });

        submitButton.addActionListener(e->{
            this.product.setName(nameField.getText());
            this.product.setPrice(Double.parseDouble( priceField.getText()));

            if(this.formStatus == FormStatus.Create) {

                Product.Insert (this.product);
                JOptionPane.showMessageDialog(null, "Successfully Added");
                try {
                    this.elementsFormData.reloadData(Product.SelectAll());
                    dispose();
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }

            }
            else{
                Product.Update(this.product);
                JOptionPane.showMessageDialog(null, "Successfully Edited");
                try {
                    this.elementsFormData.reloadData(Product.SelectAll());
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
