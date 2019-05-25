<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormBarang.aspx.cs" Inherits="WebApplication1.FormBarang" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

    <div>
        <h3>Data Barang</h3>
        <asp:Label ID="Label1" runat="server" Text="#Barang"></asp:Label>
        <asp:TextBox ID="tb_id" runat="server"></asp:TextBox><br />
        <asp:Label ID="Label2" runat="server" Text="Nama"></asp:Label>
        <asp:TextBox ID="tb_nama" runat="server"></asp:TextBox><br />
        <asp:Label ID="Label3" runat="server" Text="Jenis"></asp:Label>
        <asp:TextBox ID="tb_jenis" runat="server"></asp:TextBox><br />
        <asp:Label ID="Label4" runat="server" Text="Harga"></asp:Label>
        <asp:TextBox ID="tb_harga" runat="server"></asp:TextBox><br />
        <asp:Button ID="bt_simpan" runat="server" Text="Simpan" OnClick="bt_simpan_Click" />

        <asp:GridView ID="gv" runat="server"
            AutoGenerateColumns="false" 
            EmptyDataText="Tak ada data" 
            ShowHeaderWhenEmpty ="true"
            AllowPaging="true"  
            PageSize="2" 
            OnPageIndexChanging="onPageIndexChanging"
            OnRowEditing="onRowEditing" 
            OnRowCancelingEdit="onRowCancelingEdit" 
            OnRowDeleting="onRowDeleting" 
            OnRowUpdating="onRowUpdating">
             <Columns>
                <asp:TemplateField HeaderText="#">
                    <ItemTemplate>
                        <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("ID_BARANG") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("ID_BARANG") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="NAMA">
                    <ItemTemplate>
                        <asp:Label ID="lbl_nama" runat="server" Text='<%# Eval("NAMA") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="tb_nama" runat="server" Text='<%# Eval("NAMA") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="JENIS">
                    <ItemTemplate>
                         <asp:Label ID="lbl_jenis" runat="server" Text='<%# Eval("JENIS") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="tb_jenis" runat="server" Text='<%# Eval("JENIS") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="HARGA">
                    <ItemTemplate>
                        <asp:Label ID="lbl_harga" runat="server" Text='<%# Eval("HARGA") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="tb_harga" runat="server" Text='<%# Eval("HARGA") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="" ItemStyle-Width="120">
                    <ItemTemplate>
                        <asp:Button  ID="bt_ubah" runat="server" CommandName="Edit" Text="Ubah" /></Button>
                        <asp:Button  ID="bt_hapus" runat="server" CommandName="Delete" Text="Hapus" /></Button>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button  ID="bt_perbarui" runat="server" CommandName="Update" Text="Perbarui" /></Button>
                        <asp:Button  ID="bt_batal" runat="server" CommandName="Cancel" Text="Batal" /></Button>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
