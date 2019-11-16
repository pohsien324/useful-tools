# Replace Strings From Files
These scripts provider a faster way to replace all the specific strings in your folder.

## Quick Start
1. Clone the repository.
```
$ git clone https://github.com/pohsienshih/useful-tools.git
$ cd replace-strings-from-files
```
2. Configure the strings you want to replace into `replace.txt`.
```config
oringinal_string5 new_string1
oringinal_string5 new_string2
oringinal_string5 new_string3
...
```
3. Place the `replace.txt` and `replace_run.sh` into the root path of your folder. Then execute the script, it will recursively search directories for files matching patterns and replace the strings in these files.
```bash
$ cp -r replace* <yourfolder>
$ bash replace_run.sh
```

## Demo
![](https://i.imgur.com/YHmnVLU.gif)


