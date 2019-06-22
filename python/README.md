# Python

## Interactive

Provides a Python-enabled terminal to run ansible. Have a look at the Dockerfile before you run it, you may want to include the ssh-keyscan of your servers.

I have an alias in my `.bashrc` along the lines of

```bash
alias bashpython='bash ~/containers/python/interactive.sh'
```

### Root Access

Add `-u 0` to the command in `interactive.sh`.
