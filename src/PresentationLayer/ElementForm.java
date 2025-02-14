package PresentationLayer;

import PresentationLayer.Helpers.ElementsFormData;
import PresentationLayer.Helpers.ElementsFormData;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;

public abstract   class ElementForm extends JFrame {

   protected JTable table ;
   protected ElementsFormData abstact;
    int selectedID;



        public ElementForm(ElementsFormData abstact){
            this.abstact = abstact;

            InitialForm();

        }

        private void InitialForm() {
            setTitle(this.abstact.title);
            setDefaultCloseOperation(DISPOSE_ON_CLOSE);
            Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
            setLayout(new BorderLayout());
            setSize(1000,800);
            setLocationRelativeTo(null);
            add(addingTitle(),BorderLayout.NORTH) ;
            add(addGrid(),BorderLayout.CENTER)   ;
            add(addButtons(),BorderLayout.SOUTH);
        }

        private JPanel  addingTitle(){

            JLabel label = new JLabel();
            label.setText(this.abstact.title);
            label.setFont(new Font("Arial",Font.BOLD,25));
            JPanel panel = new JPanel(new FlowLayout(FlowLayout.LEFT, 25, 25));
            panel.add(label);
            return panel;
        }
        private JPanel addGrid(){
            JPanel panel = new JPanel(new GridLayout(1,1));

            panel.setBorder(BorderFactory.createEmptyBorder(20,20,20,20));

            table= new JTable(abstact.tableModel);
            table.setFillsViewportHeight(true);
            JScrollPane sp=new JScrollPane(table);
            panel.add(sp);
            return panel;

        }
        private JPanel addButtons(){
            JPanel panel = new JPanel(new GridLayout(1,4,10,10));
            var buttonCreate = new JButton("Create");
            buttonCreate.addActionListener(this::addNewElement);
            var editButton = new JButton("Edit");
            editButton.addActionListener(this::editNewElement);
            var deleteButton = new JButton("Delete");
            deleteButton.addActionListener(this::deleteElement);
            var printButton = new JButton("Print");
            deleteButton.addActionListener(this::printElement);
            panel.setBorder(BorderFactory.createEmptyBorder(20,20,20,20));
            panel.add(buttonCreate);
            panel.add(editButton);
            panel.add(deleteButton);
            panel.add(deleteButton);
            panel.add(printButton);
            return panel;
        }

       public abstract  void addNewElement(ActionEvent event);
    public abstract  void editNewElement(ActionEvent event);
    public abstract  void deleteElement(ActionEvent event);
    public abstract  void printElement(ActionEvent event);
    public abstract  void reloadData(DefaultTableModel table);

    public int getID(){
        var selectedRowIndex= this.table.getSelectedRow();
        if(selectedRowIndex != -1){
           return (int) table.getValueAt(selectedRowIndex, 0);
        }
        else{
            return -1;
        }
    }



}
