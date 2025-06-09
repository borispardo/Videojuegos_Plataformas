<%@ Page Title="Gestión de Videojuegos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Videojuegos.aspx.cs" Inherits="Videojuegos_Plataformas.Videojuegos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2 class="mb-4 text-primary">Gestión de Videojuegos</h2>

        <div class="card mb-4 shadow-sm">
            <div class="card-body">
                <asp:HiddenField ID="hfID" runat="server" />

                <div class="mb-3">
                    <asp:Label ID="lblTitulo" runat="server" Text="Título:" CssClass="form-label" />
                    <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <asp:Label ID="lblDesarrollador" runat="server" Text="Desarrollador:" CssClass="form-label" />
                    <asp:TextBox ID="txtDesarrollador" runat="server" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <asp:Label ID="lblFecha" runat="server" Text="Fecha de lanzamiento:" CssClass="form-label" />
                    <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" CssClass="form-control" />
                </div>

                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success me-2" OnClick="btnGuardar_Click" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary" OnClick="btnCancelar_Click" />
            </div>
        </div>

        <div class="card shadow-sm">
            <div class="card-body">
                <asp:GridView ID="gvVideojuegos" runat="server" CssClass="table table-bordered table-striped"
                    AutoGenerateColumns="False"
                    DataKeyNames="VideojuegoID"
                    OnRowEditing="gvVideojuegos_RowEditing"
                    OnRowDeleting="gvVideojuegos_RowDeleting"
                    OnRowCancelingEdit="gvVideojuegos_RowCancelingEdit"
                    OnRowUpdating="gvVideojuegos_RowUpdating">
                    <Columns>
                        <asp:BoundField DataField="Titulo" HeaderText="Título" />
                        <asp:BoundField DataField="Desarrollador" HeaderText="Desarrollador" />
                        <asp:BoundField DataField="Lanzamiento" HeaderText="Lanzamiento" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
