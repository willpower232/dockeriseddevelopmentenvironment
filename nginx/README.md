# NGINX

## Daemon

Provides a webserver for accessing portainer and your PHP websites in development.

I use [FiloSottile/mkcert](https://github.com/FiloSottile/mkcert) on the computers main OS to generate a wildcard certificate for `*.zz.zz` or whatever my domain is and then include that certificate in the `ssl` directory.

This is critical for websocket and service worker development and also a good thing to get used to.

I've also added a short directory lister for `http://zz.zz` which lists the git repositories you have and, if there is a `public_html` folder, functions as a link to the website in your development environment.

nginx needs the executable permission on every directory up to where your files are hosted

```
chmod +x /home/
chmod +x /home/username
chmod +x /home/username/siteroot
```
