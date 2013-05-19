This is a ruby library for automating BBEdit. It doesn't do much right now, just lets you create results browsers. It comes with a demonstration command line tool called "bback" that takes search output from tools like [Ack](<http://beyondgrep.com>) and [The Silver Searcher](https://github.com/ggreer/the_silver_searcher). Use it like this:

    $ ag BBEdit | bback

And you'll see something like:

![Screenshot of "bback"](https://raw.github.com/matasar/bbedit_tools/master/img/bback_screen.png)

Colors are [Douce nuit](http://attaboy.tumblr.com/post/75614496/i-never-thought-about-sharing-my-colours-for) from [Luke Andrews](http://attaboy.ca).

The [code for bback](https://github.com/matasar/bbedit_tools/blob/master/bin/bback) is a simple demonstration of what it can do so far.
