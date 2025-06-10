<%@ Page Title="Asociar Videojuegos y Plataformas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VideojuegoPlataformas.aspx.cs" Inherits="Videojuegos_Plataformas.VideojuegoPlataformas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2 class="mb-4 text-primary">Asociar Videojuegos con Plataformas</h2>

        <div class="card shadow-sm mb-4">
            <div class="card-body">
                <div class="mb-3">
                    <asp:Label ID="lblVideojuego" runat="server" Text="Selecciona un Videojuego de tu gusto:" CssClass="form-label" />
                    <asp:DropDownList ID="ddlVideojuegos" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlVideojuegos_SelectedIndexChanged" />
                </div>

                <div class="mb-3">
                    <asp:Label ID="lblPlataformas" runat="server" Text="Plataformas disponibles:" CssClass="form-label" />
                    <asp:CheckBoxList ID="cblPlataformas" runat="server" CssClass="form-check"
                        RepeatDirection="Vertical" RepeatLayout="Table" />
                </div>

                <asp:Button ID="btnGuardar" runat="server" Text="Guardar Asociaciones" CssClass="btn btn-success me-2" OnClick="btnGuardar_Click" />
            </div>
        </div>

        <div class="card shadow-sm">
            <div class="card-body">
                <h4 class="text-secondary mb-3">Asociaciones registradas</h4>
                <asp:GridView ID="gvAsociaciones" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="true" />
            </div>
        </div>
    </div>
</asp:Content>
