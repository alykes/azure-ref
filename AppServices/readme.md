### Finding the list of available runtimes

- View a list of compatible runtimes available on linux  
`az webapp list-runtimes --os linux`  
This will dsiplay a list of runtimes, such as the following output:  
```
[
  "DOTNETCORE:7.0",
  "DOTNETCORE:6.0",
  "DOTNETCORE:3.1",
  "NODE:16-lts",
  "NODE:14-lts",
  "PYTHON:3.9",
  "PYTHON:3.8",
  "PYTHON:3.7",
  "PHP:8.0",
  "PHP:7.4",
  "RUBY:2.7",
  "JAVA:11-java11",
  "JAVA:8-jre8",
  "JBOSSEAP:7-java11",
  "JBOSSEAP:7-java8",
  "TOMCAT:10.0-java11",
  "TOMCAT:10.0-jre8",
  "TOMCAT:9.0-java11",
  "TOMCAT:9.0-jre8",
  "TOMCAT:8.5-java11",
  "TOMCAT:8.5-jre8"
]
```  
- View a list of compatible runtimes available on windows  
`az webapp list-runtimes --os windows`  
This will dsiplay a list of runtimes, such as the following output:  
```
[
  "dotnet:7",
  "dotnet:6",
  "DOTNETCORE:3.1",
  "ASPNET:V4.8",
  "ASPNET:V3.5",
  "NODE:16LTS",
  "NODE:14LTS",
  "PHP:7.4",
  "java:1.8:Java SE:8",
  "java:11:Java SE:11",
  "java:1.8:TOMCAT:10.0",
  "java:11:TOMCAT:10.0",
  "java:1.8:TOMCAT:9.0",
  "java:11:TOMCAT:9.0",
  "java:1.8:TOMCAT:8.5",
  "java:11:TOMCAT:8.5"
]
```

