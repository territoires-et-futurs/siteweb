# Territoires et futurs

## How to run (locally)

```bash

git clone git@github.com:territoires-et-futurs/siteweb.git ~/territoires-et-futurs-work
cd ~/territoires-et-futurs-work
git checkout develop && atom .
npm i
npm run spawn
# and then run :
npm i
export PATH=$PATH:/usr/local/go/bin && go version
hugo serve -b http://127.0.0.1:4545 -p 4545 --bind 127.0.0.1 -w
```

## How to Deploy

```bash
# --- #
export PATH=$PATH:/usr/local/go/bin && go version
git clone git@github.com:territoires-et-futurs/siteweb.git ~/territoires-et-futurs-work
cd ~/territoires-et-futurs-work
git checkout develop && atom .
export HUGO_BASE_URL=https://territoires-et-futurs.github.io/siteweb/
export HUGO_BASE_URL=https://territoiresetfuturs.fr
hugo -b ${HUGO_BASE_URL}
if [ -d ./docs/ ]; then
  rm -fr docs/
fi;
mkdir docs/
cp -fR public/* docs/
echo "territoiresetfuturs.fr" > docs/CNAME
echo "territoiresetfuturs.fr" > CNAME

git add -A && git commit -m "deploy" && git push -u origin HEAD

git flow release start 0.0.0

git flow release finish -s 0.0.0

```
