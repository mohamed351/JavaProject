package PresentationLayer.SupplierForm;


import BusineesLayer.Supplier;
import PresentationLayer.ElementForm;
import PresentationLayer.Helpers.ElementsFormData;
import PresentationLayer.Helpers.FormStatus;

import PresentationLayer.ElementForm;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.event.ActionEvent;
import java.sql.SQLException;

public class MainSupplierForm  extends ElementForm {

    public MainSupplierForm(ElementsFormData abstact) {
        super(abstact);
    }

    @Override
    public void addNewElement(ActionEvent event) {
        SupplierForm supplierForm = new SupplierForm(new Supplier(), FormStatus.Create,this );
        supplierForm.setVisible(true);
    }

    @Override
    public void editNewElement(ActionEvent event) {
        var supplier =  Supplier.GetSupplierByID(this.getID());
        SupplierForm supplierForm = new SupplierForm(supplier, FormStatus.Edit,this );
        supplierForm.setVisible(true);
    }

    @Override
    public void deleteElement(ActionEvent event) {
        var data =   JOptionPane.showConfirmDialog(null,"Do you want to delete Supplier");
        if(data == 0){
            var supplier =  Supplier.GetSupplierByID  (this.getID());
            if(supplier == null){
                return;
            }
            Supplier.delete(supplier.getId());

            try {
                reloadData( Supplier.SelectAll());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public void printElement(ActionEvent event) {
        JOptionPane.showMessageDialog(null,"Select");
    }

    @Override
    public void reloadData(DefaultTableModel table) {
        this.table.setModel(table);
    }
}
