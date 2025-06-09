using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Videojuegos_Plataformas
{
    public partial class Plataformas : System.Web.UI.Page
    {
        string conexion = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)  
        {
            if (!IsPostBack)
            {
                CargarPlataformas();
            }
        }

        private void CargarPlataformas()
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Plataforma", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvPlataformas.DataSource = dt;
                gvPlataformas.DataBind();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(conexion))
            {
                con.Open();
                string query;

                if (string.IsNullOrEmpty(hfPlataformaID.Value))
                {
                    query = "INSERT INTO Plataforma (Nombre) VALUES (@Nombre)";
                }
                else
                {
                    query = "UPDATE Plataforma SET Nombre=@Nombre WHERE PlataformaID=@ID";
                }

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                    if (!string.IsNullOrEmpty(hfPlataformaID.Value))
                        cmd.Parameters.AddWithValue("@ID", hfPlataformaID.Value);

                    cmd.ExecuteNonQuery();
                }
                LimpiarFormulario();
                CargarPlataformas();
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            LimpiarFormulario();
        }

        private void LimpiarFormulario()
        {
            txtNombre.Text = "";
            hfPlataformaID.Value = "";
        }

        protected void gvPlataformas_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRow fila = gvPlataformas.Rows[e.NewEditIndex];
            hfPlataformaID.Value = gvPlataformas.DataKeys[e.NewEditIndex].Value.ToString();
            txtNombre.Text = fila.Cells[0].Text;
        }

        protected void gvPlataformas_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvPlataformas.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(conexion))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Plataforma WHERE PlataformaID = @ID", con);
                cmd.Parameters.AddWithValue("@ID", id);
                cmd.ExecuteNonQuery();
            }
            CargarPlataformas();
        }

        protected void gvPlataformas_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            LimpiarFormulario();
        }

        protected void gvPlataformas_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // El botón de edición carga el formulario superior
        }
    }
}
