
Remove-Item -Force -Recurse -ErrorAction Ignore "..\WebApplication1\bin"

Remove-Item -Force -Recurse -ErrorAction Ignore "..\WebApplication1\obj"

Remove-Item -Force -Recurse -ErrorAction Ignore ".\src"

Copy-Item -Force -Recurse "..\WebApplication1\" -Destination "src"

docker build -t webapp:v1 .

docker run -e "ASPNETCORE_URLS=http://*:5002" -e "TEST_VAR=foobar" -p 5002:5002 -it webapp:v1
