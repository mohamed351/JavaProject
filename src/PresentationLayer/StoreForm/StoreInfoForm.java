package PresentationLayer.StoreForm;

import BusineesLayer.Product;
import BusineesLayer.Store;
import DataLayer.DataLayer;
import PresentationLayer.Helpers.ElementsFormData;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.SQLException;

public class StoreInfoForm  extends JFrame {

    JTable table;
    private DefaultTableModel model;
    JComboBox<Store> storeJCombox;
    public StoreInfoForm(){
        setSize(1000,800);

        JPanel panel = new JPanel();
        panel.add(new Label("Store :"),BorderLayout.WEST);
        storeJCombox = new JComboBox<Store>(Store.GetAllStore().toArray(new Store[0]));
        panel.add(storeJCombox,BorderLayout.CENTER);
        JButton btn = new JButton("Show");
        btn.addActionListener(e->{
            DataLayer dataLayer = new DataLayer();
            try {
               var storeId =  ((Store) storeJCombox.getSelectedItem()).getId();
             table.setModel( dataLayer.SelectGetTable("execute sp_select_store "+storeId));
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }

        });

        panel.add(btn,BorderLayout.EAST);
        add(panel,BorderLayout.NORTH);
        add(addGrid(),BorderLayout.CENTER);





    }

    private JPanel addGrid(){
        JPanel panel = new JPanel(new GridLayout(1,1));

        panel.setBorder(BorderFactory.createEmptyBorder(20,20,20,20));

        table= new JTable(model);
        table.setFillsViewportHeight(true);
        JScrollPane sp=new JScrollPane(table);
        panel.add(sp);
        return panel;

    }

}
