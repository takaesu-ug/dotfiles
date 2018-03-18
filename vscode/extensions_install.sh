#/bin/bash

for ext in `cat extensions`; do
    code --install-extension $ext
done
