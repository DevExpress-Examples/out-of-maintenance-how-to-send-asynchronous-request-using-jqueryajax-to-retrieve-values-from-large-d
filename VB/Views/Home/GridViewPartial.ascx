<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%
    Html.DevExpress().GridView( _
           Sub(gridSettings)
               gridSettings.Name = "grid"
               gridSettings.CallbackRouteValues = New With {.Controller = "Home", .Action = "GridViewPartial"}
               gridSettings.KeyFieldName = "ProductID"
               gridSettings.Columns.Add("ProductID")
               gridSettings.Columns.Add("ProductName")
               gridSettings.Columns.Add("QuantityPerUnit")
               gridSettings.Columns.Add("UnitPrice")
               gridSettings.Columns.Add("", "#").SetDataItemTemplateContent( _
               Sub(c)
                   Html.DevExpress().HyperLink( _
                             Sub(lnkSettings)
                                 lnkSettings.NavigateUrl = String.Format("javascript:OnShowClick({0});", c.KeyValue)
                                 lnkSettings.Properties.Text = "Show"
                             End Sub).Render()
               End Sub)
               gridSettings.HtmlRowPrepared = _
                      Sub(s, e)
                          If (e.RowType = GridViewRowType.Data AndAlso Convert.ToBoolean(e.GetValue("Discontinued"))) Then
                              e.Row.BackColor = System.Drawing.Color.LightSalmon
                          End If
                      End Sub
        
           End Sub).BindToLINQ(String.Empty, String.Empty, New EventHandler(Of DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs)( _
           Sub(s, e)
               Dim context As New Example.Models.DataClassesDataContext()
               e.KeyExpression = "ProductID"
               e.QueryableSource = context.Products
           End Sub)).Render()
%>