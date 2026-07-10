{ pkgs, ... }:

{ 
  programs = {
    bash = {
      interactiveShellInit = ''
        if ! [ "$TERM" = "dumb" ] && [ -z "$BASH_EXECUTION_STRING" ]; then
          exec nu
        fi
      '';
    };
  };
}
