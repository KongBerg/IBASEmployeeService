FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine as build
WORKDIR /app
COPY . .
RUN dotnet restore
RUN dotnet publish -o /app/published-app
FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine as runtime
WORKDIR /app
COPY --from=build /app/published-app /app
EXPOSE 5000
ENV ASPNETCORE_HTTP_PORTS=5000
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser
ENTRYPOINT ["dotnet", "IBASEmployeeService.dll"]