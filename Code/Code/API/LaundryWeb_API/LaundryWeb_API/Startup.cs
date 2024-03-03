using LaundryWeb_DLL.DBHelper;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using System.IO;

namespace LaundryWeb_API
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            app.UseCors(options => options.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader());
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            if (!Directory.Exists(Path.Combine(Directory.GetCurrentDirectory(), @"Public")))
                Directory.CreateDirectory(Path.Combine(Directory.GetCurrentDirectory(), @"Public"));

            app.UseStaticFiles();
            app.UseStaticFiles(new StaticFileOptions()
            {
                FileProvider = new PhysicalFileProvider(Path.Combine(Directory.GetCurrentDirectory(), @"Public")),
                RequestPath = new PathString("/Public")
            });
            app.UseRouting();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
            DBHelper.connectionString = Configuration["ConnectionStrings:DefaultConnection"];
            Utility.EmialFrom = Configuration["EmailSetting:EmailFrom"];
            Utility.UserName = Configuration["EmailSetting:UserName"];
            Utility.Password = Configuration["EmailSetting:Password"];
            Utility.SMTPHost = Configuration["EmailSetting:smtpHost"];
            Utility.Port = Configuration["EmailSetting:port"];
            Utility.enableSSL = Configuration["EmailSetting:enableSSL"];
        }
    }
}
