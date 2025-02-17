package PresentationLayer.OrderInvoiceForm;

import BusineesLayer.Customer;
import BusineesLayer.Product;

import javax.swing.*;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class InvoiceForm extends JFrame {
    private final GridBagConstraints gbc = new GridBagConstraints();
    private DefaultTableModel model;
    private JTable orderTable;
    JComboBox<Customer> customerJComboBox;
    //private String[] productOptions = {"Product A", "Product B", "Product C", "Product D"};

    public InvoiceForm() {
        setTitle("Invoice");
        setSize(900, 600);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setLayout(new BorderLayout(10, 10));

        // Title Panel
        JPanel invoiceTitlePanel = new JPanel();
        JLabel titleLabel = new JLabel("Invoice");
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
        addLabel("Customer", 0, 0, formPanel);
       // addComboBox(new String[]{"Testing Customer 1", "Testing Customer 2"}, 1, 0, formPanel);
        customerJComboBox = new JComboBox<>(Customer.GetAllCustomers().toArray(new Customer[0]));
        gbc.gridx = 1;
        gbc.gridy = 0;
        formPanel.add(customerJComboBox, gbc);

        addLabel("Store", 2, 0, formPanel);
        addComboBox(new String[]{"Testing Store 1", "Testing Store 2"}, 3, 0, formPanel);

        // Row 2: Date & Note
        addLabel("Date", 0, 1, formPanel);
        addTextField(1, 1, formPanel);

        addLabel("Note", 2, 1, formPanel);
        addTextField(3, 1, formPanel, "Note");

        // Row 3: Invoice Type
        addLabel("Invoice Type", 0, 2, formPanel);
        addTextField(1, 2, formPanel, "Invoice Type");

        // Table Section
        String[] columns = {"Product", "Quantity", "Price", "VAT Tax", "Discount", "Total Price"};
        model = new DefaultTableModel(columns, 0);
        orderTable = new JTable(model);

        // Set ComboBox in "Product" Column
        TableColumn productColumn = orderTable.getColumnModel().getColumn(0);
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
        model.addTableModelListener(new TableModelListener() {
            @Override
            public void tableChanged(TableModelEvent e) {
                if (e.getType() == TableModelEvent.UPDATE) {
                    int rowCount = model.getRowCount();
                    int columnCount = model.getColumnCount();

                    if (rowCount > 0) {
                        boolean lastRowFilled = true;

                        for (int i = 0; i < columnCount; i++) {
                            Object cellValue = model.getValueAt(rowCount - 1, i);
                            if (cellValue == null || cellValue.toString().trim().isEmpty()) {
                                lastRowFilled = false;
                                break;
                            }
                        }

                        if (lastRowFilled) {
                            addRow(); // Add a new row only when the last one is completely filled
                        }
                    }
                }
            }
        });

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

        add(formPanel, BorderLayout.CENTER);
        setVisible(true);
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
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(InvoiceForm::new);
    }
}
