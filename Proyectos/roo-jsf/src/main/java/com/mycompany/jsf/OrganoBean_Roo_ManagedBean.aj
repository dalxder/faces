// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mycompany.jsf;

import com.mycompany.domain.Donante;
import com.mycompany.domain.Organo;
import com.mycompany.jsf.OrganoBean;
import com.mycompany.jsf.converter.DonanteConverter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import javax.faces.convert.DateTimeConverter;
import javax.faces.validator.LongRangeValidator;
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.calendar.Calendar;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.message.Message;
import org.primefaces.component.spinner.Spinner;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;

privileged aspect OrganoBean_Roo_ManagedBean {
    
    declare @type: OrganoBean: @ManagedBean(name = "organoBean");
    
    declare @type: OrganoBean: @SessionScoped;
    
    private String OrganoBean.name = "Organoes";
    
    private Organo OrganoBean.organo;
    
    private List<Organo> OrganoBean.allOrganoes;
    
    private boolean OrganoBean.dataVisible = false;
    
    private List<String> OrganoBean.columns;
    
    private HtmlPanelGrid OrganoBean.createPanelGrid;
    
    private HtmlPanelGrid OrganoBean.editPanelGrid;
    
    private HtmlPanelGrid OrganoBean.viewPanelGrid;
    
    private boolean OrganoBean.createDialogVisible = false;
    
    @PostConstruct
    public void OrganoBean.init() {
        columns = new ArrayList<String>();
        columns.add("precio");
        columns.add("nombre");
        columns.add("mejorAntesDe");
        columns.add("descripcion");
    }
    
    public String OrganoBean.getName() {
        return name;
    }
    
    public List<String> OrganoBean.getColumns() {
        return columns;
    }
    
    public List<Organo> OrganoBean.getAllOrganoes() {
        return allOrganoes;
    }
    
    public void OrganoBean.setAllOrganoes(List<Organo> allOrganoes) {
        this.allOrganoes = allOrganoes;
    }
    
    public String OrganoBean.findAllOrganoes() {
        allOrganoes = Organo.findAllOrganoes();
        dataVisible = !allOrganoes.isEmpty();
        return null;
    }
    
    public boolean OrganoBean.isDataVisible() {
        return dataVisible;
    }
    
    public void OrganoBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid OrganoBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void OrganoBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid OrganoBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void OrganoBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid OrganoBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void OrganoBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid OrganoBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText precioCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        precioCreateOutput.setId("precioCreateOutput");
        precioCreateOutput.setValue("Precio: * ");
        htmlPanelGrid.getChildren().add(precioCreateOutput);
        
        Spinner precioCreateInput = (Spinner) application.createComponent(Spinner.COMPONENT_TYPE);
        precioCreateInput.setId("precioCreateInput");
        precioCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{organoBean.organo.precio}", Integer.class));
        precioCreateInput.setRequired(true);
        precioCreateInput.setMin(5.0);
        LongRangeValidator precioCreateInputValidator = new LongRangeValidator();
        precioCreateInputValidator.setMinimum(5);
        precioCreateInput.addValidator(precioCreateInputValidator);
        
        htmlPanelGrid.getChildren().add(precioCreateInput);
        
        Message precioCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        precioCreateInputMessage.setId("precioCreateInputMessage");
        precioCreateInputMessage.setFor("precioCreateInput");
        precioCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(precioCreateInputMessage);
        
        HtmlOutputText nombreCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nombreCreateOutput.setId("nombreCreateOutput");
        nombreCreateOutput.setValue("Nombre: * ");
        htmlPanelGrid.getChildren().add(nombreCreateOutput);
        
        InputText nombreCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        nombreCreateInput.setId("nombreCreateInput");
        nombreCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{organoBean.organo.nombre}", String.class));
        htmlPanelGrid.getChildren().add(nombreCreateInput);
        
        Message nombreCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        nombreCreateInputMessage.setId("nombreCreateInputMessage");
        nombreCreateInputMessage.setFor("nombreCreateInput");
        nombreCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(nombreCreateInputMessage);
        
        HtmlOutputText mejorAntesDeCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        mejorAntesDeCreateOutput.setId("mejorAntesDeCreateOutput");
        mejorAntesDeCreateOutput.setValue("Mejor Antes De: * ");
        htmlPanelGrid.getChildren().add(mejorAntesDeCreateOutput);
        
        Calendar mejorAntesDeCreateInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        mejorAntesDeCreateInput.setId("mejorAntesDeCreateInput");
        mejorAntesDeCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{organoBean.organo.mejorAntesDe}", Date.class));
        mejorAntesDeCreateInput.setNavigator(true);
        mejorAntesDeCreateInput.setEffect("slideDown");
        mejorAntesDeCreateInput.setPattern("dd/MM/yyyy");
        mejorAntesDeCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(mejorAntesDeCreateInput);
        
        Message mejorAntesDeCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        mejorAntesDeCreateInputMessage.setId("mejorAntesDeCreateInputMessage");
        mejorAntesDeCreateInputMessage.setFor("mejorAntesDeCreateInput");
        mejorAntesDeCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(mejorAntesDeCreateInputMessage);
        
        HtmlOutputText descripcionCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        descripcionCreateOutput.setId("descripcionCreateOutput");
        descripcionCreateOutput.setValue("Descripcion:   ");
        htmlPanelGrid.getChildren().add(descripcionCreateOutput);
        
        InputText descripcionCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        descripcionCreateInput.setId("descripcionCreateInput");
        descripcionCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{organoBean.organo.descripcion}", String.class));
        htmlPanelGrid.getChildren().add(descripcionCreateInput);
        
        Message descripcionCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        descripcionCreateInputMessage.setId("descripcionCreateInputMessage");
        descripcionCreateInputMessage.setFor("descripcionCreateInput");
        descripcionCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(descripcionCreateInputMessage);
        
        HtmlOutputText donanteCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        donanteCreateOutput.setId("donanteCreateOutput");
        donanteCreateOutput.setValue("Donante: * ");
        htmlPanelGrid.getChildren().add(donanteCreateOutput);
        
        AutoComplete donanteCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        donanteCreateInput.setId("donanteCreateInput");
        donanteCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{organoBean.organo.donante}", Donante.class));
        donanteCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{organoBean.completeDonante}", List.class, new Class[] { String.class }));
        donanteCreateInput.setDropdown(true);
        donanteCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "donante", String.class));
        donanteCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{donante.nombre} #{donante.fechaNacimiento} #{donante.email}", String.class));
        donanteCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{donante}", Donante.class));
        donanteCreateInput.setConverter(new DonanteConverter());
        donanteCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(donanteCreateInput);
        
        Message donanteCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        donanteCreateInputMessage.setId("donanteCreateInputMessage");
        donanteCreateInputMessage.setFor("donanteCreateInput");
        donanteCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(donanteCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid OrganoBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText precioEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        precioEditOutput.setId("precioEditOutput");
        precioEditOutput.setValue("Precio: * ");
        htmlPanelGrid.getChildren().add(precioEditOutput);
        
        Spinner precioEditInput = (Spinner) application.createComponent(Spinner.COMPONENT_TYPE);
        precioEditInput.setId("precioEditInput");
        precioEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{organoBean.organo.precio}", Integer.class));
        precioEditInput.setRequired(true);
        precioEditInput.setMin(5.0);
        LongRangeValidator precioEditInputValidator = new LongRangeValidator();
        precioEditInputValidator.setMinimum(5);
        precioEditInput.addValidator(precioEditInputValidator);
        
        htmlPanelGrid.getChildren().add(precioEditInput);
        
        Message precioEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        precioEditInputMessage.setId("precioEditInputMessage");
        precioEditInputMessage.setFor("precioEditInput");
        precioEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(precioEditInputMessage);
        
        HtmlOutputText nombreEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nombreEditOutput.setId("nombreEditOutput");
        nombreEditOutput.setValue("Nombre: * ");
        htmlPanelGrid.getChildren().add(nombreEditOutput);
        
        InputText nombreEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        nombreEditInput.setId("nombreEditInput");
        nombreEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{organoBean.organo.nombre}", String.class));
        htmlPanelGrid.getChildren().add(nombreEditInput);
        
        Message nombreEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        nombreEditInputMessage.setId("nombreEditInputMessage");
        nombreEditInputMessage.setFor("nombreEditInput");
        nombreEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(nombreEditInputMessage);
        
        HtmlOutputText mejorAntesDeEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        mejorAntesDeEditOutput.setId("mejorAntesDeEditOutput");
        mejorAntesDeEditOutput.setValue("Mejor Antes De: * ");
        htmlPanelGrid.getChildren().add(mejorAntesDeEditOutput);
        
        Calendar mejorAntesDeEditInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        mejorAntesDeEditInput.setId("mejorAntesDeEditInput");
        mejorAntesDeEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{organoBean.organo.mejorAntesDe}", Date.class));
        mejorAntesDeEditInput.setNavigator(true);
        mejorAntesDeEditInput.setEffect("slideDown");
        mejorAntesDeEditInput.setPattern("dd/MM/yyyy");
        mejorAntesDeEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(mejorAntesDeEditInput);
        
        Message mejorAntesDeEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        mejorAntesDeEditInputMessage.setId("mejorAntesDeEditInputMessage");
        mejorAntesDeEditInputMessage.setFor("mejorAntesDeEditInput");
        mejorAntesDeEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(mejorAntesDeEditInputMessage);
        
        HtmlOutputText descripcionEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        descripcionEditOutput.setId("descripcionEditOutput");
        descripcionEditOutput.setValue("Descripcion:   ");
        htmlPanelGrid.getChildren().add(descripcionEditOutput);
        
        InputText descripcionEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        descripcionEditInput.setId("descripcionEditInput");
        descripcionEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{organoBean.organo.descripcion}", String.class));
        htmlPanelGrid.getChildren().add(descripcionEditInput);
        
        Message descripcionEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        descripcionEditInputMessage.setId("descripcionEditInputMessage");
        descripcionEditInputMessage.setFor("descripcionEditInput");
        descripcionEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(descripcionEditInputMessage);
        
        HtmlOutputText donanteEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        donanteEditOutput.setId("donanteEditOutput");
        donanteEditOutput.setValue("Donante: * ");
        htmlPanelGrid.getChildren().add(donanteEditOutput);
        
        AutoComplete donanteEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        donanteEditInput.setId("donanteEditInput");
        donanteEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{organoBean.organo.donante}", Donante.class));
        donanteEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{organoBean.completeDonante}", List.class, new Class[] { String.class }));
        donanteEditInput.setDropdown(true);
        donanteEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "donante", String.class));
        donanteEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{donante.nombre} #{donante.fechaNacimiento} #{donante.email}", String.class));
        donanteEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{donante}", Donante.class));
        donanteEditInput.setConverter(new DonanteConverter());
        donanteEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(donanteEditInput);
        
        Message donanteEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        donanteEditInputMessage.setId("donanteEditInputMessage");
        donanteEditInputMessage.setFor("donanteEditInput");
        donanteEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(donanteEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid OrganoBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText precioLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        precioLabel.setId("precioLabel");
        precioLabel.setValue("Precio:   ");
        htmlPanelGrid.getChildren().add(precioLabel);
        
        HtmlOutputText precioValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        precioValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{organoBean.organo.precio}", String.class));
        htmlPanelGrid.getChildren().add(precioValue);
        
        HtmlOutputText nombreLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nombreLabel.setId("nombreLabel");
        nombreLabel.setValue("Nombre:   ");
        htmlPanelGrid.getChildren().add(nombreLabel);
        
        HtmlOutputText nombreValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nombreValue.setId("nombreValue");
        nombreValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{organoBean.organo.nombre}", String.class));
        htmlPanelGrid.getChildren().add(nombreValue);
        
        HtmlOutputText mejorAntesDeLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        mejorAntesDeLabel.setId("mejorAntesDeLabel");
        mejorAntesDeLabel.setValue("Mejor Antes De:   ");
        htmlPanelGrid.getChildren().add(mejorAntesDeLabel);
        
        HtmlOutputText mejorAntesDeValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        mejorAntesDeValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{organoBean.organo.mejorAntesDe}", Date.class));
        DateTimeConverter mejorAntesDeValueConverter = (DateTimeConverter) application.createConverter(DateTimeConverter.CONVERTER_ID);
        mejorAntesDeValueConverter.setPattern("dd/MM/yyyy");
        mejorAntesDeValue.setConverter(mejorAntesDeValueConverter);
        htmlPanelGrid.getChildren().add(mejorAntesDeValue);
        
        HtmlOutputText descripcionLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        descripcionLabel.setId("descripcionLabel");
        descripcionLabel.setValue("Descripcion:   ");
        htmlPanelGrid.getChildren().add(descripcionLabel);
        
        HtmlOutputText descripcionValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        descripcionValue.setId("descripcionValue");
        descripcionValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{organoBean.organo.descripcion}", String.class));
        htmlPanelGrid.getChildren().add(descripcionValue);
        
        HtmlOutputText donanteLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        donanteLabel.setId("donanteLabel");
        donanteLabel.setValue("Donante:   ");
        htmlPanelGrid.getChildren().add(donanteLabel);
        
        HtmlOutputText donanteValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        donanteValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{organoBean.organo.donante}", Donante.class));
        donanteValue.setConverter(new DonanteConverter());
        htmlPanelGrid.getChildren().add(donanteValue);
        
        return htmlPanelGrid;
    }
    
    public Organo OrganoBean.getOrgano() {
        if (organo == null) {
            organo = new Organo();
        }
        return organo;
    }
    
    public void OrganoBean.setOrgano(Organo organo) {
        this.organo = organo;
    }
    
    public List<Donante> OrganoBean.completeDonante(String query) {
        List<Donante> suggestions = new ArrayList<Donante>();
        for (Donante donante : Donante.findAllDonantes()) {
            String donanteStr = String.valueOf(donante.getNombre() +  " "  + donante.getFechaNacimiento() +  " "  + donante.getEmail());
            if (donanteStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(donante);
            }
        }
        return suggestions;
    }
    
    public String OrganoBean.onEdit() {
        return null;
    }
    
    public boolean OrganoBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void OrganoBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String OrganoBean.displayList() {
        createDialogVisible = false;
        findAllOrganoes();
        return "organo";
    }
    
    public String OrganoBean.displayCreateDialog() {
        organo = new Organo();
        createDialogVisible = true;
        return "organo";
    }
    
    public String OrganoBean.persist() {
        String message = "";
        if (organo.getId() != null) {
            organo.merge();
            message = "Successfully updated";
        } else {
            organo.persist();
            message = "Successfully created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialog.hide()");
        context.execute("editDialog.hide()");
        
        FacesMessage facesMessage = new FacesMessage(message);
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllOrganoes();
    }
    
    public String OrganoBean.delete() {
        organo.remove();
        FacesMessage facesMessage = new FacesMessage("Successfully deleted");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllOrganoes();
    }
    
    public void OrganoBean.reset() {
        organo = null;
        createDialogVisible = false;
    }
    
    public void OrganoBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}