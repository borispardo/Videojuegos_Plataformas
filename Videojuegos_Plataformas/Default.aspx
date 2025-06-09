<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Videojuegos_Plataformas._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center mt-5">
        <h1 class="display-4">🎮 Bienvenido al sistema de Videojuegos y Plataformas</h1>
        <p class="lead mt-3">
            Administra fácilmente tus videojuegos, las plataformas donde están disponibles y sus asociaciones.
        </p>
    </div>

    <div class="row text-center mt-5">
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">📋 Videojuegos</h5>
                    <p class="card-text">Agrega, edita y elimina información sobre videojuegos disponibles.</p>
                    <a href="Videojuegos.aspx" class="btn btn-primary">Ir a Videojuegos</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 mt-4 mt-md-0">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">🕹️ Plataformas</h5>
                    <p class="card-text">Gestiona las plataformas como PS5, Xbox, PC y más.</p>
                    <a href="Plataformas.aspx" class="btn btn-success">Ir a Plataformas</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 mt-4 mt-md-0">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">🔗 Asociaciones</h5>
                    <p class="card-text">Relaciona los videojuegos con sus plataformas disponibles.</p>
                    <a href="VideojuegoPlataformas.aspx" class="btn btn-warning">Ir a Asociaciones</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
