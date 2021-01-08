# Azure Functions custom handler example

This is a simple example of an Azure Functions [custom handler](https://docs.microsoft.com/en-us/azure/azure-functions/functions-custom-handlers) written in C#.
Of course, Azure Functions supports C# quite nicely out-of-the-box, so typically there's no need for this if you're targeting C#. However, there are scenarios
where you might want to leverage the Azure Functions host model (elastic scale, triggers and bindings, consumption-based pricing, etc.) but use a different programming model
than functions-as-a-service.

Custom handlers run as a standalone HTTP endpoint adjacent to the Functions runtime, and invoked by the Functions runtime in response to Functions input:

![handlers-overview](https://docs.microsoft.com/en-us/azure/azure-functions/media/functions-custom-handlers/azure-functions-custom-handlers-overview.png)

This sample implements the handler as a standard ASP.NET Core Web API app.

## Pre-requisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop)

- [Powershell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.1)

- [Postman](https://www.postman.com/) or some other API testing tool

## Build and run

- clone the repo

- open a Powershell prompt in the [FunctionHost](./FunctionHost) folder

- execute the [build-and-run.ps1](./FunctionHost/build-and-run.ps1) script, which will:

	- delete any existing 'bin' and 'obj' folders
	- copy all source from [WebApplication1](./WebApplication1) to 'FunctionHost/src'
	- build a Docker image to host the Functions runtime and your custom ASP.NET endpoint (invoked by the Functions runtime) using [this](./FunctionsHost/Dockerfile) Dockerfile
	- start up a container using the image built in the last step

- to interact with the Functions app, use Postman or a similar tool to issue an HTTP GET:

```
http://localhost:5002/api/test/some-value
```
