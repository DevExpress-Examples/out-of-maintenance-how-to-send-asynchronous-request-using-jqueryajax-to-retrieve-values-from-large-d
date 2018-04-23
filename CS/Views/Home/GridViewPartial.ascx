<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%
    Html.DevExpress().GridView(gridSettings => {
        gridSettings.Name = "grid";
        gridSettings.CallbackRouteValues = new { Controller = "Home", Action = "GridViewPartial" };

        gridSettings.Columns.Add("ProductID");
        gridSettings.Columns.Add("ProductName");
        gridSettings.Columns.Add("QuantityPerUnit");
        gridSettings.Columns.Add("UnitPrice");
        
        gridSettings.Columns.Add("", "#").SetDataItemTemplateContent(c => {
            Html.DevExpress().HyperLink(lnkSettings => {
                lnkSettings.NavigateUrl = String.Format("javascript:OnShowClick({0});", c.KeyValue);
                lnkSettings.Properties.Text = "Show";                
            }).Render();
        });

        /* mark Discontinued values */
        gridSettings.HtmlRowPrepared = (s, e) => {
            if (e.RowType == GridViewRowType.Data && Convert.ToBoolean(e.GetValue("Discontinued")))
                e.Row.BackColor = System.Drawing.Color.LightSalmon;
        };
        
        gridSettings.KeyFieldName = "ProductID";
        
    }).BindToLINQ(String.Empty, String.Empty, new EventHandler<DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs>((s, e) => {
        Example.Models.DataClassesDataContext context = new Example.Models.DataClassesDataContext();

        e.KeyExpression = "ProductID";
        e.QueryableSource = context.Products;
    })).Render();
%>
