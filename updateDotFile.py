import subprocess
import datetime
import shutil
import os

def get_gols_output():
    result = subprocess.run(['bash', '-c', 'cd .. && ~/go/bin/GoLS --tree --emoji --depth 2 ./wilovy.nix'], 
                            capture_output=True, text=True)
    return result.stdout

def replace_txt_block(file_path, new_content):
    with open(file_path, 'r') as file:
        lines = file.readlines()
    
    inside_block = False
    new_lines = []
    
    for line in lines:
        if line.strip() == '```txt':
            inside_block = True
            new_lines.append(line)
            new_lines.append(new_content)
        elif line.strip() == '```' and inside_block:
            inside_block = False
            new_lines.append(line)
        elif not inside_block:
            new_lines.append(line)
    
    with open(file_path, 'w') as file:
        file.writelines(new_lines)

def copy_configs():
    # List of config paths
    configs = [
        '~/.config/helix/languages.toml',
        '~/.config/picom',
        '~/.config/polybar',
        '~/.config/openbox',
        '~/..config/rofi'
    ]
    destination = './nixosModules/'
    
    for config in configs:
        # Expand '~' to the full path
        full_path = os.path.expanduser(config)
        if os.path.isfile(full_path):
            shutil.copy(full_path, f"{destination}/{os.path.basename(full_path)}")
        elif os.path.isdir(full_path):
            shutil.copytree(full_path, f"{destination}/{os.path.basename(full_path)}", dirs_exist_ok=True)

copy_configs()

file_path = 'README.md'
new_content = get_gols_output()
replace_txt_block(file_path, new_content)

current_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
commit_message = f"Commit realizado el {current_time}"
subprocess.run(['git', 'add', '.'], check=True)
subprocess.run(['git', 'commit', '-m', commit_message], check=True)
subprocess.run(['git', 'push', 'origin', 'master'], check=True)
