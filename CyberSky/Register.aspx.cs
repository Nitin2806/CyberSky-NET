using System;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web.UI;

namespace CyberSky
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
            protected void OnRegister_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Page.Validate();

                if (Page.IsValid)
                {
                    string username = TextBox_Username.Text;
                    string password = TextBox_Password.Text;
                    string email = TextBox_Email.Text;
                    string phone = TextBox_Phone.Text;
                    string address1 = TextBox_AddressLine1.Text;
                    string address2 = TextBox_AddressLine2.Text;
                    string city = TextBox_City.Text;
                    string province = TextBox_Province.Text;
                    string pincode = TextBox_Pincode.Text;

                    string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["cyberskyConnectionString"].ConnectionString;

                    try
                    {
                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            string query = "INSERT INTO users (email, password, username, phone, address1, address2, city, province, pincode, userType) VALUES (@Email, @Password, @Username, @Phone, @Address1, @Address2, @City, @Province, @Pincode, @userType)";
                            SqlCommand command = new SqlCommand(query, connection);
                            command.Parameters.AddWithValue("@Email", email);
                            command.Parameters.AddWithValue("@Password", password);
                            command.Parameters.AddWithValue("@Username", username);
                            command.Parameters.AddWithValue("@Phone", phone);
                            command.Parameters.AddWithValue("@Address1", address1);
                            command.Parameters.AddWithValue("@Address2", address2);
                            command.Parameters.AddWithValue("@City", city);
                            command.Parameters.AddWithValue("@Province", province);
                            command.Parameters.AddWithValue("@Pincode", pincode);
                            command.Parameters.AddWithValue("@userType", "User");

                            connection.Open();
                            command.ExecuteNonQuery();
                            connection.Close();

                            Session["LoggedIn"] = true;
                            Session["Username"] = username;
                            Session["Email"] = email;
                            Session["Phone"] = phone;
                            Response.Redirect("Products.aspx");
                        }
                    }
                    catch (SqlException ex)
                    {
                        if (ex.Number == 2627) 
                        {
                            ErrorMessage.Text = "This email or username is already registered.";
                        }
                        else
                        {
                            
                            ErrorMessage.Text = $"An error occurred: {ex.Message}";
                        }
                    }

                    catch (Exception ex)
                    {
                        
                        ErrorMessage.Text = $"An error occurred: {ex.Message}";
                    }
                }
            }
        }
    }
}
