This is a ruby library for automating BBEdit. BBEdit has a lot of power to be automated, but AppleScript has some nasty rough edges, and this library/set of tools will hopefully smooth things out a bit for me. It comes with a couple of very basic command line tools that may be useful by themselves or as simple proofs of concept.

One is called "bback" that takes search output from tools like [Ack](<http://beyondgrep.com>) and [The Silver Searcher](https://github.com/ggreer/the_silver_searcher). Even though BBEdit has very powerful multi file find and replace, I sometimes prefer to search with ag/ack when I'm going through huge codebases. Use it like this:

    $ ag BBEdit | bback

And you'll see something like:

![Screenshot of "bback"](https://raw.github.com/matasar/bbedit_tools/master/img/bback_screen.png)

Colors are [Douce nuit](http://attaboy.tumblr.com/post/75614496/i-never-thought-about-sharing-my-colours-for) from [Luke Andrews](http://attaboy.ca).

The [code for bback](https://github.com/matasar/bbedit_tools/blob/master/bin/bback) is a simple demonstration of what I have in mind for this library. Another tool is called "[bbclipping](https://github.com/matasar/bbedit_tools/blob/master/bin/bbclipping)", and inserts a clipping with the contents of ARGF. This makes it easier to synthesize clippings and run them on the command line.
