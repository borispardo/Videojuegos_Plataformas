<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VideojuegoPlataformas.aspx.cs" Inherits="Videojuegos_Plataformas.VideojuegoPlataformas" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Asociar Videojuegos con Plataformas</title>
    <style>
        body {
            font-family: Arial;
            margin: 30px;
            background-color: #f4f4f4;
        }
        h2 {
            color: #333;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            width: 500px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label,
        .form-group select {
            display: block;
            margin-bottom: 5px;
        }
        .btn {
            background-color: #007bff;
            border: none;
            color: white;
            padding: 6px 12px;
            text-decoration: none;
            border-radius: 4px;
            margin-right: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Asociar Videojuegos con Plataformas</h2>

        <div class="container">
            <div class="form-group">
                <asp:Label ID="lblVideojuego" runat="server" Text="Selecciona un Videojuego:" />
                <asp:DropDownList ID="ddlVideojuegos" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlVideojuegos_SelectedIndexChanged" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblPlataformas" runat="server" Text="Plataformas disponibles:" />
                <asp:CheckBoxList ID="cblPlataformas" runat="server" />
            </div>

            <asp:Button ID="btnGuardar" runat="server" Text="Guardar Asociaciones" CssClass="btn" OnClick="btnGuardar_Click" />
        </div>
    </form>
</body>
</html>
