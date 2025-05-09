# Use the official .NET SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

# Set the working directory in the container
WORKDIR /src

# Copy the project files and restore dependencies
COPY ["eShopOnWeb.API/eShopOnWeb.API.csproj", "eShopOnWeb.API/"]
RUN dotnet restore "eShopOnWeb.API/eShopOnWeb.API.csproj"

# Copy the rest of the code and publish
COPY . .
WORKDIR "/src/eShopOnWeb.API"
RUN dotnet publish "eShopOnWeb.API.csproj" -c Release -o /app/publish

# Use the official .NET Runtime image for the final image
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80

# Copy the app from the build image
COPY --from=build /app/publish .

# Set entrypoint to run the app
ENTRYPOINT ["dotnet", "eShopOnWeb.API.dll"]
