FROM microsoft/dotnet:2.1-sdk-nanoserver-sac2016 AS build
WORKDIR /src
COPY . .
RUN dotnet publish ParishRegistration.sln -c Release -o /app

FROM microsoft/dotnet:2.1-aspnetcore-runtime-nanoserver-sac2016
WORKDIR /app
EXPOSE 80
COPY --from=build /app .
ENTRYPOINT ["dotnet", "ParishRegistration.Server.dll"]
