# #3 Setting up the LIGO environment

Painters need a brush and a canvas, while developers need a good IDE experience. In this chapter we'll setup & install the ligo compiler and other useful tools.

## Installing the compiler

At the moment, there are several ways of how you can install the LIGO compiler:

- **[With Docker](https://ligolang.org/docs/setup/installation/#dockerized-installation-recommended)**
- **[As a debian package](https://ligolang.org/docs/setup/installation/#debian-linux-package-installation)**
- **From sources directly**

Once you've installed LIGO, you can test out your installation as following:

```
ligo --help
```

#### Release schedule

Important thing to notice is that LIGO is currently being released on a rolling release schedule, this means that you always get the latest development features. You can find our [rolling builds at the CI](https://gitlab.com/ligolang/ligo/pipelines).

> ⚠️ Please note that the actual rolling releases of our Docker image and debian packages are made only from the `develop` branch.

## Setting up the IDE

Currently, LIGO offers support for [VSCode](https://code.visualstudio.com), including syntax highlighting and on-the-fly compilation error reporting. 

Available extensions:
- **[Syntax highlighting for PascaLIGO](https://marketplace.visualstudio.com/items?itemName=LigoLang.pascaligo-vscode)**
- **[On-the-fly compilation error reporting](https://marketplace.visualstudio.com/items?itemName=Ligo.ligo-tools)**

![error reporting](img/error-reporting.png)

---

## 🛠 Exercises

### #1 Testing out the compiler & IDE setup

In order to test if you have the LIGO compiler & the IDE set up correctly, you can try opening the *definitely not broken* `exercises/#1.../src/example.ligo` to see if it compiles. In case you get an error, you should be able to see a pop up on hover explaining you what's going on.

#### Advanced

If you're feeling lucky, try fixing the syntax error so the *red underline & a popup* go away.




> 💡 You can find the fixed `example.ligo` in the `solutions` folder
