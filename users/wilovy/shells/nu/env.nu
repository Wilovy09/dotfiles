source ./prompt.nu

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR_VI_INSERT = {|| prompt_status }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| prompt_status }
$env.PROMPT_MULTILINE_INDICATOR = {|| prompt_status }

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'

$env.GITSTATUS_IGNORE_PATH = $"($env.HOME)/Contributions/nixpkgs"

^ssh-agent -c
    | lines
    | first 2
    | parse "setenv {name} {value};"
    | transpose -r
    | into record
    | load-env
