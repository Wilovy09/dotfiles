def custom_path [] {
    let curr = pwd | str replace -r "/home/\\w+" "~" | split row "/"
    return ($curr | reverse | enumerate | each {|p| if $p.index != 0 { str substring 0..1 item } else { $p }} | get item | reverse | str join '/')
}

def is_ssh_session [] {
     if 'SSH_CONNECTION' in $env {
         true
     } else if 'SSH_CLIENT' in $env {
         true
     } else if 'SSH_TTY' in $env {
         true
     } else {
         false
     }
 }

def get_git_status [] {
    let staged = (do --ignore-errors { git diff --staged --name-only } | lines | length)
    let unstaged = (do --ignore-errors { git diff --name-only } | lines | length)
    let untracked = (do --ignore-errors { git ls-files --others --exclude-standard } | lines | length)
    let renamed = (do --ignore-errors { git diff --name-status } | lines | filter { |line| $line starts-with 'R' } | length)
    let deleted = (do --ignore-errors { git diff --name-status } | lines | filter { |line| $line starts-with 'D' } | length)
    
    let stashed = (do --ignore-errors { git stash list } | lines | length)
    
    let conflicted = (do --ignore-errors { git diff --name-only --diff-filter=U } | lines | length)
    
    let ahead_behind = (do --ignore-errors { git rev-list --left-right --count ...@{u} } | str trim | split row " ")
    let ahead = if ($ahead_behind | length) == 2 { ($ahead_behind | get 0 | into int) } else { 0 }
    let behind = if ($ahead_behind | length) == 2 { ($ahead_behind | get 1 | into int) } else { 0 }
    
    mut symbols = []
    
    if $conflicted > 0 { $symbols = ($symbols | append $"($conflicted)🔪") }
    
    if $ahead > 0 and $behind > 0 {
        $symbols = ($symbols | append $"🏎️($ahead) 🐢($behind)")
    } else if $ahead > 0 {
        $symbols = ($symbols | append $"($ahead)🏎️")
    } else if $behind > 0 {
        $symbols = ($symbols | append $"($behind)🐢")
    } else if $staged == 0 and $unstaged == 0 and $untracked == 0 {
        $symbols = ($symbols | append "💯")
    }
    
    if $untracked > 0 { $symbols = ($symbols | append $"($untracked)🤷") }
    if $stashed > 0 { $symbols = ($symbols | append $"($stashed)📦") }
    if $unstaged > 0 { $symbols = ($symbols | append $"($unstaged)📝") }
    if $staged > 0 { $symbols = ($symbols | append $"($staged)✅") }
    if $renamed > 0 { $symbols = ($symbols | append $"($renamed)🚚") }
    if $deleted > 0 { $symbols = ($symbols | append $"($deleted)🗑️") }
    
    $symbols | str join " "
}
def prompt_status [] {
    let last_status = $env.LAST_EXIT_CODE
    let superuser = (id -u) == 0
    let in_nix_shell = "IN_NIX_SHELL" in $env
    let in_distrobox = "DISTROBOX_HOST_HOME" in $env
    
    let user_char_color = if $superuser {
        "red"
    } else if not $nu.history-enabled {
        "#D485AD"
    } else if $in_nix_shell {
        "#82BCE5"
    } else {
        "normal"
    }

     let user_char = try {
         let name = (uname | get kernel-name)
         if $superuser {
             "☠"
         } else if (is_ssh_session) {
             ""
         } else if not $nu.history-enabled {
             "󰊪"
         } else if $in_nix_shell {
             ""
         } else if $in_distrobox {
             ""
         } else if $name == "Darwin" {
             ""
         } else {
             ""
         }
     } catch {
         ""
     }

    $"($user_char)(ansi reset)"
}

def create_left_prompt [] {
    let path = (custom_path)
    
    let git_segment = if (do --ignore-errors { git rev-parse --is-inside-work-tree } | complete | get exit_code) == 0 {
        let branch = do --ignore-errors { git branch --show-current } | str trim
        let status_symbols = (get_git_status)
        
        let status_color = if ($status_symbols | is-empty) {
            "green"
        } else {
            "yellow"
        }
        
        $"(ansi $status_color)[($branch)] ($status_symbols)(ansi reset)"
    } else {
        ""
    }

    let time_segment = (date now | format date '%H:%M:%S')

    $"($path) ($git_segment)\n($time_segment) (prompt_status)"
}

$env.PROMPT_COMMAND = { create_left_prompt }

$env.PROMPT_COMMAND_RIGHT = ""
