# Build stage
FROM microsoft/aspnetcore-build:2 AS build-env

WORKDIR /generator

# Restore
COPY api/api.csproj ./api/
RUN dotnet restore api/api.csproj

COPY tests/tests.csproj ./tests/
RUN dotnet restore tests/tests.csproj

# Copy src
COPY . .

# Test
RUN dotnet test tests/tests.csproj

# Publish
Run dotnet publish api/api.csproj -o /publish

#Runtime stage
FROM microsoft/aspnetcore-build:2
COPY --from=build-env /publish /publish
WORKDIR /publish
ENTRYPOINT ["dotnet","api.dll"]
