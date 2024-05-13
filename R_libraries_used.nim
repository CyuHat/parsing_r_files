#[
    The goal of this script is to see which library I used in R and how much.
]#

# Libraries
# import os

# import os, sugar

# let files = collect(newSeq):
#   for file in walkFiles("*.r"):
#      file

# echo files

import os, sequtils

let
    targetFolder = ""
    targetExt = @[".r", ".R", ".Rmd", ".rmd", ".Qmd", ".qmd"]

proc scanFolder (tgPath: string, extLst: seq[string]): seq[string] =
    var
        fileNames: seq[string]
        path, name, ext: string
        
    for kind, obj in walkDir tgPath:
    
        if $kind == "pcDir" :
            fileNames = concat(fileNames, scanFolder(obj, extLst))

        (path, name, ext) = splitFile(obj)

        if ext in extLst:
            fileNames.add(obj)

    return fileNames 
            

var fileList = scanFolder(targetFolder, targetExt)   

for f in fileList:
    echo f
