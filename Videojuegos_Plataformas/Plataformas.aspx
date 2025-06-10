<%@ Page Title="Gestión de Plataformas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Plataformas.aspx.cs" Inherits="Videojuegos_Plataformas.Plataformas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2 class="mb-4 text-primary">Gestión de Plataformas</h2>

        <div class="card mb-4 shadow-sm">
            <div class="card-body">
                <asp:HiddenField ID="hfID" runat="server" />

                <div class="mb-3">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre de Plataforma:" CssClass="form-label" />
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                </div>

                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success me-2" OnClick="btnGuardar_Click" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary" OnClick="btnCancelar_Click" />
            </div>
        </div>

        <div class="card shadow-sm">
            <div class="card-body">
                <asp:GridView ID="gvPlataformas" runat="server" CssClass="table table-bordered table-striped"
                    AutoGenerateColumns="False"
                    DataKeyNames="PlataformaID"
                    OnRowEditing="gvPlataformas_RowEditing"
                    OnRowDeleting="gvPlataformas_RowDeleting"
                    OnRowCancelingEdit="gvPlataformas_RowCancelingEdit"
                    OnRowUpdating="gvPlataformas_RowUpdating">
                    <Columns>
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre de Plataforma" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
