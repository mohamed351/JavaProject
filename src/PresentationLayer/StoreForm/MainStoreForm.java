package PresentationLayer.StoreForm;

import BusineesLayer.Customer;
import BusineesLayer.Store;
import PresentationLayer.CustomerForm.CustomerForm;
import PresentationLayer.ElementForm;
import PresentationLayer.Helpers.ElementsFormData;
import PresentationLayer.Helpers.FormStatus;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.event.ActionEvent;
import java.sql.SQLException;

public class MainStoreForm  extends ElementForm {
    public MainStoreForm(ElementsFormData abstact) {
        super(abstact);
    }

    @Override
    public void addNewElement(ActionEvent event) {
        StoreForm storeForm = new StoreForm(new Store(), FormStatus.Create,this );
        storeForm.setVisible(true);
    }

    @Override
    public void editNewElement(ActionEvent event) {
        var store =  Store.GetStoreByID (this.getID());
        StoreForm storeForm = new StoreForm(store, FormStatus.Edit,this );
        storeForm.setVisible(true);
    }

    @Override
    public void deleteElement(ActionEvent event) {
        var data =   JOptionPane.showConfirmDialog(null,"Do you want to delete Store");
        if(data == 0){
            var store =  Store.GetStoreByID  (this.getID());
            if(store == null){
                return;
            }
            Store.delete(store.getId());

            try {
                reloadData( Store.SelectAll());
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
