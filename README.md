# Roku-Network-Sample

## To build
rm Test.zip

zip -r Test.zip . -x ".git/*" ".*" "notes.txt" "gemini.md"

## For Cert Injection
Change the cert in components/HttpsTask.brs
