using PlanoCondoAPI._4___Data;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.EntityFrameworkCore;
using PlanoCondoAPI._2___Interface;
using PlanoCondoAPI._2___Services;
using PlanoCondoAPI._3___Entities;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

var ConnectionSQLServer = builder.Configuration.GetConnectionString("ConnectionSQLServer");
builder.Services.AddDbContext<APIDbContext>(options =>
                    options.UseSqlServer(ConnectionSQLServer));

builder.Services.AddScoped<IPlanService, PlansService>();
builder.Services.AddScoped<ITypePlansService, TypePlansService>();


builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthorization();

app.MapControllers();

app.Run();
