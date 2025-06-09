<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Videojuegos.aspx.cs" Inherits="Videojuegos_Plataformas.Videojuegos" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Gestión de Videojuegos</title>
    <style>
        body {
            font-family: Arial;
            margin: 30px;
            background-color: #f4f4f4;
        }
        h2 {
            color: #333;
        }
        .form-container {
            background-color: #fff;
            padding: 20px;
            width: 400px;
            border: 1px solid #ccc;
            border-radius: 8px;
            margin-bottom: 30px;
        }
        .form-container input[type="text"],
        .form-container input[type="date"] {
            width: 100%;
            padding: 6px;
            margin-bottom: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        .form-container input[type="submit"],
        .form-container input[type="button"] {
            padding: 6px 12px;
            border: none;
            background-color: #007bff;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 5px;
        }
        .form-container input[type="submit"]:hover,
        .form-container input[type="button"]:hover {
            background-color: #0056b3;
        }
        .grid-container {
            background-color: #fff;
            padding: 10px;
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Gestión de Videojuegos</h2>

        <div class="form-container">
            <asp:HiddenField ID="hfID" runat="server" />

            <asp:Label ID="lblTitulo" runat="server" Text="Título: " />
            <asp:TextBox ID="txtTitulo" runat="server" />

            <asp:Label ID="lblDesarrollador" runat="server" Text="Desarrollador: " />
            <asp:TextBox ID="txtDesarrollador" runat="server" />

            <asp:Label ID="lblFecha" runat="server" Text="Fecha de lanzamiento: " />
            <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" />

            <br />
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
        </div>

        <div class="grid-container">
            <asp:GridView ID="gvVideojuegos" runat="server" AutoGenerateColumns="False"
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
    </form>
</body>
</html>
