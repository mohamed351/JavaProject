package PresentationLayer;

import BusineesLayer.*;
import PresentationLayer.CustomerForm.MainCustomerForm;
import PresentationLayer.Helpers.ElementsFormData;
import PresentationLayer.Helpers.FormStatus;
import PresentationLayer.OrderInvoiceForm.InvoiceForm;
import PresentationLayer.ProductsForm.MainProductForm;
import PresentationLayer.StoreForm.MainStoreForm;
import PresentationLayer.StoreForm.StoreInfoForm;
import PresentationLayer.SupplierForm.MainSupplierForm;
import PresentationLayer.SupplierForm.SupplierForm;
import PresentationLayer.SupplierInvoice.SupplierInvoiceForm;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;

public class MainForm extends JFrame {

    public MainForm(){
        setExtendedState(JFrame.MAXIMIZED_BOTH);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setTitle("Full Width JFrame with Menu and Image");
        getContentPane().setBackground(ThemeColor.primaryColor);
        // Create Menu Bar
        JMenuBar menuBar = new JMenuBar();
        JMenu fileMenu = new JMenu("Master Data");
        JMenu InvoiceMenu = new JMenu("Invoice");




         JMenuItem clientInvoice = new JMenuItem("Client Invoice");
        JMenuItem supplierInvoice = new JMenuItem("Supplier Invoice");
        clientInvoice.addActionListener(this::showClientInvoice);
        supplierInvoice.addActionListener(this::showSupplierInvoice);

        JMenuItem employeesMenu = new JMenuItem("Employees");

        JMenuItem customersMenu = new JMenuItem("Customers");
        JMenuItem supplierFormMenu = new JMenuItem("Supplier");
        JMenuItem productMenu = new JMenuItem("Products");
        JMenuItem storeMenu = new JMenuItem("Stores");


        employeesMenu.addActionListener(this::showEmployeeForm);
        customersMenu.addActionListener(this::showCustomerForm);
        productMenu.addActionListener(this::showProductForm);
        storeMenu.addActionListener(this::showStoreForm);
        supplierFormMenu.addActionListener(this::showSupplierForm);
        // Exit Action


        JMenu storeData = new JMenu("Store Data");
        JMenuItem storeInfo = new JMenuItem("Products in  Store");
        storeInfo.addActionListener(this::showProductStore);
        storeData.add(storeInfo);

     fileMenu.add(employeesMenu);
        fileMenu.add(customersMenu);
        fileMenu.add(supplierFormMenu);
        fileMenu.add(productMenu);
        fileMenu.add(storeMenu);

     menuBar.add(fileMenu);

        InvoiceMenu.add(clientInvoice);
        InvoiceMenu.add(supplierInvoice);
        menuBar.add(InvoiceMenu);
        menuBar.add(storeData);
        setJMenuBar(menuBar);


        ImageIcon imageIcon = new ImageIcon(MainForm.class.getResource("/images/logo2.png")); // Replace with your image path
        JLabel imageLabel = new JLabel(imageIcon);
        imageLabel.setHorizontalAlignment(SwingConstants.CENTER);
        imageLabel.setVerticalAlignment(SwingConstants.CENTER);


        JPanel imagePanel = new JPanel(new GridBagLayout());
        imagePanel.setBackground(ThemeColor.primaryColor);
        imagePanel.add(imageLabel);

        // Add to Frame
        add(imagePanel, BorderLayout.CENTER);

        setVisible(true);;
    }
    private  void showEmployeeForm(ActionEvent  e)  {
        try {
            var ab = new ElementsFormData();

            ab.title = "Employees";
            ab.tableModel = Employee.SelectEmployeesTable();
            ElementForm form = new MainEmployeeForm(ab);

            form.setVisible(true);
        }
        catch (Exception ex){

        }
    }

    private  void showCustomerForm(ActionEvent e){

        try {
            var ab = new ElementsFormData();

            ab.title = "Customers";
            ab.tableModel = Customer.SelectAll();
            ElementForm form = new MainCustomerForm(ab);

            form.setVisible(true);
        }
        catch (Exception ex){

        }

    }

    private  void showProductForm(ActionEvent e){

        try {
            var ab = new ElementsFormData();

            ab.title = "Products";
            ab.tableModel = Product.SelectAll();
            ElementForm form = new MainProductForm(ab);

            form.setVisible(true);
        }
        catch (Exception ex){

        }

    }

    private  void showStoreForm(ActionEvent e){

        try {
            var ab = new ElementsFormData();

            ab.title = "Stores";
            ab.tableModel = Store.SelectAll();
            ElementForm form = new MainStoreForm(ab);

            form.setVisible(true);
        }
        catch (Exception ex){

        }

    }
    private  void showClientInvoice(ActionEvent e){

        InvoiceForm frm = new InvoiceForm();
        frm.setVisible(true);

    }

    private  void showSupplierInvoice(ActionEvent e){

        SupplierInvoiceForm frm = new SupplierInvoiceForm();
        frm.setVisible(true);

    }

    private void showSupplierForm(ActionEvent e){
        try{
            var ab = new ElementsFormData();
            ab.title = "Supplier";
            ab.tableModel = Supplier.SelectAll();
            ElementForm form = new MainSupplierForm(ab);

            form.setVisible(true);
        }
        catch (Exception ex){

        }


    }
    private  void showProductStore(ActionEvent e){
        var p = new StoreInfoForm();
        p.setVisible(true);
    }
}
