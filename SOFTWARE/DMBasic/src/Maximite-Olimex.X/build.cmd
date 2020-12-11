rem copy build.cmd to ~ (aka z:/users/paul)
cd Z:\Users\paul\Documents\Source\DuinoMite\SOFTWARE\DMBasic\src\Maximite-Olimex.X
make -f Makefile.mak clean create 
make -f Makefile.mak build -j2
cd Z:\Users\paul\


rem tasks.json
rem {
rem     // See https://go.microsoft.com/fwlink/?LinkId=733558
rem     // for the documentation about the tasks.json format
rem     "version": "2.0.0",
rem     "tasks": [
rem         {
rem             "label": "Build",
rem             "type": "process",
rem             "command": "/Applications/Wine Devel.app/Contents/Resources/wine/bin/wine",
rem             "args": ["start", "/b", "/wait", "z:/users/paul/build.cmd"],
rem             "group": {
rem                 "kind": "build",
rem                 "isDefault": true
rem             }
rem         }
rem     ]
rem }
