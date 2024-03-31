# golang

## interactive

This sort of works but most things expect `go` to be directly available so...

## cli

1. copy the folder as you do and then update the path in cli.sh so it is accurate otherwise it will never find the right cache folders
2. symlink the cli.sh file into your path so you can run `go` as if it were installed directly on your computer, you will probably need to make it executable
3. I'm using it to test dnscontrol so the env importing is important
