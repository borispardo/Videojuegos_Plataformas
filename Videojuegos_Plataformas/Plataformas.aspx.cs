using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Videojuegos_Plataformas
{
    public partial class Plataformas : System.Web.UI.Page
    {
        private readonly string conexion = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

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
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Plataforma", con))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvPlataformas.DataSource = dt;
                gvPlataformas.DataBind();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNombre.Text))
                return;

            using (SqlConnection con = new SqlConnection(conexion))
            {
                con.Open();

                string query = string.IsNullOrEmpty(hfPlataformaID.Value)
                    ? "INSERT INTO Plataforma (Nombre) VALUES (@Nombre)"
                    : "UPDATE Plataforma SET Nombre = @Nombre WHERE PlataformaID = @ID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Nombre", txtNombre.Text.Trim());

                    if (!string.IsNullOrEmpty(hfPlataformaID.Value))
                        cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(hfPlataformaID.Value));

                    cmd.ExecuteNonQuery();
                }
            }

            LimpiarFormulario();
            CargarPlataformas();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            LimpiarFormulario();
        }

        private void LimpiarFormulario()
        {
            txtNombre.Text = string.Empty;
            hfPlataformaID.Value = string.Empty;
        }

        protected void gvPlataformas_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int index = e.NewEditIndex;
            hfPlataformaID.Value = gvPlataformas.DataKeys[index].Value.ToString();
            txtNombre.Text = gvPlataformas.Rows[index].Cells[0].Text;

            // También puedes agregar scroll a top con JavaScript si deseas
        }

        protected void gvPlataformas_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvPlataformas.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(conexion))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("DELETE FROM Plataforma WHERE PlataformaID = @ID", con))
                {
                    cmd.Parameters.AddWithValue("@ID", id);
                    cmd.ExecuteNonQuery();
                }
            }

            CargarPlataformas();
        }

        protected void gvPlataformas_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            LimpiarFormulario();
        }

        protected void gvPlataformas_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // La edición se maneja desde el formulario superior
        }
    }
}
