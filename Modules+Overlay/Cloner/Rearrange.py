import os
import glob
import sys

print(sys.path[0])
print(os.path.dirname(os.path.realpath(__file__)))
path = os.path.dirname(os.path.realpath(__file__))

A = None
B = None
fileType = None

f= open(path + "//FileAtoB.txt","r")
if  f.mode == 'r':
    contents = f.readlines()
    A = '../' + contents[0]
    B = '../' + contents[1]
    fileType = contents[2]
f.close()



txtfilesA = []
pathA = path + '\\' + A.strip() + '\\*' + fileType
print("Getting files in  location A")
for file in glob.glob(pathA):
    txtfilesA.append(os.path.basename(file))

pathB = path + '\\' + B.strip() + '\\**\\*' + fileType
txtfilesB = []
print("Getting files in  location B")
for file in glob.glob(pathB,recursive=True):
    txtfilesB.append(os.path.basename(file))

result = set(txtfilesA) - set(txtfilesB)
print("attempting to Link files from A -> B")
totalFiles = len(result)
for fileA in result:
    src = path + '/' + A.strip() + '/' + fileA
    dst = path + '/' + B.strip() + '/' + fileA
    os.link(src,dst)
print("Copied " + str(totalFiles) + " files from A -> B")
  


txtfilesB2 = []
for file in glob.glob(pathB,recursive=True):
    txtfilesB2.append(file)

result = set(txtfilesB) - set(txtfilesA)
print("attempting to Link files from B -> A")
totalFiles = len(result)
for fileB in result:
    dst = path + '/' + A.strip() + '/' + fileB
    srcPath = None
    for fileB2 in txtfilesB2:
        srcPath = fileB2 if os.path.basename(fileB2) == fileB else srcPath
    os.link(srcPath,dst)

print("Copied " + str(totalFiles) + " files from B -> A")