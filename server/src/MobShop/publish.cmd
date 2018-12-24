dotnet publish -c Release

docker build -t mobshop-server ./bin/release/netcoreapp2.1/publish

docker tag mobshop-server registry.heroku.com/mobshop-server/web

docker push registry.heroku.com/mobshop-server/web

heroku container:release web -a mobshop-server