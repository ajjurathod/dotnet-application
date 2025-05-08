# Use the official .NET SDK image to build and run the app in a single stage
FROM mcr.microsoft.com/dotnet/sdk:7.0

# Set the working directory in the container
WORKDIR /app

# Copy the project files and restore dependencies
COPY . .

# Build and publish the application to the /app directory
RUN dotnet publish -c Release -o /app/published

# Set the working directory to the published output folder
WORKDIR /app/published

# Expose port 80 for the application
EXPOSE 80

# Run the application
ENTRYPOINT ["dotnet", "YourApp.dll"]
