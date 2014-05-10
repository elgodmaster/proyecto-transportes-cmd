<%@ Page Title="" Language="C#" MasterPageFile="~/intranet/MDI.Master" AutoEventWireup="true" CodeBehind="frmMantenedorBus.aspx.cs" Inherits="Presentacion.intranet.frmMantenedorBus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/css_roque.css" type="text/css" media="screen, projection" rel="stylesheet" />
   
      <link rel="stylesheet" href="pruebas/chosen.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cuerpo" runat="server">
    <div class="container">

                    <div class="alert alert-block alert-info">
                        <p>
                            ACTUALIZAR VEHÍCULO
                        </p>
                    </div>
                    <div class="row">
                        <div id="acct-password-row" class="span7">
                            <fieldset>
                                <legend></legend><br/>
                                <div class="control-group ">
                                    <label class="control-label">Marca<span class="required">*</span></label>
                                    <div class="controls">
                                        <input id="current-pass-control" name="password" class="span4" type="text" value="" autocomplete="false">

                                    </div>
                                </div>
                                <div class="control-group ">
                                    <label class="control-label">Modelo<span class="required">*</span></label>
                                    <div class="controls">
                                        <input id="new-pass-control" name="newPassword" class="span4" type="text" value="" autocomplete="false">

                                    </div>
                                </div>
                                <div class="control-group ">
                                    <label class="control-label">Nro de Asientos 1er Piso<span class="required">*</span></label>
                                    <div class="controls">
                                        <input id="new-pass-verify-control" name="newPasswordVerification" class="span4" type="text" value="" autocomplete="false">

                                    </div>
                                </div>
                                <div class="control-group ">
                                    <label class="control-label">Nro de Asientos 2do Piso<span class="required">*</span></label>
                                    <div class="controls">
                                        <input id="Password1" name="newPasswordVerification" class="span4" type="text" value="" autocomplete="false">

                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div id="acct-verify-row" class="span9">
                            <fieldset>
                                <legend></legend>
                                <div class="control-group">
                                    <label class="control-label">Imagen<span class="required">*</span></label>
                                    <div class="controls">
                                        <input id="Password2" name="challengeAnswer" class="span5" type="text" value="" autocomplete="false">

                                    </div>
                                </div>
                                <div class="control-group ">
                                    <label class="control-label">Fecha de Registro<span class="required">*</span></label>
                                    <div class="controls">
                                        <input id="challenge-answer-control" name="challengeAnswer" class="span5" type="text" value="" autocomplete="false">

                                    </div>
                                </div>
                                <div class="control-group ">
                                    <label class="control-label">Estado<span class="required">*</span></label>
                                    <div class="td-actions">                                        
                                        <a href="javascript:;" class="btn btn-small btn-info">
                                                    <i class="btn-icon-only icon-ok"></i>
                                        </a>
                                        <a href="javascript:;" class="btn btn-small btn-danger">
                                                    <i class="btn-icon-only icon-remove"></i>
                                         </a>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                    <footer id="submit-actions" class="form-actions">
                        <button id="submit-button" type="submit" class="btn btn-primary" name="action" value="CONFIRM">Save</button>
                        <button type="submit" class="btn" name="action" value="CANCEL">Cancel</button>
                    </footer>
                </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
</asp:Content>
