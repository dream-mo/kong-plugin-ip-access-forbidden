# kong-plugin-ip-access-forbidden
This is a plug-in that prohibits access to Kong through ip or specified domain name. Users can customize the configuration of the prohibited ip or domain name, as well as the HTTP status code and message content of the response.
# How To Use ?
Move the entire ip-access-forbidden directory to /usr/local/share/lua/5.1/kong/plugins, and modify /etc/kong/kong.conf:
```text
plugins=bundled,ip-access-forbidden
```
Restart kong (kong restart) 
```shell script
kong restart
```

or reload (kong prepare && kong reload)
```shell script
kong prepare && kong reload
```

Verify that the plugin loaded successfully
```shell script
 curl -s 127.0.0.1:8001 | jq '.plugins.available_on_server' | grep 'ip-access-forbidden'
```
Use Konga to configure and view the effect

Add Plugin To Route
![image](https://user-images.githubusercontent.com/22147280/151648682-6a1749c7-5c8f-41db-92c3-997bc5c502f0.png)

Configure plugin parameters
![image](https://user-images.githubusercontent.com/22147280/151648708-c175481a-5a38-4420-84f1-3967f8a36185.png)

View interface requests
![image](https://user-images.githubusercontent.com/22147280/151648721-18dbaed4-87c2-4eba-8da5-1b6a51c1a544.png)
