""" Script to change the fold colors in Gruvbox and Gruvbox Material """
import os
import re
from glob import glob



def get_path_gruv():
    """ Function to change the parameters """
    home = os.path.expanduser("~")
    vim_dir = os.path.join(home, ".vim/")
    if not os.path.exists(vim_dir):
        raise ValueError("No .vim found")
    folder_vim = glob(os.path.join(vim_dir, "*"), recursive=True)
    gruv_path=""
    if folder_vim:
        for folder in folder_vim:
            if re.search("plugged", folder) is not None:
                gruv_path = os.path.join(folder, "gruvbox")
                break
    else:
        raise ValueError("No Plugged installed")
    return gruv_path

def get_path_gruv_material():
    """ Function to change the parameters """
    home = os.path.expanduser("~")
    vim_dir = os.path.join(home, ".vim/")
    if not os.path.exists(vim_dir):
        raise ValueError("No .vim found")
    folder_vim = glob(os.path.join(vim_dir, "*"), recursive=True)
    gruv_path=""
    if folder_vim:
        for folder in folder_vim:
            if re.search("plugged", folder) is not None:
                gruv_path = os.path.join(folder, "gruvbox-material")
                break
    else:
        raise ValueError("No Plugged installed")
    return gruv_path

def change_color_gruv(root_path: str)->None:
    """ Function to change the color """
    path_color = os.path.join(root_path, "colors/")
    new_line = "call s:HL('Folded', s:yellow, s:bg1, s:bold)\n"
    with open(os.path.join(path_color, "gruvbox.vim"), "r", encoding='utf-8') as reader:
        content= reader.readlines()
        content[550] = new_line
    with open(os.path.join(path_color, "gruvbox.vim"), "w", encoding='utf-8') as writer:
        writer.writelines(content)
    print("DONE")

def change_color_gruv_material(root_path: str)->None:
    """  Function to change the color of material """
    path_color = os.path.join(root_path, "colors/")
    new_line = "\tcall gruvbox_material#highlight\
        ('Folded', s:palette.yellow, s:palette.bg0, \"bold\")\n"
    with open(os.path.join(path_color, "gruvbox-material.vim"), "r", encoding='utf-8') as reader:
        content= reader.readlines()
        content[68] = new_line
    with open(os.path.join(path_color, "gruvbox-material.vim"), "w", encoding='utf-8') as writer:
        writer.writelines(content)
    print("DONE")

if __name__=="__main__":
    try:
        path = get_path_gruv()
        change_color_gruv(path)
        path = get_path_gruv_material()
        change_color_gruv_material(path)
    except ValueError as  err:
        print(f"Error on {err}")
