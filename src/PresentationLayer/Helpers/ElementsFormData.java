package PresentationLayer.Helpers;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public  class  ElementsFormData   {
    public ActionListener actionListenerAddButton;
    public ActionListener actionListenerEditButton;
    public ActionListener actionListenerDeleteButton;
    public ActionListener actionListenerPrintButton;
    public String title;
    public JTable table;

    public DefaultTableModel tableModel;

    public void ReloadDataTable(DefaultTableModel defaultTableModel){
        table.setModel(defaultTableModel);
    }
}
