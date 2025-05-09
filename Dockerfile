# Use the official .NET SDK image to build and run the app
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS base

# Set the working directory in the container
WORKDIR /app

# Copy project files and restore dependencies
COPY . . 
RUN dotnet restore "eShopOnWeb.API/eShopOnWeb.API.csproj"

# Build and publish the application in Release mode
RUN dotnet publish "eShopOnWeb.API.csproj" -c Release -o out

# Set the entrypoint to run the app
ENTRYPOINT ["dotnet", "out/eShopOnWeb.API.dll"]
