package PresentationLayer;

import PresentationLayer.Helpers.ElementsFormData;
import PresentationLayer.Helpers.ElementsFormData;

import javax.swing.*;
import java.awt.*;

public class ElementForm extends JFrame {


    ElementsFormData abstact;

        public ElementForm(ElementsFormData abstact){
            this.abstact = abstact;

            InitialForm();

        }

        private void InitialForm() {
            setTitle(this.abstact.title);
            setDefaultCloseOperation(EXIT_ON_CLOSE);
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
            String column[]={"ID","NAME","SALARY"};
            String data[][]={ {"101","Amit","670000"},
                    {"102","Jai","780000"},
                    {"101","Sachin","700000"}};
            panel.setBorder(BorderFactory.createEmptyBorder(20,20,20,20));

            JTable table = new JTable(data,column);
            table.setFillsViewportHeight(true);
            JScrollPane sp=new JScrollPane(table);
            panel.add(sp);
            return panel;

        }
        private JPanel addButtons(){
            JPanel panel = new JPanel(new GridLayout(1,4,10,10));
            var buttonCreate = new JButton("Create");
            buttonCreate.addActionListener(abstact.actionListenerAddButton);
            var editButton = new JButton("Edit");
            editButton.addActionListener(abstact.actionListenerEditButton);
            var deleteButton = new JButton("Delete");
            deleteButton.addActionListener(abstact.actionListenerDeleteButton);
            var printButton = new JButton("Print");
            deleteButton.addActionListener(abstact.actionListenerPrintButton);
            panel.setBorder(BorderFactory.createEmptyBorder(20,20,20,20));
            panel.add(buttonCreate);
            panel.add(editButton);
            panel.add(deleteButton);
            panel.add(deleteButton);
            panel.add(printButton);
            return panel;
        }


}
