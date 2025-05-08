# Use the official .NET SDK image to build and run the application
FROM mcr.microsoft.com/dotnet/sdk:6.0

# Set the working directory inside the container
WORKDIR /app

# Copy the csproj file and restore dependencies
COPY *.csproj ./
RUN dotnet restore

# Copy the rest of the application files
COPY . ./

# Publish the application in Release mode
RUN dotnet publish -c Release -o /app/publish

# Expose the application port
EXPOSE 80

# Set the entry point for the application
ENTRYPOINT ["dotnet", "/app/publish/YourAppName.dll"]
