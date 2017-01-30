---
layout:     guidelines
title:      "How to write a post"
subtitle:   "wtf is markdown?"
collection: guidelines
permalink:  /guidelines/howto-posts/
---

## Table of Contents
{:.no_toc}

1. Automatic Table of Contents Here
{:toc}


### This site uses markdown

[wtf is markdown](https://en.wikipedia.org/wiki/Markdown)

We wont be teaching you this here so check out the [cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

## Tooling

Please note you can use tools like

| app | preview | online | Git |
| ---| --- | --- |
| http://markdownpad.com/| Y | N | N |
| vscode | N | N | Y |
| https://cloose.github.io/CuteMarkEd/ | Y | N | N |
| http://dillinger.io/ | Y | Y | N |
| Vsonline (our repo) | N | Y | Y |
| https://www.sublimetext.com/ | Y | N | Y |
| https://atom.io/ | Y | N | Y |

For me the preview functionality is important until you get the hang of the syntax, but the git integration is a nice to have as well.
Decide for yourself, but from my experience the atom editor is the nicest and is from the github team. Adding a couple of packages like markdown-editor and git-plus make things very easy.



## Some gotchas for coders

Code previews are possible, we use rouge highlighter for this and its built in to use these tags:

{ % highlight xml %}

Where xml is the code you are displaying, a full list is available [here](http://rouge.jneen.net/)

{ % endhighlight %}

Please note that there are no spaces between the { and the % if

{% highlight C# %}

using system;

public Boom
{
    return "Baby";
}

{% endhighlight %}

Something to remember is under your editor renders highlight you wont see the end result locally
