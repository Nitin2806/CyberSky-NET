using System;
using System.Configuration;
using System.Data.SqlClient;


namespace CyberSky
{
    public partial class Admin : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                DetailsViewHeader.Visible = false;
                DetailsView1.Visible = false;
            }

        }


        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            try
            {
                string productName = txtProductName.Text;
                int productPrice = Convert.ToInt32(txtProductPrice.Text);
                string productBrand = ddlProductBrand.SelectedItem.Text; ;
                string BrandId = ddlProductBrand.SelectedValue;
                int productQuantity = Convert.ToInt32(txtProductQuantity.Text);
                string productImage = txtProductImage.Text;

                string connectionString = ConfigurationManager.ConnectionStrings["cyberskyConnectionString"].ConnectionString;
                string query = "INSERT INTO products (productName, productPrice, productBrand,productQuantity,productImage,BrandId) VALUES (@ProductName, @ProductPrice, @ProductBrand, @productQuantity,@productImage,@BrandId)";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@ProductName", productName);
                        command.Parameters.AddWithValue("@ProductPrice", productPrice);
                        command.Parameters.AddWithValue("@ProductBrand", productBrand);
                        command.Parameters.AddWithValue("@productQuantity", productQuantity);
                        command.Parameters.AddWithValue("@productImage", productImage);
                        command.Parameters.AddWithValue("@BrandId", BrandId);

                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }

                lblProductError.Text = "Product added successfully!";
            }
            catch (Exception ex)
            {
                lblProductError.Text = "An error occurred: " + ex.Message;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            if (GridView1.SelectedIndex >= 0)
            {
                DetailsViewHeader.Visible = true;
                DetailsView1.Visible = true;
                DetailsView1.DataBind();
            }
            else
            {
                DetailsView1.Visible = false;
                DetailsViewHeader.Visible=false;

            }
        }



    }
}