using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Videojuegos_Plataformas
{
    public partial class Videojuegos : System.Web.UI.Page
    {
        string conexion = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarVideojuegos();
            }
        }

        private void CargarVideojuegos()
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Videojuego", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvVideojuegos.DataSource = dt;
                gvVideojuegos.DataBind();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                con.Open();
                string query;

                if (string.IsNullOrEmpty(hfID.Value))
                {
                    // Insertar
                    query = "INSERT INTO Videojuego (Titulo, Desarrollador, Lanzamiento) VALUES (@Titulo, @Desarrollador, @Lanzamiento)";
                }
                else
                {
                    // Actualizar
                    query = "UPDATE Videojuego SET Titulo=@Titulo, Desarrollador=@Desarrollador, Lanzamiento=@Lanzamiento WHERE VideojuegoID=@ID";
                }

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Titulo", txtTitulo.Text);
                    cmd.Parameters.AddWithValue("@Desarrollador", txtDesarrollador.Text);
                    cmd.Parameters.AddWithValue("@Lanzamiento", txtFecha.Text);

                    if (!string.IsNullOrEmpty(hfID.Value))
                        cmd.Parameters.AddWithValue("@ID", hfID.Value);

                    cmd.ExecuteNonQuery();
                }
                LimpiarFormulario();
                CargarVideojuegos();
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            LimpiarFormulario();
        }

        private void LimpiarFormulario()
        {
            txtTitulo.Text = "";
            txtDesarrollador.Text = "";
            txtFecha.Text = "";
            hfID.Value = "";
        }

        protected void gvVideojuegos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRow fila = gvVideojuegos.Rows[e.NewEditIndex];
            hfID.Value = gvVideojuegos.DataKeys[e.NewEditIndex].Value.ToString();
            txtTitulo.Text = fila.Cells[0].Text;
            txtDesarrollador.Text = fila.Cells[1].Text;
            txtFecha.Text = DateTime.Parse(fila.Cells[2].Text).ToString("yyyy-MM-dd");
        }

        protected void gvVideojuegos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvVideojuegos.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(conexion))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Videojuego WHERE VideojuegoID = @ID", con);
                cmd.Parameters.AddWithValue("@ID", id);
                cmd.ExecuteNonQuery();
            }
            CargarVideojuegos();
        }

        protected void gvVideojuegos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            LimpiarFormulario();
        }

        protected void gvVideojuegos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Esta función no se usa, botón "Editar" carga datos en el formulario para luego guardar.
            
        }
    }
}
