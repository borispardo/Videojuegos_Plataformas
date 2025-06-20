﻿using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Videojuegos_Plataformas
{
    public partial class VideojuegoPlataformas : System.Web.UI.Page
    {
        string conexion = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarVideojuegos();
                CargarPlataformas();
                CargarGridAsociaciones();  // Cargar tabla al iniciar
            }
        }

        private void CargarVideojuegos()
        {
            using (SqlConnection con = new SqlConnection(conexion))
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT VideojuegoID, Titulo FROM Videojuego", con))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddlVideojuegos.DataSource = dt;
                ddlVideojuegos.DataTextField = "Titulo";
                ddlVideojuegos.DataValueField = "VideojuegoID";
                ddlVideojuegos.DataBind();
                ddlVideojuegos.Items.Insert(0, new ListItem("-- Seleccione --", "0"));
            }
        }

        private void CargarPlataformas()
        {
            using (SqlConnection con = new SqlConnection(conexion))
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT PlataformaID, Nombre FROM Plataforma", con))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                cblPlataformas.DataSource = dt;
                cblPlataformas.DataTextField = "Nombre";
                cblPlataformas.DataValueField = "PlataformaID";
                cblPlataformas.DataBind();
            }
        }

        private void CargarAsociaciones(int videojuegoID)
        {
            foreach (ListItem item in cblPlataformas.Items)
                item.Selected = false;

            using (SqlConnection con = new SqlConnection(conexion))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT PlataformaID FROM VideojuegoPlataforma WHERE VideojuegoID = @VideojuegoID", con);
                cmd.Parameters.AddWithValue("@VideojuegoID", videojuegoID);

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    string plataformaID = reader["PlataformaID"].ToString();
                    ListItem item = cblPlataformas.Items.FindByValue(plataformaID);
                    if (item != null)
                        item.Selected = true;
                }
            }
        }

        protected void ddlVideojuegos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (int.TryParse(ddlVideojuegos.SelectedValue, out int id) && id > 0)
            {
                CargarAsociaciones(id);
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(ddlVideojuegos.SelectedValue, out int videojuegoID) || videojuegoID == 0)
                return;

            using (SqlConnection con = new SqlConnection(conexion))
            {
                con.Open();

                // Eliminar asociaciones previas
                SqlCommand deleteCmd = new SqlCommand("DELETE FROM VideojuegoPlataforma WHERE VideojuegoID = @VideojuegoID", con);
                deleteCmd.Parameters.AddWithValue("@VideojuegoID", videojuegoID);
                deleteCmd.ExecuteNonQuery();

                // Insertar nuevas asociaciones
                foreach (ListItem item in cblPlataformas.Items)
                {
                    if (item.Selected)
                    {
                        SqlCommand insertCmd = new SqlCommand("INSERT INTO VideojuegoPlataforma (VideojuegoID, PlataformaID) VALUES (@VideojuegoID, @PlataformaID)", con);
                        insertCmd.Parameters.AddWithValue("@VideojuegoID", videojuegoID);
                        insertCmd.Parameters.AddWithValue("@PlataformaID", item.Value);
                        insertCmd.ExecuteNonQuery();
                    }
                }
            }

            // Refrescar la selección actual
            CargarAsociaciones(videojuegoID);

            // Refrescar tabla de asociaciones
            CargarGridAsociaciones();
        }

        private void CargarGridAsociaciones()
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                string consulta = @"
                    SELECT v.Titulo AS Videojuego, p.Nombre AS Plataforma
                    FROM VideojuegoPlataforma vp
                    INNER JOIN Videojuego v ON vp.VideojuegoID = v.VideojuegoID
                    INNER JOIN Plataforma p ON vp.PlataformaID = p.PlataformaID
                    ORDER BY v.Titulo, p.Nombre";

                SqlDataAdapter da = new SqlDataAdapter(consulta, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvAsociaciones.DataSource = dt;
                gvAsociaciones.DataBind();
            }
        }
    }
}
