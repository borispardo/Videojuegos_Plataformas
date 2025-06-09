<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Plataformas.aspx.cs" Inherits="Videojuegos_Plataformas.Plataformas" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Gestión de Plataformas</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
            background-color: #f4f4f4;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .form-container {
            background-color: #ffffff;
            padding: 20px;
            width: 400px;
            border: 1px solid #ccc;
            border-radius: 8px;
            margin-bottom: 30px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .form-container label,
        .form-container input[type="text"] {
            display: block;
            width: 100%;
        }

        .form-container input[type="text"] {
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-container input[type="submit"],
        .form-container input[type="button"],
        .form-container .aspNetButton {
            padding: 8px 16px;
            border: none;
            background-color: #007bff;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
            transition: background-color 0.3s ease;
        }

        .form-container input[type="submit"]:hover,
        .form-container input[type="button"]:hover,
        .form-container .aspNetButton:hover {
            background-color: #0056b3;
        }

        .grid-container {
            background-color: #ffffff;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .grid-container .aspNetGrid {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Gestión de Plataformas</h2>

        <div class="form-container">
            <asp:HiddenField ID="hfPlataformaID" runat="server" />

            <asp:Label ID="lblNombre" runat="server" Text="Nombre de Plataforma:" />
            <asp:TextBox ID="txtNombre" runat="server" />

            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="aspNetButton" OnClick="btnGuardar_Click" />
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="aspNetButton" OnClick="btnCancelar_Click" />
        </div>

        <div class="grid-container">
            <asp:GridView ID="gvPlataformas" runat="server" AutoGenerateColumns="False"
                CssClass="aspNetGrid"
                DataKeyNames="PlataformaID"
                OnRowEditing="gvPlataformas_RowEditing"
                OnRowDeleting="gvPlataformas_RowDeleting"
                OnRowCancelingEdit="gvPlataformas_RowCancelingEdit"
                OnRowUpdating="gvPlataformas_RowUpdating">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
