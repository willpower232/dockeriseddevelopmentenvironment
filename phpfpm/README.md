# PHP FPM

## Daemon

Provides a PHP FPM server with a few changes to the default settings.

## Interactive

You can also use your terminal to run composer and PHP-based commands.

I have an alias in my `.bashrc` to the tune of

```bash
alias bashphp='docker exec -it -w "$PWD" phpfpm bash'
```

### Root Access

Add `-u 0` to the command from the alias.
