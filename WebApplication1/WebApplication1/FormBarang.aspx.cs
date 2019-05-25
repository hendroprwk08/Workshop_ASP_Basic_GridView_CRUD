using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
   
    public partial class FormBarang : System.Web.UI.Page
    {

        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) loadGrid();
        }

        private void loadGrid()
        {
            DatabaseClass d = new DatabaseClass();

            try
            {
                d.openDb();
                var s = "select * from barang";
                dt = new DataTable();
                dt = d.read(s);
                
                /*
                Console.WriteLine(dt.Rows.Count.ToString());
                if (dt.Rows.Count == 0)
                {
                    DataRow row = dt.NewRow();
                    dt.Rows.Add(row); 
                }
                 * */

                gv.DataSource = dt;
                gv.DataBind();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                d.closeDB();
            }
        }

        protected void onPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv.PageIndex = e.NewPageIndex;
            loadGrid();
        }

        protected void onRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv.EditIndex = -1;
            loadGrid();
        }

        protected void onRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Insert"))
            {
                
            }
        }

        protected void onRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DatabaseClass d = new DatabaseClass();

            try
            {
                string id = (gv.Rows[e.RowIndex].FindControl("lbl_id") as Label).Text.ToString().Trim();

                d.openDb();
                var s = "delete barang where id_barang = '" + id + "'";
                Console.WriteLine(s);
                d.execute(s);

                onRowCancelingEdit(null, null);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                d.closeDB();
            }
        }

        protected void onRowEditing(object sender, GridViewEditEventArgs e)
        {
            gv.EditIndex = e.NewEditIndex;
            loadGrid();
        }

        protected void onRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DatabaseClass d = new DatabaseClass();

            try
            {
                string id = (gv.Rows[e.RowIndex].FindControl("lbl_id") as Label).Text.ToString().Trim();
                string nama = (gv.Rows[e.RowIndex].FindControl("tb_nama") as TextBox).Text.ToString().Trim();
                string jenis = (gv.Rows[e.RowIndex].FindControl("tb_jenis") as TextBox).Text.ToString();
                string harga = (gv.Rows[e.RowIndex].FindControl("tb_harga") as TextBox).Text.ToString().Trim();

                d.openDb();

                var s = "update barang set nama = '" + nama + "', jenis = '" + jenis + "', " + 
                        "harga = " + harga + "  where id_barang = '" + id + "'";
                Console.WriteLine(s);
                d.execute(s);

                onRowCancelingEdit(null, null);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                d.closeDB();
            }
        }

        protected void bt_simpan_Click(object sender, EventArgs e)
        {
            DatabaseClass d = new DatabaseClass();

            string id = tb_id.Text.ToString();
            string nama = tb_nama.Text.ToString();
            string jenis = tb_jenis.Text.ToString();
            string harga = tb_harga.Text.ToString();

            if (nama.Length == 0 || jenis.Length == 0 || harga.Length == 0)
            {
                return;
            }

            try
            {
                d.openDb();

                var s = "insert into barang values " +
                    "('" + id + "', '" + nama + "', '" + jenis + "', " + harga + ")";

                d.execute(s);

                loadGrid();
                kosong();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                d.closeDB();
            }
        }

        private void kosong()
        {
            tb_id.Text = "";
            tb_nama.Text = "";
            tb_jenis.Text = "";
            tb_harga.Text = "";
        }
    }
}