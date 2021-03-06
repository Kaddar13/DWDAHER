﻿<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/PADS/PADS.Master" CodeBehind="SU_NEW.aspx.cs" Inherits="DX_DAHERCMS.ToolBox.SPEEDUP.SU_NEW" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">
        var lastValidationResult = false;
        function OnContactMethodChanged(s, e) {
            var selectedIndex = s.GetSelectedIndex();
            //alert(selectedIndex);
            formLayout.GetItemByName("tabbedGroupPageControl").SetVisible(true);
            UpdateRadioButtonListDecoration(s);
            document.getElementById('<%= HiddenField1.ClientID %>').value = s.GetValue();
            tabbedGroupPageControl.SetActiveTabIndex(selectedIndex);

        }


        function OnTypeChanged(s, e) {
            var selectedIndex = s.GetSelectedIndex();
            formLayout.GetItemByName("SU_Localisation").SetVisible(true);
            formLayout.GetItemByName("tabbedGroupPageControl").SetVisible(false);

            if (selectedIndex == '1') {

                formLayout.GetItemByName("SU_Destinataire").SetVisible(true);
                formLayout.GetItemByName("Autres").SetVisible(false);

                cb_panel.PerformCallback(2);

            }
            else {
                formLayout.GetItemByName("SU_Destinataire").SetVisible(false);
                formLayout.GetItemByName("Autres").SetVisible(true);

                cb_panel.PerformCallback(1);

            }


            UpdateRadioButtonListDecoration(s);

        }

        function OnDestinataireChanged(s, e) {
            var selectedIndex = s.GetSelectedIndex();
            if (selectedIndex == '0' || selectedIndex == '1') 
                formLayout.GetItemByName("Su_TrpDediee").SetVisible(true);
            else 
            {
                formLayout.GetItemByName("Su_TrpDediee").SetVisible(false);
        }
            }
       
        function UpdateRadioButtonListDecoration(radioButtonList) {
            var selectedIndex = radioButtonList.GetSelectedIndex();
            for (var i = 0; i < radioButtonList.GetItemCount() ; i++)
                radioButtonList.GetItemElement(i).parentNode.className = i === selectedIndex ? "selectedElement" : "";
        }

        function OnTabbedGroupPageControlInit(s, e) {

            s.SetActiveTabIndex(radioButtonList.GetSelectedIndex());

        }

        function OnEmailValidation(s, e) {
            var valid = mail.GetText() == retypeEmail.GetText();
            if (s === retypeEmail && mail.GetIsValid())
                e.isValid = valid;
        }

        function OnValidationComplete(s, e) {
            lastValidationResult = e.isValid;
        }
    </script>

    <div>
        <dx:ASPxButton runat="server" OnClick="Unnamed_Click" Text="En" meta:resourcekey="ASPxButtonResource1"></dx:ASPxButton>
    </div>

    <dx:ASPxGlobalEvents runat="server" ClientSideEvents-ValidationCompleted="OnValidationComplete" />

    <dx:ASPxLabel runat="server" Text="Speed Up : 8,91€ / demande" Font-Bold="True" ForeColor="Black" meta:resourcekey="ASPxLabelResource1"></dx:ASPxLabel>

    <dx:ASPxFormLayout ID="formLayout" runat="server" ClientInstanceName="formLayout" Width="540px" meta:resourcekey="formLayoutResource1">
        <Items>
            <dx:LayoutGroup Caption="Creation Speed Up" CellStyle-Font-Size="Larger" ColCount="1" HorizontalAlign="Center" Width="540px" meta:resourcekey="LayoutGroupResource1">
                <CellStyle Font-Size="Larger"></CellStyle>
                <Items>
                    <dx:LayoutGroup ShowCaption="false" GroupBoxDecoration="none" meta:resourcekey="LayoutGroupResource2">
                        <Items>

                            <dx:LayoutItem Caption="Type Speed Up" meta:resourcekey="LayoutItemResource1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource1">

                                        <dx:ASPxRadioButtonList ID="Rbl_SU_Type" runat="server" ClientInstanceName="Rbl_Type"
                                            ClientSideEvents-SelectedIndexChanged="OnTypeChanged" ValueType="System.String" meta:resourcekey="Rbl_SU_TypeResource1">
                                            <ClientSideEvents Init="UpdateRadioButtonListDecoration" />
                                            <Items>
                                                <dx:ListEditItem Text="SpeedUp Interne (In-Situ)" Value="Interne" meta:resourcekey="ListEditItemResource1" />
                                                <dx:ListEditItem Text="SpeedUp Externe (inter-site et fournisseur externe)" Value="Externe" meta:resourcekey="ListEditItemResource2" />

                                            </Items>
                                            <ValidationSettings SetFocusOnError="True">
                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                            </ValidationSettings>
                                        </dx:ASPxRadioButtonList>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="EOTP" meta:resourcekey="LayoutItemResource2">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource2">
                                        <dx:ASPxTextBox ID="txt_SU_EOTP" runat="server" Width="170px" meta:resourcekey="txt_SU_EOTPResource1" MaxLength="50">
                                            <ValidationSettings SetFocusOnError="True">
                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                                                        <dx:LayoutItem Caption="N° AOG" meta:resourcekey="LayoutItemResource2">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource2">
                                        <dx:ASPxTextBox ID="txt_AOG" runat="server" Width="170px" meta:resourcekey="txt_SU_EOTPResource1" MaxLength="50">
                                                                                    </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Telephone du demandeur :" meta:resourcekey="LayoutItemResource3">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource3">
                                        <dx:ASPxTextBox ID="txt_telephone" runat="server" Width="170px" meta:resourcekey="txt_telephoneResource1" MaxLength="14">
                                            <ValidationSettings ErrorDisplayMode="Text" Display="Dynamic" ErrorTextPosition="Bottom" SetFocusOnError="true">

                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Email du demandeur :" meta:resourcekey="LayoutItemResource4">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource4">
                                        <dx:ASPxTextBox ID="txt_demandeur" runat="server" Width="170px" meta:resourcekey="txt_demandeurResource1">
                                            <ValidationSettings ErrorDisplayMode="Text" Display="Dynamic" ErrorTextPosition="Bottom" SetFocusOnError="true">
                                                <RegularExpression ErrorText="Invalid e-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Commentaire :" meta:resourcekey="LayoutItemResource5">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource5">
                                        <dx:ASPxMemo ID="txt_commentaire" runat="server" Width="170px" meta:resourcekey="txt_commentaireResource1">
                                            <ValidationSettings ErrorDisplayMode="Text" Display="Dynamic" ErrorTextPosition="Bottom" SetFocusOnError="true">
                                            </ValidationSettings>
                                        </dx:ASPxMemo>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>


                            <dx:LayoutItem Caption="Site" meta:resourcekey="LayoutItemResource6">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource6">
                                        <dx:ASPxComboBox ID="txt_SiteDepart" runat="server" ValueType="System.String" meta:resourcekey="txt_SiteDepartResource1">
                                            <Items>
                                                <dx:ListEditItem Text="MAR" Value="MAR" meta:resourcekey="ListEditItemResource3" />
                                                <dx:ListEditItem Text="DON" Value="DON" meta:resourcekey="ListEditItemResource4" />
                                                <dx:ListEditItem Text="ALB" Value="ALB" meta:resourcekey="ListEditItemResource5" />
                                                <dx:ListEditItem Text="LCN" Value="LCN" meta:resourcekey="ListEditItemResource6" />
                                            </Items>
                                            <ClearButton Visibility="Auto"></ClearButton>
                                            <ValidationSettings SetFocusOnError="True">
                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                            <dx:LayoutItem Name="SU_Destinataire" ClientVisible="false" Caption="Destinataire" meta:resourcekey="LayoutItemResource7">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource7">
                                        <dx:ASPxComboBox ID="txt_su_destinataire" runat="server" ValueType="System.String" meta:resourcekey="txt_su_destinataireResource1" ClientSideEvents-SelectedIndexChanged="OnDestinataireChanged">
<ClientSideEvents SelectedIndexChanged="OnDestinataireChanged"></ClientSideEvents>
                                            <Items>
                                                <dx:ListEditItem Text="DON" Value="DON" meta:resourcekey="ListEditItemResource7" />
                                                <dx:ListEditItem Text="ALB" Value="ALB" meta:resourcekey="ListEditItemResource7" />
                                                <dx:ListEditItem Text="Externe" Value="Externe" meta:resourcekey="ListEditItemResource8" />
                                            </Items>
                                            <ClearButton Visibility="Auto"></ClearButton>
                                            <ValidationSettings SetFocusOnError="True">
                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                            <dx:LayoutItem Name="Su_TrpDediee" ClientVisible="false" Caption="Transport Dediée" meta:resourcekey="LayoutItemResource8">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource8">
                                        <dx:ASPxComboBox ID="txt_trpDediee" runat="server" meta:resourcekey="txt_trpDedieeResource1">
                                            <Items>
                                                <dx:ListEditItem Text="Transport Dediee" Value="Oui" meta:resourcekey="ListEditItemResource9" />
                                                <dx:ListEditItem  Text="Transport Specifique" Value="Non" meta:resourcekey="ListEditItemResource10"/>
                                            </Items>
                                             <ClearButton Visibility="Auto"></ClearButton>
                                            <ValidationSettings SetFocusOnError="True">
                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox> 
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>


                            </dx:LayoutItem>
                            <dx:LayoutItem Name="SU_Localisation" ClientVisible="false" Caption="Localisation" meta:resourcekey="LayoutItemResource8">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource8">
                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                        <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" ClientInstanceName="cb_panel" runat="server" Width="200px" OnCallback="ASPxCallbackPanel1_Callback" meta:resourcekey="ASPxCallbackPanel1Resource1">
                                            <PanelCollection>
                                                <dx:PanelContent meta:resourcekey="PanelContentResource1">
                                                    <dx:ASPxRadioButtonList ID="txt_SU_Localisation" runat="server"
                                                        AllowNull="False" ClientInstanceName="radioButtonList"
                                                        ClientSideEvents-Init="UpdateRadioButtonListDecoration"
                                                        ClientSideEvents-SelectedIndexChanged="OnContactMethodChanged"
                                                        SelectedIndex="0"
                                                        DataSourceID="SqlDataSource2"
                                                        TextField="LOCALISATION"
                                                        ValueField="LOCALISATION" meta:resourcekey="txt_SU_LocalisationResource1" Width="314px">
                                                        <ClientSideEvents SelectedIndexChanged="OnContactMethodChanged" Init="UpdateRadioButtonListDecoration"></ClientSideEvents>
                                                         <ValidationSettings SetFocusOnError="True">
                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                            </ValidationSettings>
                                                        <CaptionCellStyle>
                                                            <Border BorderStyle="None" />
                                                        </CaptionCellStyle>
                                                    </dx:ASPxRadioButtonList>
                                                </dx:PanelContent>
                                            </PanelCollection>
                                        </dx:ASPxCallbackPanel>



                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ClientVisible="false" meta:resourcekey="LayoutItemResource9">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource9">
                                        <dx:ASPxComboBox ID="txt_SiteDepart2" runat="server" ValueType="System.String" meta:resourcekey="txt_SiteDepart2Resource1">
                                            <Items>
                                                <dx:ListEditItem Text="MAR" Value="MAR" meta:resourcekey="ListEditItemResource9" />
                                                <dx:ListEditItem Text="DON" Value="DON" meta:resourcekey="ListEditItemResource10" />
                                                <dx:ListEditItem Text="ALB" Value="ALB" meta:resourcekey="ListEditItemResource11" />
                                                <dx:ListEditItem Text="LCN" Value="LCN" meta:resourcekey="ListEditItemResource12" />
                                            </Items>
                                            <ClearButton Visibility="Auto"></ClearButton>
                                        </dx:ASPxComboBox>


                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                        </Items>
                    </dx:LayoutGroup>
                    <dx:TabbedLayoutGroup Name="tabbedGroupPageControl" ClientInstanceName="tabbedGroupPageControl" ShowGroupDecoration="false" ClientVisible="false" meta:resourcekey="TabbedLayoutGroupResource1">
                        <Items>

                            <dx:LayoutGroup Caption="Reception Fournisseur" GroupBoxDecoration="Headingline" ShowCaption="True" ColCount="2" meta:resourcekey="LayoutGroupResource3">
                                <Items>
                                    <dx:LayoutGroup Caption="Données Transport" meta:resourcekey="LayoutGroupResource4">
                                        <Items>
                                            <dx:LayoutItem Caption="Numéro de Tracking :" meta:resourcekey="LayoutItemResource10">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource10">
                                                        <dx:ASPxTextBox ID="txt_reception_track" runat="server" meta:resourcekey="txt_reception_trackResource1" MaxLength="50">
                                                            <ValidationSettings SetFocusOnError="True">
                                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                                                                    <dx:LayoutItem Caption="N° de BL:" meta:resourcekey="LayoutItemResource10">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource10">
                                                        <dx:ASPxTextBox ID="txt_BL1" runat="server" meta:resourcekey="txt_reception_trackResource1" MaxLength="50">
                                                           
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Fournisseur :" meta:resourcekey="LayoutItemResource11">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource11">
                                                        <asp:TextBox ID="txt_reception_fournisseur" runat="server" meta:resourcekey="txt_reception_fournisseurResource1" MaxLength="50">

                                                        </asp:TextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Transporteur :" meta:resourcekey="LayoutItemResource12">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource12">
                                                        <dx:ASPxTextBox ID="txt_reception_transporteur" runat="server" meta:resourcekey="txt_reception_transporteurResource1" MaxLength="50">
                                                            <ValidationSettings SetFocusOnError="True">
                                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Date de Livraison" meta:resourcekey="LayoutItemResource13">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource13">
                                                        <dx:ASPxDateEdit ID="txt_reception_datelivraion" runat="server" meta:resourcekey="txt_reception_datelivraionResource1">
                                                            <TimeSectionProperties>
                                                                <TimeEditProperties>
                                                                    
                                                                    <ClearButton Visibility="Auto"></ClearButton>
                                                                    
                                                                </TimeEditProperties>
                                                            </TimeSectionProperties>

                                                            <ClearButton Visibility="Auto"></ClearButton>

                                                        </dx:ASPxDateEdit>
                                                        <%--<asp:TextBox ID="txt_reception_datelivraion" runat="server"></asp:TextBox>--%>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Numéro BR :" meta:resourcekey="LayoutItemResource14">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource14">
                                                        <asp:TextBox ID="txt_reception_br" runat="server" meta:resourcekey="txt_reception_brResource1"  MaxLength="50">

                                                        </asp:TextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="ZLECI :" meta:resourcekey="LayoutItemResource15">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource15">
                                                        <asp:TextBox ID="txt_reception_zleci" runat="server" meta:resourcekey="txt_reception_zleciResource1"  MaxLength="50">

                                                        </asp:TextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Origine :" meta:resourcekey="LayoutItemResource16">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource16">
                                                        <%--<asp:TextBox ID="txt_reception_origine" runat="server"></asp:TextBox>--%>
                                                        <dx:ASPxComboBox ID="txt_reception_origine" runat="server" meta:resourcekey="txt_reception_origineResource1">
                                                            <Items>
                                                                <dx:ListEditItem Text="France" Value="France" meta:resourcekey="ListEditItemResource13" />
                                                                <dx:ListEditItem Text="International" Value="International" meta:resourcekey="ListEditItemResource14" />
                                                            </Items>

                                                            <ClearButton Visibility="Auto"></ClearButton>
                                                        </dx:ASPxComboBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>

                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Données matériel" meta:resourcekey="LayoutGroupResource5">
                                        <Items>
                                            <dx:LayoutItem Caption="Numéro commande :" meta:resourcekey="LayoutItemResource17">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource17">
                                                        <asp:TextBox ID="txt_reception_commande" runat="server" meta:resourcekey="txt_reception_commandeResource1"  MaxLength="50">

                                                        </asp:TextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Poste commande :" meta:resourcekey="LayoutItemResource18">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource18">
                                                        <asp:TextBox ID="txt_reception_postecommande" runat="server" MaxLength="50" meta:resourcekey="txt_reception_postecommandeResource1">

                                                        </asp:TextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Reference :" meta:resourcekey="LayoutItemResource19">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource19">
                                                        <dx:ASPxTextBox ID="txt_reference3"  MaxLength="50" runat="server" meta:resourcekey="txt_reference3Resource1">
                                                            <ValidationSettings SetFocusOnError="True">
                                                                <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Quantité :" meta:resourcekey="LayoutItemResource20">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource20">
                                                        <asp:TextBox ID="txt_quantite2" runat="server" meta:resourcekey="txt_quantite2Resource1">

                                                        </asp:TextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>

                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Autres renseignements" Name="Autres" ClientVisible="false" meta:resourcekey="LayoutGroupResource6">
                                        <Items>
                                            <dx:LayoutItem Caption="Je souhaite venir chercher le matériel au guichet R7:" meta:resourcekey="LayoutItemResource21">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource21">
                                                        <dx:ASPxComboBox ID="txt_autre_litige" runat="server" meta:resourcekey="txt_autre_litigeResource1">
                                                            <Items>
                                                                <dx:ListEditItem Text="OUI" Value="OUI" meta:resourcekey="ListEditItemResource15" />
                                                                <dx:ListEditItem Text="NON" Value="NON" meta:resourcekey="ListEditItemResource16" />
                                                            </Items>
                                                            <ClearButton Visibility="Auto"></ClearButton>
                                                        </dx:ASPxComboBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Commentaires :" meta:resourcekey="LayoutItemResource22">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource22">
                                                        <asp:TextBox ID="txt_autre_commentaire" runat="server" meta:resourcekey="txt_autre_commentaireResource1"></asp:TextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Livraison sous PVL :" meta:resourcekey="LayoutItemResource23">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource23">
                                                        <dx:ASPxComboBox ID="txt_autre_pvl" runat="server" meta:resourcekey="txt_autre_pvlResource1">
                                                            <Items>
                                                                <dx:ListEditItem Text="OUI" Value="OUI" meta:resourcekey="ListEditItemResource17" />
                                                                <dx:ListEditItem Text="NON" Value="NON" meta:resourcekey="ListEditItemResource18" />
                                                            </Items>

                                                            <ClearButton Visibility="Auto"></ClearButton>
                                                        </dx:ASPxComboBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                </Items>
                            </dx:LayoutGroup>

                            <dx:LayoutGroup Caption="Distribution inter-usine" GroupBoxDecoration="Headingline" ShowCaption="True" meta:resourcekey="LayoutGroupResource7">
                                <Items>
                                    <dx:LayoutItem Caption="Gare départ" meta:resourcekey="LayoutItemResource24">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource24">
                                                <dx:ASPxTextBox ID="txt_distribution_garedepart" runat="server" MaxLength="50" meta:resourcekey="txt_distribution_garedepartResource1">
                                                    <ValidationSettings SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Gare arrivée :" meta:resourcekey="LayoutItemResource25">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource25">
                                                <dx:ASPxTextBox ID="txt_distribution_garearrivee" MaxLength="50" runat="server" meta:resourcekey="txt_distribution_garearriveeResource1">
                                                    <ValidationSettings SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>

                                    <dx:LayoutItem Caption="N° Doc Libre / Liste de colisage :" meta:resourcekey="LayoutItemResource26">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource26">
                                                <dx:ASPxTextBox ID="txt_doclibre2" MaxLength="50" runat="server" meta:resourcekey="txt_doclibre2Resource1">
                                                    <ValidationSettings SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>

                                    <dx:LayoutItem Caption="Poids (Kg):" meta:resourcekey="LayoutItemResource27" >
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource27">
                                                <dx:ASPxTextBox ID="txt_distribution_poids" runat="server" meta:resourcekey="txt_distribution_poidsResource1">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Longueur (mm):" meta:resourcekey="LayoutItemResource28" >
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource28" >
                                                <dx:ASPxTextBox ID="txt_distribution_longueur" runat="server" meta:resourcekey="txt_distribution_longueurResource1" >
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Largeur (mm):" meta:resourcekey="LayoutItemResource29" >
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource29">
                                                <dx:ASPxTextBox ID="txt_distribution_largeur" runat="server" meta:resourcekey="txt_distribution_largeurResource1">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>

                                    <dx:LayoutItem Caption="Hauteur (mm):" meta:resourcekey="LayoutItemResource30">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource30">
                                                <dx:ASPxTextBox ID="txt_distribution_Hauteur" runat="server" meta:resourcekey="txt_distribution_HauteurResource1">
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>

                            <dx:LayoutGroup Caption="Stock" GroupBoxDecoration="Headingline" ShowCaption="True" meta:resourcekey="LayoutGroupResource8">
                                <Items>
								<dx:LayoutItem Caption="Je souhaite venir chercher le matériel au guichet R7:" meta:resourcekey="LayoutItemResource21" Visible="false">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource21">
                                                        <dx:ASPxComboBox ID="txt_autre_litige2" runat="server" meta:resourcekey="txt_autre_litigeResource1">
                                                            <Items>
                                                                <dx:ListEditItem Text="OUI" Value="OUI" meta:resourcekey="ListEditItemResource15" />
                                                                <dx:ListEditItem Text="NON" Value="NON" meta:resourcekey="ListEditItemResource16" />
                                                            </Items>
                                                            <ClearButton Visibility="Auto"></ClearButton>
                                                        </dx:ASPxComboBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>

                                    <dx:LayoutItem Caption="Numéro de Magasin :" meta:resourcekey="LayoutItemResource27">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource27">
                                                <dx:ASPxTextBox ID="txt_stock_mag" MaxLength="50" runat="server" meta:resourcekey="txt_stock_magResource1">
                         <ValidationSettings SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>                                                
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>

                                    <dx:LayoutItem Caption="OT / Resa :" meta:resourcekey="LayoutItemResource28">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource28">
                                                <dx:ASPxTextBox ID="txt_ot" MaxLength="50" runat="server" meta:resourcekey="txt_otResource1">
                                                    <ValidationSettings SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Poste" meta:resourcekey="LayoutItemResource29">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource29">
                                                <dx:ASPxTextBox ID="txt_ot_poste" MaxLength="50" runat="server" meta:resourcekey="txt_ot_posteResource1">
                                                    <ValidationSettings SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Reference :" meta:resourcekey="LayoutItemResource30">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource30">
                                                <dx:ASPxTextBox ID="txt_reference" MaxLength="50" runat="server" meta:resourcekey="txt_referenceResource1">
                                                    <ValidationSettings SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>

                            <dx:LayoutGroup Caption="Entrees sur dossier" GroupBoxDecoration="Headingline" ShowCaption="True" meta:resourcekey="LayoutGroupResource9">
                                <Items>
                                    <dx:LayoutItem Caption="Demandeur :" meta:resourcekey="LayoutItemResource31">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource31">
                                                <asp:TextBox ID="txt_dossier_demandeur" MaxLength="50" runat="server" meta:resourcekey="txt_dossier_demandeurResource1"></asp:TextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Numéro OF :"  meta:resourcekey="LayoutItemResource32">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource32">
                                                <asp:TextBox ID="txt_dossier_OF" MaxLength="50" runat="server" meta:resourcekey="txt_dossier_OFResource1"></asp:TextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>

                            <dx:LayoutGroup Caption="Guichet MACS" GroupBoxDecoration="Headingline" ShowCaption="True" meta:resourcekey="LayoutGroupResource10">
                                <Items>
                                    <dx:LayoutItem Caption="N° Livraison :" meta:resourcekey="LayoutItemResource31">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource31">
                                                <dx:ASPxTextBox ID="ASPxTextBox1" MaxLength="50" runat="server" meta:resourcekey="txt_referenceResource1">
                                                    <ValidationSettings SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    
                                </Items>
                            </dx:LayoutGroup>

                            <dx:LayoutGroup Caption="Expedition" GroupBoxDecoration="Headingline" ShowCaption="True" meta:resourcekey="LayoutGroupResource10">
                                <Items>
                                    <dx:LayoutItem Caption="OT / Resa :" meta:resourcekey="LayoutItemResource33">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource33">
                                                <dx:ASPxTextBox ID="txt_ot2" MaxLength="50" runat="server" meta:resourcekey="txt_ot2Resource1">
                                                    <ValidationSettings SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Poste" meta:resourcekey="LayoutItemResource34">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource34">
                                                <dx:ASPxTextBox ID="txt_otposte2" MaxLength="50" runat="server" meta:resourcekey="txt_otposte2Resource1">
                                                    <ValidationSettings SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Appareil :" meta:resourcekey="LayoutItemResource35">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource35">
                                                <asp:TextBox ID="txt_expedition_appareil" MaxLength="50" runat="server" meta:resourcekey="txt_expedition_appareilResource1"></asp:TextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="BE :" meta:resourcekey="LayoutItemResource36">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource36">
                                                <asp:TextBox ID="txt_expedition_be" runat="server" meta:resourcekey="txt_expedition_beResource1"></asp:TextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="FAL :" meta:resourcekey="LayoutItemResource37">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource37">
                                                <asp:TextBox ID="txt_expedition_fal" MaxLength="50" runat="server" meta:resourcekey="txt_expedition_falResource1"></asp:TextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Doc libre :" meta:resourcekey="LayoutItemResource38">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource38">
                                                <asp:TextBox ID="txt_doclibre" MaxLength="50" runat="server" meta:resourcekey="txt_doclibreResource1"></asp:TextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Reference :" meta:resourcekey="LayoutItemResource39">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource39">
                                                <dx:ASPxTextBox ID="txt_reference2" MaxLength="50" runat="server" meta:resourcekey="txt_reference2Resource1">
                                                    <ValidationSettings SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" ErrorText="Champs Obligatoire !" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Quantite :" meta:resourcekey="LayoutItemResource40">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource40">
                                                <asp:TextBox ID="txt_quantite" runat="server" meta:resourcekey="txt_quantiteResource1"></asp:TextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>

                           
                        </Items>
                    </dx:TabbedLayoutGroup>
                </Items>
            </dx:LayoutGroup>

            <dx:LayoutGroup ClientVisible="false" meta:resourcekey="LayoutGroupResource11">
                <Items>
                    <dx:LayoutItem meta:resourcekey="LayoutItemResource41">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource41">
                                <asp:TextBox ID="txt_designation" runat="server" meta:resourcekey="txt_designationResource1"></asp:TextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>



                </Items>
            </dx:LayoutGroup>

            <dx:LayoutItem ShowCaption="False" HorizontalAlign="Right" Width="150" meta:resourcekey="LayoutItemResource42">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True" meta:resourcekey="LayoutItemNestedControlContainerResource42">
                        <dx:ASPxButton ID="updateButton" runat="server" Text="Insert Speed Up" OnClick="updateButton_Click" Width="150" meta:resourcekey="updateButtonResource1" />
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
    </dx:ASPxFormLayout>


    <dx:ASPxLabel runat="server" ID="errorMessageLabel" ForeColor="Red" EnableViewState="False" EncodeHtml="False" meta:resourcekey="errorMessageLabelResource1" />
    <dx:ASPxLabel runat="server" ID="lbl_numspeed" ForeColor="Red" EnableViewState="False" EncodeHtml="False" meta:resourcekey="lbl_numspeedResource1" />

    <dx:ASPxLabel runat="server" ID="lbl_user" Visible="False" ForeColor="Red" meta:resourcekey="lbl_userResource1" />

    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" HeaderText="Speed-Up" ShowFooter="True" meta:resourcekey="ASPxPopupControl1Resource1"></dx:ASPxPopupControl>



    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        InsertCommand="INSERT INTO [T_SPEEDUP] 
        ([Autre_Litige], 
        [Autre_Commentaire], 
        [Autre_PVL], 
        [Designation],
         [Distribtuion_GareArrivee],
         [Distribtuion_GareDepart],
         [DocLibre],
         [Dossier_Demandeur], 
        [Dossier_OF],
         [Expedition_Appareil],
         [Expedition_BE],
         [Expedition_FAL],
         [OT], [OT_Poste], 
        [Quantite],
         [Reception_BR],
         [Reception_Commande],
         [Reception_DateLivraison],
         [Reception_Fournisseur],
         [Reception_Origine],
         [Reception_Track],
         [Reception_Transporteur],
         [Reception_ZLECI],
         [Reception_PosteCommande], 
        [Reference], 
        [Stock_Mag], 
        [SU_Destinataire],
         [SU_EOTP],
         [SU_Localisation],
         [SU_Site],
         [SU_SiteDepart],
         [SU_Type],
        [UserDemande],
        [SU_Commentaire],
        [SU_Telephone],
     [Distribution_Poids],
      [Distribution_Longeur],
      [Distribution_Largeur],
      [Distribution_Hauteur],
	  [Type_Demande],
        [SU_TrpDediee],
        [BL],
        [AOG],
        [SU_Affectation]
      ) 
        VALUES (
        @Autre_Litige, 
        @Autre_Commentaire, 
        @Autre_PVL, 
        @Designation,
        @Distribtuion_GareArrivee, 
        @Distribtuion_GareDepart, 
        @DocLibre, 
        @Dossier_Demandeur, @Dossier_OF, @Expedition_Appareil, @Expedition_BE, @Expedition_FAL, @OT, @OT_Poste, @Quantite, 
        @Reception_BR, @Reception_Commande, @Reception_DateLivraison, @Reception_Fournisseur, 
        @Reception_Origine, @Reception_Track, @Reception_Transporteur, @Reception_ZLECI, @Reception_PosteCommande, @Reference, @Stock_Mag, @SU_Destinataire,
         @SU_EOTP,
         @SU_Localisation, 
        @SU_Site,
         @SU_SiteDepart,
         @SU_Type,
        @UserDemande,
        @SU_Commentaire,
        @SU_Telephone,
        @Distribution_Poids,
        @Distribution_Longeur,
        @Distribution_Largeur,
        @Distribution_Hauteur,
		@Type_Demande,
        @SU_TrpDediee,
        @BL,
        @AOG,
        @SU_Affectation);
        SET @QuoteID = Scope_Identity();"
        OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT * FROM [T_SPEEDUP]"
        UpdateCommand="UPDATE [T_SPEEDUP] SET [Autre_Litige] = @Autre_Litige, [Autre_Commentaire] = @Autre_Commentaire, [Autre_PVL] = @Autre_PVL, [Designation] = @Designation, [Distribtuion_GareArrivee] = @Distribtuion_GareArrivee, [Distribtuion_GareDepart] = @Distribtuion_GareDepart, [DocLibre] = @DocLibre, [Dossier_Demandeur] = @Dossier_Demandeur, [Dossier_OF] = @Dossier_OF, [Expedition_Appareil] = @Expedition_Appareil, [Expedition_BE] = @Expedition_BE, [Expedition_FAL] = @Expedition_FAL, [OT] = @OT, [OT_Poste] = @OT_Poste, [Quantite] = @Quantite, [Reception_BR] = @Reception_BR, [Reception_Commande] = @Reception_Commande, [Reception_DateLivraison] = @Reception_DateLivraison, [Reception_Fournisseur] = @Reception_Fournisseur, [Reception_Origine] = @Reception_Origine, [Reception_Track] = @Reception_Track, [Reception_Transporteur] = @Reception_Transporteur, [Reception_ZLECI] = @Reception_ZLECI, [Reception_PosteCommande] = @Reception_PosteCommande, [Reference] = @Reference, [Stock_Mag] = @Stock_Mag, [SU_Destinataire] = @SU_Destinataire, [SU_EOTP] = @SU_EOTP, [SU_Localisation] = @SU_Localisation, [SU_Site] = @SU_Site, [SU_SiteDepart] = @SU_SiteDepart, [SU_Type] = @SU_Type WHERE [IDSPEEDUP] = @original_IDSPEEDUP AND (([Autre_Litige] = @original_Autre_Litige) OR ([Autre_Litige] IS NULL AND @original_Autre_Litige IS NULL)) AND (([Autre_Commentaire] = @original_Autre_Commentaire) OR ([Autre_Commentaire] IS NULL AND @original_Autre_Commentaire IS NULL)) AND (([Autre_PVL] = @original_Autre_PVL) OR ([Autre_PVL] IS NULL AND @original_Autre_PVL IS NULL)) AND (([Designation] = @original_Designation) OR ([Designation] IS NULL AND @original_Designation IS NULL)) AND (([Distribtuion_GareArrivee] = @original_Distribtuion_GareArrivee) OR ([Distribtuion_GareArrivee] IS NULL AND @original_Distribtuion_GareArrivee IS NULL)) AND (([Distribtuion_GareDepart] = @original_Distribtuion_GareDepart) OR ([Distribtuion_GareDepart] IS NULL AND @original_Distribtuion_GareDepart IS NULL)) AND (([DocLibre] = @original_DocLibre) OR ([DocLibre] IS NULL AND @original_DocLibre IS NULL)) AND (([Dossier_Demandeur] = @original_Dossier_Demandeur) OR ([Dossier_Demandeur] IS NULL AND @original_Dossier_Demandeur IS NULL)) AND (([Dossier_OF] = @original_Dossier_OF) OR ([Dossier_OF] IS NULL AND @original_Dossier_OF IS NULL)) AND (([Expedition_Appareil] = @original_Expedition_Appareil) OR ([Expedition_Appareil] IS NULL AND @original_Expedition_Appareil IS NULL)) AND (([Expedition_BE] = @original_Expedition_BE) OR ([Expedition_BE] IS NULL AND @original_Expedition_BE IS NULL)) AND (([Expedition_FAL] = @original_Expedition_FAL) OR ([Expedition_FAL] IS NULL AND @original_Expedition_FAL IS NULL)) AND (([OT] = @original_OT) OR ([OT] IS NULL AND @original_OT IS NULL)) AND (([OT_Poste] = @original_OT_Poste) OR ([OT_Poste] IS NULL AND @original_OT_Poste IS NULL)) AND (([Quantite] = @original_Quantite) OR ([Quantite] IS NULL AND @original_Quantite IS NULL)) AND (([Reception_BR] = @original_Reception_BR) OR ([Reception_BR] IS NULL AND @original_Reception_BR IS NULL)) AND (([Reception_Commande] = @original_Reception_Commande) OR ([Reception_Commande] IS NULL AND @original_Reception_Commande IS NULL)) AND (([Reception_DateLivraison] = @original_Reception_DateLivraison) OR ([Reception_DateLivraison] IS NULL AND @original_Reception_DateLivraison IS NULL)) AND (([Reception_Fournisseur] = @original_Reception_Fournisseur) OR ([Reception_Fournisseur] IS NULL AND @original_Reception_Fournisseur IS NULL)) AND (([Reception_Origine] = @original_Reception_Origine) OR ([Reception_Origine] IS NULL AND @original_Reception_Origine IS NULL)) AND (([Reception_Track] = @original_Reception_Track) OR ([Reception_Track] IS NULL AND @original_Reception_Track IS NULL)) AND (([Reception_Transporteur] = @original_Reception_Transporteur) OR ([Reception_Transporteur] IS NULL AND @original_Reception_Transporteur IS NULL)) AND (([Reception_ZLECI] = @original_Reception_ZLECI) OR ([Reception_ZLECI] IS NULL AND @original_Reception_ZLECI IS NULL)) AND (([Reception_PosteCommande] = @original_Reception_PosteCommande) OR ([Reception_PosteCommande] IS NULL AND @original_Reception_PosteCommande IS NULL)) AND (([Reference] = @original_Reference) OR ([Reference] IS NULL AND @original_Reference IS NULL)) AND (([Stock_Mag] = @original_Stock_Mag) OR ([Stock_Mag] IS NULL AND @original_Stock_Mag IS NULL)) AND (([SU_Destinataire] = @original_SU_Destinataire) OR ([SU_Destinataire] IS NULL AND @original_SU_Destinataire IS NULL)) AND (([SU_EOTP] = @original_SU_EOTP) OR ([SU_EOTP] IS NULL AND @original_SU_EOTP IS NULL)) AND (([SU_Localisation] = @original_SU_Localisation) OR ([SU_Localisation] IS NULL AND @original_SU_Localisation IS NULL)) AND (([SU_Site] = @original_SU_Site) OR ([SU_Site] IS NULL AND @original_SU_Site IS NULL)) AND (([SU_SiteDepart] = @original_SU_SiteDepart) OR ([SU_SiteDepart] IS NULL AND @original_SU_SiteDepart IS NULL)) AND (([SU_Type] = @original_SU_Type) OR ([SU_Type] IS NULL AND @original_SU_Type IS NULL))"
        OnInserted="SqlDataSource1_Inserted">

        <InsertParameters>
            <asp:Parameter Name="Autre_Litige" Type="String" />
            <asp:Parameter Name="Autre_Commentaire" Type="String" />
            <asp:Parameter Name="Autre_PVL" Type="String" />
            <asp:Parameter Name="Designation" Type="String" />
            <asp:Parameter Name="Distribtuion_GareArrivee" Type="String" />
            <asp:Parameter Name="Distribtuion_GareDepart" Type="String" />
            <asp:Parameter Name="DocLibre" Type="String" />
            <asp:Parameter Name="Dossier_Demandeur" Type="String" />
            <asp:Parameter Name="Dossier_OF" Type="String" />
            <asp:Parameter Name="Expedition_Appareil" Type="String" />
            <asp:Parameter Name="Expedition_BE" Type="String" />
            <asp:Parameter Name="Expedition_FAL" Type="String" />
            <asp:Parameter Name="OT" Type="String" />
            <asp:Parameter Name="OT_Poste" Type="String" />
            <asp:Parameter Name="Quantite" Type="String" />
            <asp:Parameter Name="Reception_BR" Type="String" />
            <asp:Parameter Name="Reception_Commande" Type="String" />
            <asp:Parameter DbType="Date" Name="Reception_DateLivraison" />
            <asp:Parameter Name="Reception_Fournisseur" Type="String" />
            <asp:Parameter Name="Reception_Origine" Type="String" />
            <asp:Parameter Name="Reception_Track" Type="String" />
            <asp:Parameter Name="Reception_Transporteur" Type="String" />
            <asp:Parameter Name="Reception_ZLECI" Type="String" />
            <asp:Parameter Name="Reception_PosteCommande" Type="String" />
            <asp:Parameter Name="Reference" Type="String" />
            <asp:Parameter Name="Stock_Mag" Type="String" />
            <asp:Parameter Name="SU_Destinataire" Type="String" />
            <asp:Parameter Name="SU_EOTP" Type="String" />
            <asp:Parameter Name="SU_Localisation" Type="String" />
            <asp:Parameter Name="SU_Site" Type="String" />
            <asp:Parameter Name="SU_Affectation" Type="String" />
            <asp:Parameter Name="SU_SiteDepart" Type="String" />
            <asp:Parameter Name="SU_Type" Type="String" />
            <asp:Parameter Name="UserDemande" Type="String" />
            <asp:Parameter Name="SU_Commentaire" Type="String" />
            <asp:Parameter Name="SU_Telephone" Type="String" />
            <asp:Parameter Name="Distribution_Poids" Type="Double" />
            <asp:Parameter Name="Distribution_Longeur" Type="Double" />
            <asp:Parameter Name="Distribution_Largeur" Type="Double" />
            <asp:Parameter Name="Distribution_Hauteur" Type="Double" />
            <asp:Parameter Name="QuoteID" Direction="Output" Type="Int32"/>
			<asp:Parameter Name="Type_Demande" Type="String" DefaultValue="SpeedUp"/>
            <asp:Parameter Name="SU_TrpDediee" Type="String" />
            <asp:Parameter Name="BL" Type="String" />
            <asp:Parameter Name="AOG" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Autre_Litige" Type="String" />
            <asp:Parameter Name="Autre_Commentaire" Type="String" />
            <asp:Parameter Name="Autre_PVL" Type="Int32" />
            <asp:Parameter Name="Designation" Type="String" />
            <asp:Parameter Name="Distribtuion_GareArrivee" Type="String" />
            <asp:Parameter Name="Distribtuion_GareDepart" Type="String" />
            <asp:Parameter Name="DocLibre" Type="String" />
            <asp:Parameter Name="Dossier_Demandeur" Type="String" />
            <asp:Parameter Name="Dossier_OF" Type="String" />
            <asp:Parameter Name="Expedition_Appareil" Type="String" />
            <asp:Parameter Name="Expedition_BE" Type="String" />
            <asp:Parameter Name="Expedition_FAL" Type="String" />
            <asp:Parameter Name="OT" Type="String" />
            <asp:Parameter Name="OT_Poste" Type="String" />
            <asp:Parameter Name="Quantite" Type="String" />
            <asp:Parameter Name="Reception_BR" Type="String" />
            <asp:Parameter Name="Reception_Commande" Type="String" />
            <asp:Parameter DbType="Date" Name="Reception_DateLivraison" />
            <asp:Parameter Name="Reception_Fournisseur" Type="String" />
            <asp:Parameter Name="Reception_Origine" Type="String" />
            <asp:Parameter Name="Reception_Track" Type="String" />
            <asp:Parameter Name="Reception_Transporteur" Type="String" />
            <asp:Parameter Name="Reception_ZLECI" Type="String" />
            <asp:Parameter Name="Reception_PosteCommande" Type="String" />
            <asp:Parameter Name="Reference" Type="String" />
            <asp:Parameter Name="Stock_Mag" Type="String" />
            <asp:Parameter Name="SU_Destinataire" Type="String" />
            <asp:Parameter Name="SU_EOTP" Type="String" />
            <asp:Parameter Name="SU_Localisation" Type="String" />
            <asp:Parameter Name="SU_Site" Type="String" />
            <asp:Parameter Name="SU_SiteDepart" Type="String" />
            <asp:Parameter Name="SU_Type" Type="Int32" />
                        <asp:Parameter Name="original_IDSPEEDUP" Type="Int32" />
            <asp:Parameter Name="original_Autre_Litige" Type="String" />
            <asp:Parameter Name="original_Autre_Commentaire" Type="String" />
            <asp:Parameter Name="original_Autre_PVL" Type="Int32" />
            <asp:Parameter Name="original_Designation" Type="String" />
            <asp:Parameter Name="original_Distribtuion_GareArrivee" Type="String" />
            <asp:Parameter Name="original_Distribtuion_GareDepart" Type="String" />
            <asp:Parameter Name="original_DocLibre" Type="String" />
            <asp:Parameter Name="original_Dossier_Demandeur" Type="String" />
            <asp:Parameter Name="original_Dossier_OF" Type="String" />
            <asp:Parameter Name="original_Expedition_Appareil" Type="String" />
            <asp:Parameter Name="original_Expedition_BE" Type="String" />
            <asp:Parameter Name="original_Expedition_FAL" Type="String" />
            <asp:Parameter Name="original_OT" Type="String" />
            <asp:Parameter Name="original_OT_Poste" Type="String" />
            <asp:Parameter Name="original_Quantite" Type="String" />
            <asp:Parameter Name="original_Reception_BR" Type="String" />
            <asp:Parameter Name="original_Reception_Commande" Type="String" />
            <asp:Parameter DbType="Date" Name="original_Reception_DateLivraison" />
            <asp:Parameter Name="original_Reception_Fournisseur" Type="String" />
            <asp:Parameter Name="original_Reception_Origine" Type="String" />
            <asp:Parameter Name="original_Reception_Track" Type="String" />
            <asp:Parameter Name="original_Reception_Transporteur" Type="String" />
            <asp:Parameter Name="original_Reception_ZLECI" Type="String" />
            <asp:Parameter Name="original_Reception_PosteCommande" Type="String" />
            <asp:Parameter Name="original_Reference" Type="String" />
            <asp:Parameter Name="original_Stock_Mag" Type="String" />
            <asp:Parameter Name="original_SU_Destinataire" Type="String" />
            <asp:Parameter Name="original_SU_EOTP" Type="String" />
            <asp:Parameter Name="original_SU_Localisation" Type="String" />
            <asp:Parameter Name="original_SU_Site" Type="String" />
            <asp:Parameter Name="original_SU_SiteDepart" Type="String" />
            <asp:Parameter Name="original_SU_Type" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT * FROM [T_SpeedUp_Localisation] WHERE ([Type] = @Types) Order By Ordre">

        <SelectParameters>
            <asp:Parameter Name="Types" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


 <asp:SqlDataSource ID="DS_Mouvement" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        InsertCommand="INSERT INTO 
        [T_SpeedUp_Mouvement] 
        (
        [Statut], 
        [Affectation],
        [IDSPEEDUP] 
       ) 
        VALUES 
        (
        @Statut, 
        @Affectation,
        @ID_SPEEDUP
        
        )"
        OldValuesParameterFormatString="original_{0}">

        <InsertParameters>
            <asp:Parameter Name="Date_Mouvement" Type="DateTime" />
            <asp:Parameter Name="Statut" Type="String" />
            <asp:Parameter Name="ID_SPEEDUP" Type="Int32" />
            <asp:Parameter Name="Affectation" Type="String" />
            <asp:Parameter Name="Commentaire" Type="String" />
        </InsertParameters>

    </asp:SqlDataSource>


</asp:Content>



