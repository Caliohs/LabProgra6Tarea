#pragma checksum "C:\Users\cca\Downloads\CursoProgramacion6Sabados-master\WebApplication\Pages\Vehiculo\Grid.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "bd8d7d9075eaf4417d11de37a050a9e6c8ed2c61"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(WebApplication.Pages.Vehiculo.Pages_Vehiculo_Grid), @"mvc.1.0.razor-page", @"/Pages/Vehiculo/Grid.cshtml")]
namespace WebApplication.Pages.Vehiculo
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\cca\Downloads\CursoProgramacion6Sabados-master\WebApplication\Pages\_ViewImports.cshtml"
using WebApplication;

#line default
#line hidden
#nullable disable
#nullable restore
#line 4 "C:\Users\cca\Downloads\CursoProgramacion6Sabados-master\WebApplication\Pages\_ViewImports.cshtml"
using System.Text.Json;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"bd8d7d9075eaf4417d11de37a050a9e6c8ed2c61", @"/Pages/Vehiculo/Grid.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"a565cc9ada5ce21329b585f5ecb4184b651909a1", @"/Pages/_ViewImports.cshtml")]
    public class Pages_Vehiculo_Grid : global::Microsoft.AspNetCore.Mvc.RazorPages.Page
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("class", new global::Microsoft.AspNetCore.Html.HtmlString("btn btn-primary"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-page", "Edit", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_2 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/App/Vehiculo/Grid.js"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper;
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\n\n<div class=\"container-fluid\">\n    <div class=\"card\">\n        <div class=\"card-header\">\n            Vehiculo\n        </div>\n        <div class=\"card-body\">\n\n            ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("a", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "bd8d7d9075eaf4417d11de37a050a9e6c8ed2c614518", async() => {
                WriteLiteral("\n                <i class=\'bx bx-add-to-queue\'></i>\n            ");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Page = (string)__tagHelperAttribute_1.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_1);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral(@"

            <div class=""row"">
                <div class=""col-12"">
                    <table id=""GridView"" class=""table table-bordered table-hover table-striped"">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Marca</th>
                                <th>Matricula</th>
                                <th>Color</th>
                                <th>Modelo</th>
                                <th>Fecha Modelo</th>
                                <th>Defectos</th>
                                <th>Estado</th>
                                <th>Acci??n</th>
                            </tr>
                        </thead>
                        <tbody>
");
#nullable restore
#line 34 "C:\Users\cca\Downloads\CursoProgramacion6Sabados-master\WebApplication\Pages\Vehiculo\Grid.cshtml"
                             foreach (var item in Model.GridList)
                            {

#line default
#line hidden
#nullable disable
            WriteLiteral("                <tr>\n                    <td>");
#nullable restore
#line 37 "C:\Users\cca\Downloads\CursoProgramacion6Sabados-master\WebApplication\Pages\Vehiculo\Grid.cshtml"
                   Write(item.VehiculoId);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\n                    <td>");
#nullable restore
#line 38 "C:\Users\cca\Downloads\CursoProgramacion6Sabados-master\WebApplication\Pages\Vehiculo\Grid.cshtml"
                   Write(item.MarcaVehiculo.Descripcion);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\n                    <td>");
#nullable restore
#line 39 "C:\Users\cca\Downloads\CursoProgramacion6Sabados-master\WebApplication\Pages\Vehiculo\Grid.cshtml"
                   Write(item.Matricula);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\n                    <td>");
#nullable restore
#line 40 "C:\Users\cca\Downloads\CursoProgramacion6Sabados-master\WebApplication\Pages\Vehiculo\Grid.cshtml"
                   Write(item.Color);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\n                    <td>");
#nullable restore
#line 41 "C:\Users\cca\Downloads\CursoProgramacion6Sabados-master\WebApplication\Pages\Vehiculo\Grid.cshtml"
                   Write(item.Modelo);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\n                    <td>");
#nullable restore
#line 42 "C:\Users\cca\Downloads\CursoProgramacion6Sabados-master\WebApplication\Pages\Vehiculo\Grid.cshtml"
                   Write(item.FechaModelo.ToString("dd/MM/yyyy"));

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\n                    <td>");
#nullable restore
#line 43 "C:\Users\cca\Downloads\CursoProgramacion6Sabados-master\WebApplication\Pages\Vehiculo\Grid.cshtml"
                   Write(item.Defectos);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\n                    <td>");
#nullable restore
#line 44 "C:\Users\cca\Downloads\CursoProgramacion6Sabados-master\WebApplication\Pages\Vehiculo\Grid.cshtml"
                    Write(item.Estado?"Activo":"Inactivo");

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\n                    <td>\n                        ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("a", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "bd8d7d9075eaf4417d11de37a050a9e6c8ed2c619290", async() => {
                WriteLiteral("\n                            <i class=\'bx bx-edit-alt\'></i>\n                        ");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Page = (string)__tagHelperAttribute_1.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_1);
            if (__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.RouteValues == null)
            {
                throw new InvalidOperationException(InvalidTagHelperIndexerAssignment("asp-route-id", "Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper", "RouteValues"));
            }
            BeginWriteTagHelperAttribute();
#nullable restore
#line 46 "C:\Users\cca\Downloads\CursoProgramacion6Sabados-master\WebApplication\Pages\Vehiculo\Grid.cshtml"
                                                                     WriteLiteral(item.VehiculoId);

#line default
#line hidden
#nullable disable
            __tagHelperStringValueBuffer = EndWriteTagHelperAttribute();
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.RouteValues["id"] = __tagHelperStringValueBuffer;
            __tagHelperExecutionContext.AddTagHelperAttribute("asp-route-id", __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.RouteValues["id"], global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\n                        <button type=\"button\" class=\"btn btn-primary\"");
            BeginWriteAttribute("onclick", "\n                                onclick=\"", 1918, "\"", 2006, 3);
            WriteAttributeValue("", 1960, "VehiculoGrid.OnClickEliminar(", 1960, 29, true);
#nullable restore
#line 50 "C:\Users\cca\Downloads\CursoProgramacion6Sabados-master\WebApplication\Pages\Vehiculo\Grid.cshtml"
WriteAttributeValue("", 1989, item.VehiculoId, 1989, 16, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 2005, ")", 2005, 1, true);
            EndWriteAttribute();
            WriteLiteral(">\n                            <i class=\'bx bx-trash\'></i>\n                        </button>\n                    </td>\n                </tr>");
#nullable restore
#line 54 "C:\Users\cca\Downloads\CursoProgramacion6Sabados-master\WebApplication\Pages\Vehiculo\Grid.cshtml"
                     }

#line default
#line hidden
#nullable disable
            WriteLiteral("\n                        </tbody>\n                    </table>\n\n\n                </div>\n            </div>\n\n\n        </div>\n    </div>\n\n</div>\n\n");
            DefineSection("Scripts", async() => {
                WriteLiteral("\n\n\n    ");
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("script", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "bd8d7d9075eaf4417d11de37a050a9e6c8ed2c6112946", async() => {
                }
                );
                __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
                BeginWriteTagHelperAttribute();
                __tagHelperStringValueBuffer = EndWriteTagHelperAttribute();
                __tagHelperExecutionContext.AddHtmlAttribute("defer", Html.Raw(__tagHelperStringValueBuffer), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.Minimized);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_2);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                WriteLiteral("\n   \n\n");
            }
            );
            WriteLiteral("\n");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<WebApplication.Pages.Vehiculo.GridModel> Html { get; private set; }
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.ViewDataDictionary<WebApplication.Pages.Vehiculo.GridModel> ViewData => (global::Microsoft.AspNetCore.Mvc.ViewFeatures.ViewDataDictionary<WebApplication.Pages.Vehiculo.GridModel>)PageContext?.ViewData;
        public WebApplication.Pages.Vehiculo.GridModel Model => ViewData.Model;
    }
}
#pragma warning restore 1591
