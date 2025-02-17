package PresentationLayer.ProductsForm;

import BusineesLayer.Customer;
import BusineesLayer.Product;
import PresentationLayer.CustomerForm.CustomerForm;
import PresentationLayer.ElementForm;
import PresentationLayer.Helpers.ElementsFormData;
import PresentationLayer.Helpers.FormStatus;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.event.ActionEvent;
import java.sql.SQLException;

public class MainProductForm extends ElementForm {
    public MainProductForm(ElementsFormData abstact) {
        super(abstact);
    }

    @Override
    public void addNewElement(ActionEvent event) {
        ProductForm productForm = new ProductForm(new Product(), FormStatus.Create,this );
        productForm.setVisible(true);
    }

    @Override
    public void editNewElement(ActionEvent event) {
        var product =  Product.GetProductByID(this.getID());
        ProductForm customerForm = new ProductForm(product, FormStatus.Edit,this );
        customerForm.setVisible(true);
    }

    @Override
    public void deleteElement(ActionEvent event) {
        var data =   JOptionPane.showConfirmDialog(null,"Do you want to delete Product");
        if(data == 0){
            var customer = Product.GetProductByID(this.getID());
            if(customer == null){
                return;
            }
            Product.delete(customer.getId());

            try {
                reloadData( Product.SelectAll());
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
