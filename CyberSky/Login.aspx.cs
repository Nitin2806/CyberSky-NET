using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace CyberSky
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Page.Validate();

                if (Page.IsValid)
                {
                    string username = TextBox_Username.Text;
                    string password = TextBox_Password.Text;

                    string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["cyberskyConnectionString"].ConnectionString;

                    try
                    {
                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            string query = "SELECT COUNT(*) FROM users WHERE username = @Username AND password = @Password";
                            SqlCommand command = new SqlCommand(query, connection);
                            command.Parameters.AddWithValue("@Username", username);
                            command.Parameters.AddWithValue("@Password", password);

                            connection.Open();
                            int count = (int)command.ExecuteScalar();
                            connection.Close();

                            if (count > 0)
                            {
                                query = "SELECT * FROM users WHERE username = @Username";
                                command = new SqlCommand(query, connection);
                                command.Parameters.AddWithValue("@Username", username);

                                connection.Open();
                                SqlDataReader reader = command.ExecuteReader();
                                if (reader.Read())
                                {
                                    Session["LoggedIn"] = true;
                                    Session["userId"] = reader["userId"];
                                    Session["userType"] = reader["userType"];
                                    Session["Username"] = reader["username"].ToString();
                                    Session["Email"] = reader["email"].ToString();
                                    Session["Address1"] = reader["address1"].ToString();
                                }
                                reader.Close();
                                connection.Close();

                                Response.Redirect("Products.aspx");
                            }
                            else
                            {
                                ErrorMessage.Text = "Invalid username or password.";
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        ErrorMessage.Text = $"An error occurred: {ex.Message}";
                    }
                }
            }
        }
        protected void Button_Register_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}
