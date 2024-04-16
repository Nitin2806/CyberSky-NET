using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;

namespace CyberSky
{
    public partial class Cart : System.Web.UI.Page
    {
        bool LoggedIn;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedIn"] != null && (bool)Session["LoggedIn"])
            {
                LoggedIn = true;
                if (!IsPostBack)
                {
                    LoadCartItems();
                }

            }
            else
            {
                LoggedIn = false;
                Response.Redirect("~/Login.aspx");
            }
            
        }
        

        private void LoadCartItems()
        {
            int userId = Convert.ToInt32(Session["UserId"]);

            string query = "SELECT c.productId, c.quantity, p.productName, p.productPrice, p.productBrand, p.productImage " +
                           "FROM [cart] c " +
                           "INNER JOIN [products] p ON c.productId = p.productId " +
                           "WHERE c.userId = @userId AND c.cartStatus = 'Pending'";

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cyberskyConnectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@userId", userId);

                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {

                            string productName = reader["productName"].ToString();
                            int productPrice = Convert.ToInt32(reader["productPrice"]);
                            string productBrand = reader["productBrand"].ToString();
                            int quantity = Convert.ToInt32(reader["quantity"]);


                            string cartItemHtml = $@"
                                <div class='cart-item bg-dark'> 
                                    <div class='cart-product'>{productName} ({productBrand})</div> 
                                    <div class='cart-quantity'>Quantity: {quantity}</div> 
                                    <div class='cart-price'>Total: ${productPrice * quantity}</div>
                                </div>";

                            Cart_box.Text += cartItemHtml;
                        }
                    }
                }
            }
        }
        protected void Button_Remove_Click(object sender, EventArgs e)
        {
            if (LoggedIn == false)
            {
                Response.Redirect("~/Login.aspx");
            }
            if (Session["LoggedIn"] != null && (bool)Session["LoggedIn"])
            {
                int userId = (int)Session["userId"];
                
                string query = "DELETE FROM [cart] WHERE [cartId] IN (SELECT TOP 1 [cartId] FROM [cart] WHERE [userId] = @userId AND [cartStatus] = 'Pending' ORDER BY [cartId] DESC)";
                string connectionString = ConfigurationManager.ConnectionStrings["cyberskyConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@userId", userId);
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }

                LoadCartItems();
                Response.Redirect("~/Cart.aspx");
            }
        }

        protected void Button_Clear_Click(object sender, EventArgs e)
        {
            if (Session["LoggedIn"] != null && (bool)Session["LoggedIn"])
            {
                int userId = (int)Session["userId"];
                string query = "DELETE FROM [cart] WHERE [userId] = @userId AND [cartStatus] = 'Pending'";
                string connectionString = ConfigurationManager.ConnectionStrings["cyberskyConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@userId", userId);
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }

                LoadCartItems();
                Response.Redirect("~/Cart.aspx");
            }
        }
        protected void Button_Checkout_Click(object sender, EventArgs e)
        {
            int userId = (int)Session["userId"];
            string connectionString = ConfigurationManager.ConnectionStrings["cyberskyConnectionString"].ConnectionString;
            string query = "UPDATE [cart] SET [cartStatus] = 'Purchased' WHERE [userId] = @userId AND [cartStatus] = 'Pending'";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@userId", userId);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
            LoadCartItems();
            Response.Redirect("~/Success.aspx");
        }
    }
}
