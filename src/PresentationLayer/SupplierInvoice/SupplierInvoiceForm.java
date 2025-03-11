package PresentationLayer.SupplierInvoice;

import BusineesLayer.*;
import PresentationLayer.OrderInvoiceForm.InvoiceForm;
import PresentationLayer.ReportViewer;
import com.microsoft.sqlserver.jdbc.SQLServerException;

import javax.swing.*;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class SupplierInvoiceForm  extends JFrame {

    private final GridBagConstraints gbc = new GridBagConstraints();
    private DefaultTableModel model;
    private JTable orderTable;
    JComboBox<Supplier> supplierComboBox;
    JComboBox<Store> storeJCombox;
    JTextField noteTextField;
    JTextField totalText;
    //private String[] productOptions = {"Product A", "Product B", "Product C", "Product D"};

    public SupplierInvoiceForm() {
        setTitle("Purchasing Invoice");
        setSize(900, 600);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(null);
        setLayout(new BorderLayout(10, 10));

        // Title Panel
        JPanel invoiceTitlePanel = new JPanel();
        JLabel titleLabel = new JLabel("Purchasing Invoice");
        titleLabel.setFont(new Font("Arial", Font.BOLD, 24));
        invoiceTitlePanel.add(titleLabel);
        add(invoiceTitlePanel, BorderLayout.NORTH);

        // Main Form Panel
        JPanel formPanel = new JPanel(new GridBagLayout());
        formPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        gbc.insets = new Insets(5, 5, 5, 5);
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.weightx = 1.0;

        // Row 1: Customer & Store
        addLabel("Supplier", 0, 0, formPanel);
        // addComboBox(new String[]{"Testing Customer 1", "Testing Customer 2"}, 1, 0, formPanel);
        supplierComboBox = new JComboBox<Supplier>(Supplier.GetAllSupplier().toArray(new Supplier[0]));
        gbc.gridx = 1;
        gbc.gridy = 0;
        formPanel.add(supplierComboBox, gbc);

        addLabel("Store", 2, 0, formPanel);
        storeJCombox = new JComboBox<Store>(Store.GetAllStore().toArray(new Store[0]));
        gbc.gridx = 3;
        gbc.gridy = 0;
        formPanel.add(storeJCombox, gbc);

        // Row 2: Date & Note
        // JCalendar calendar = new JCalendar();
        addLabel("Date", 0, 1, formPanel);
        JTextField textField = new JTextField();
        textField.setText( new Date().toString());
//        addTextField(1, 1, formPanel);
//        JButton button = new JButton();
        //  CalenderDate currentCalender = new CalenderDate();
        gbc.gridx = 1;
        gbc.gridy = 1;
        formPanel.add(textField,gbc);

        addLabel("Note", 2, 1, formPanel);
        //addTextField(3, 1, formPanel, "Note");
        noteTextField   = new JTextField();
        gbc.gridx =3;
        gbc.gridy =1;
        formPanel.add(noteTextField,gbc);

        // Row 3: Invoice Type
//        addLabel("Invoice Type", 0, 2, formPanel);
//        addTextField(1, 2, formPanel, "Invoice Type");

        // Table Section
        String[] columns = {"Product", "Quantity", "Price", "Total Price"};
        model = new DefaultTableModel(columns, 0);
        orderTable = new JTable(model);

        // Set ComboBox in "Product" Column
        TableColumn productColumn = orderTable.getColumnModel().getColumn(0);
        TableColumn qtuColumn = orderTable.getColumnModel().getColumn(1);
        // qtuColumn.setCellEditor(new DefaultCellEditor(new JTextField()));
        productColumn.setCellEditor(new DefaultCellEditor(new JComboBox<Product>(Product.GetAllProducts().toArray(new Product[0]))));

        JScrollPane tableScrollPane = new JScrollPane(orderTable);
        gbc.gridx = 0;
        gbc.gridy = 3;
        gbc.gridwidth = 4;
        gbc.weighty = 1.0;
        gbc.fill = GridBagConstraints.BOTH;
        formPanel.add(tableScrollPane, gbc);

        // Add first empty row
        addRow();

        // Listen for changes in the table to add a new row when the previous one is full

        addEventToGrid();

        // Add right-click delete row functionality
        orderTable.addMouseListener(new MouseAdapter() {
            @Override
            public void mousePressed(MouseEvent e) {
                if (SwingUtilities.isRightMouseButton(e)) {
                    int row = orderTable.rowAtPoint(e.getPoint());
                    if (row >= 0) {
                        JPopupMenu popupMenu = new JPopupMenu();
                        JMenuItem deleteItem = new JMenuItem("Delete Row");
                        deleteItem.addActionListener(actionEvent -> deleteRow(row));
                        popupMenu.add(deleteItem);
                        popupMenu.show(orderTable, e.getX(), e.getY());
                    }
                }
            }
        });

        //   gbc.fill = GridBagConstraints.BOTH;

        add(formPanel, BorderLayout.CENTER);
        add(this.getFooter(),BorderLayout.SOUTH);
        setVisible(true);
    }

    private void addEventToGrid() {
        var event =  new TableModelListener() {
            @Override
            public void tableChanged(TableModelEvent e) {
                model.removeTableModelListener(this);

                if (e.getType() == TableModelEvent.UPDATE) {
                    int rowCount = model.getRowCount();
                    int columnCount = model.getColumnCount();


                    if (rowCount > 0) {
                        boolean lastRowFilled = true;



                        for(int i = 0; i<rowCount ;i++){
                            try {
                                Product product = (Product) model.getValueAt(i, 0);
                                // model.setValueAt(0, i, 1);
                                if(model.getValueAt(i, 1).toString().equals("0")){
                                    model.setValueAt(1, i, 1);
                                }

                                //   JOptionPane.showMessageDialog(null,model.getValueAt(i, 1).toString());

                                model.setValueAt(String.valueOf(product.getPrice()), i, 2);
                                double qtu = Double.parseDouble(model.getValueAt(i, 1).toString());
                                model.setValueAt(String.valueOf(product.getPrice() * qtu), i, 3);
                            }
                            catch (Exception ex){

                            }

                        }
                        for (int i = 0; i < columnCount; i++) {

                            Object cellValue = model.getValueAt(rowCount - 1, i);
                            if (cellValue == null || cellValue.toString().trim().isEmpty()) {
                                lastRowFilled = false;
                                break;
                            }
                        }

                        if (lastRowFilled) {
                            addRow();
                        }
                        model.addTableModelListener(this);
                        CalculateTotal();
                    }
                }
            }
        };
        model.addTableModelListener(event);
    }

    private void addLabel(String text, int x, int y, JPanel panel) {
        JLabel label = new JLabel(text);
        label.setFont(new Font("Arial", Font.PLAIN, 14));
        gbc.gridx = x;
        gbc.gridy = y;
        gbc.gridwidth = 1;
        panel.add(label, gbc);
    }

    private void addComboBox(String[] items, int x, int y, JPanel panel) {
        JComboBox<String> comboBox = new JComboBox<>(items);
        gbc.gridx = x;
        gbc.gridy = y;
        panel.add(comboBox, gbc);
    }

    private void addTextField(int x, int y, JPanel panel) {
        addTextField(x, y, panel, "");
    }

    private void addTextField(int x, int y, JPanel panel, String placeholder) {
        JTextField textField = new JTextField(placeholder);
        gbc.gridx = x;
        gbc.gridy = y;
        panel.add(textField, gbc);
    }

    private void addRow() {
        model.addRow(new Object[]{"", "", "", "", "", ""});
    }

    private void deleteRow(int row) {
        if (model.getRowCount() > 1) {
            model.removeRow(row);
        }
        CalculateTotal();

    }


    private  JPanel getFooter(){
        JPanel panel = new JPanel(new BorderLayout());
        JLabel label = new JLabel("Total : ");
        totalText  = new JTextField();
        totalText.setEditable(false);
        panel. add(label,BorderLayout.WEST);
        panel.add(totalText,BorderLayout.CENTER);
        JButton btn = new JButton("Submit");
        btn.addActionListener(a->{
            addInvoice();
        });

        panel.add(btn, BorderLayout.SOUTH);
        return panel;
    }

    private  void addInvoice(){
        int storeId = ((Store) storeJCombox.getSelectedItem()).getId();
        int supplierId = ((Supplier) supplierComboBox.getSelectedItem()).getId();
        String note =noteTextField.getText();
        var order = new PurchasingInvoice();
        order.setEmployeeId(1); // change later
        order.setSupplierid(supplierId);
        order.setStoreId(storeId);
        order.setNote(note);
        order.setPurchasingInvoiceDate(new Date().toString());


        for(int i=0;i<model.getRowCount();i++){
            if(!model.getValueAt(i, 3).toString().isEmpty()){
                var orderDetail = new PurchasingInvoiceDetails();

                orderDetail.setProductId( ((Product) model.getValueAt(i,0)).getId());
                orderDetail.setQuantity( Double.parseDouble( model.getValueAt(i,1).toString()));
                orderDetail.setPrice( Double.parseDouble( model.getValueAt(i,2).toString()));
                order.getDetails().add(orderDetail);
            }


        }
        try {
            int orderId =    PurchasingInvoice.AddInvoice(order);
            JOptionPane.showMessageDialog(null,"Successfully Added Purchasing Invoice");
            // DefaultTableModel model = (DefaultTableModel) orderTable.getModel();
            model.setRowCount(0);

            addRow();
            addEventToGrid();
            //addRow();
            Map<String,Object> objectMap = new HashMap<>();
            objectMap.put("OrderID",orderId);
            //String path = InvoiceForm.class.getResource("../../Reports/Invoice.jrxml").getPath();
            //String decodedPath = URLDecoder.decode(path, "UTF-8");
            //new ReportViewer(path,objectMap);
            //JOptionPane.showMessageDialog(null,orderId);

            totalText.setText("0.0");
        } catch (SQLServerException e) {
            JOptionPane.showMessageDialog(null,e.getMessage(),"Error", JOptionPane.ERROR);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }
    private  void CalculateTotal(){
        double total =0;
        for(int i=0;i<model.getRowCount();i++){
            if(!model.getValueAt(i, 3).toString().isEmpty()){
                total+= Double.parseDouble( model.getValueAt(i, 3).toString());
            }


        }
        totalText.setText(String.valueOf( total));


    }
}
