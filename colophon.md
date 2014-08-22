---
layout: page
title: "Colophon"
---
# Hosting

This site was originally managed using [Blogger][] and hosted at a
<code>blogspot.com</code> domain. Now, it is a static site generated 
using [Jekyll][] hosted on [GitHub Pages][] at a custom domain
registered at [Hover][]. Images continue to be stored on [Flickr][], and
video content on [YouTube][]. 

# Photography

I typically take photos with my Canon PowerShot S110. If I have time,
or if the composition demands it, I put my camera on a [GorillaPod][].
Most of the time, I take photos of food near a window or outside,
because I don't have a lightbox or bother with any sort of controlled
lighting.

If the photos nead post-processing, I fix simple stuff like white balance
or exposure using Mac OS X's Preview. [ImageMagick][] is what I use for 
creating montages. 

# Words

I write posts in [Markdown][], generate the site locally on my MacBook, 
then push it up to GitHub. Flickr has Twitter integration to send out a 
tweet, so I include a link back to the blog entry in the photo
description. I tried using the Socialize feature of [FeedBurner][] but
it didn't allow customization of the tweet. 

# Migration from Blogger

Here is a very detailed list of things I did to move my content out of
Blogger:

1. Purchased a domain name (from [Hover][]).
1. Created a repository on GitHub, and set up GitHub Pages to use Jekyll
and a custom domain
1. Installed Jekyll locally so that I could make use of plugins, which
GitHub Pages doesn't support
1. Copied and customized the [Hyde theme](http://hyde.getpoole.com/) 
    - Configured Google Web Fonts, Font Awesome
    - Tweaked styling in CSS
    - Replaced the RSS template with one from
[https://github.com/snaptortoise/jekyll-rss-feeds](https://github.com/snaptortoise/jekyll-rss-feeds), augmenting it with a thumbnail image
1. Installed some Jekyll plugins 
    - Wrote custom plugins for monthly and yearly archive pages, followed ideas in
[http://www.mitsake.net/2012/04/archives-in-jekyll/](http://www.mitsake.net/2012/04/archives-in-jekyll/)
    - Installed
[https://github.com/pattex/jekyll-tagging/](https://github.com/pattex/jekyll-tagging/)
to handle tags
1. Forked [blogger2jekyll](https://github.com/efung/blogger2jekyll), a tool
written in Node.js to ease migrating from Blogger to Jekyll. I extended
the tool to include a few more things in the YAML front matter:
    - Generate array of tags from labels
    - Generate post excerpt
    - Extract Flickr thumbnail from first image
1. There were a number of existing HTML problems I had to fix in the
Blogger-hosted content:
    - A few links were absolute, pointing to a hosting provider I've long
since abandoned.
    - Some of the embedded Flickr images were using a very old URL path
that has since changed.
    - Most of the internal links were absolute, rather than relative.
These were cleaned up after importing the posts into Jekyll.
1. Created a [Disqus][] account for comments
    - Included the Universal Code in my post template
    - Imported my old Blogger comments into Disqus
1. Created a [Google Custom Search Engine][] to provide site search

[Blogger]: http://blogger.com/ "Blogger"
[Flickr]:  http://flickr.com/  "Flickr"
[Jekyll]:  http://jekyllrb.com/  "Jekyll"
[GitHub Pages]:  https://pages.github.com/ "GitHub Pages"
[YouTube]: https://www.youtube.com/ "YouTube"
[Markdown]: http://daringfireball.net/projects/markdown/ "Markdown"
[Hover]: http://www.hover.com/ "Hover"
[Feedburner]: http://www.feedburner.com/ "Feedburner"
[Disqus]: http://www.disqus.com/ "Disqus"
[GorillaPod]: http://joby.com/gorillapod "GorillaPod"
[Google Custom Search Engine]: https://www.google.com/cse/ "Google CSE"
