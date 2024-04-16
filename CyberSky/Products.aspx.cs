using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CyberSky
{
    public partial class Products : System.Web.UI.Page
    {
        bool LoggedIn;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedIn"] != null && (bool)Session["LoggedIn"])
            {
               LoggedIn = true;

            }
            else
            {
                LoggedIn= false;
            }
        }

        protected void DropDownList_Product_SelectedIndexChanged(object sender, EventArgs e)
        {
            int productId = Convert.ToInt32(DropDownList_Product.SelectedValue);
            string query = "SELECT * FROM [products] WHERE [productId] = @productId";
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cyberskyConnectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@productId", productId);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        Image_Product.ImageUrl = "~/Images/" + reader["productImage"].ToString();
                        Label_Name.Text = reader["productName"].ToString();
                        Label_Desc.Text = reader["productBrand"].ToString();
                        Label_Price.Text = "$"+reader["productPrice"].ToString();
                    }

                    reader.Close();
                }
            }

            TextBox_Quantity.Text = "";
        }
        protected void Button_Add_Click(object sender, EventArgs e)
        {
            if (LoggedIn == false)
            {
                Response.Redirect("~/Login.aspx");
            }
            int productId = Convert.ToInt32(DropDownList_Product.SelectedValue);
            int quantity = Convert.ToInt32(TextBox_Quantity.Text);

            int userId = Convert.ToInt32(Session["UserId"]);

            string cartStatus = "Pending";

            string query = "INSERT INTO [cart] (productId, quantity, userId, cartStatus) VALUES (@ProductId, @Quantity, @UserId, @CartStatus)";
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cyberskyConnectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ProductId", productId);
                    command.Parameters.AddWithValue("@Quantity", quantity);
                    command.Parameters.AddWithValue("@UserId", userId);
                    command.Parameters.AddWithValue("@CartStatus", cartStatus);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            Response.Redirect("Cart.aspx");
        }
    }
}
