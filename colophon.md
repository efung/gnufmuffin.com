---
layout: page
title: "Colophon"
---
# Hosting

This site was originally managed using [Blogger][] and hosted at a
<code>blogspot.com</code> domain. In August 2014, I converted it
to a static site generated 
using [Jekyll][] hosted on [GitHub Pages][] at a custom domain
registered at [Hover][]. Images continue to be stored on [Flickr][], and
video content on [YouTube][]. 

# Photography

I typically take photos with my Canon PowerShot S110. If I have time,
or if the composition demands it, I put my camera on a [GorillaPod][].
Most of the time, I take photos of food near a window or outside,
because I don't have a lightbox or bother with any sort of controlled
lighting.

If the photos need post-processing, I fix simple stuff like white balance
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
    - Wrote custom ones for monthly and yearly archive pages, followed ideas in
[http://www.mitsake.net/2012/04/archives-in-jekyll/](http://www.mitsake.net/2012/04/archives-in-jekyll/)
    - [https://github.com/pattex/jekyll-tagging/](https://github.com/pattex/jekyll-tagging/)
    - [https://github.com/jekyll/jekyll-redirect-from](https://github.com/jekyll/jekyll-redirect-from)
1. Forked [blogger2jekyll](https://github.com/efung/blogger2jekyll), a tool
written in Node.js to ease migrating from Blogger to Jekyll. I extended
the tool to include a few more things in the YAML front matter:
    - Generate array of tags from labels
    - Generate post excerpt
    - Extract Flickr thumbnail from first image
    - Added a `redirect_from` to handle domain migration (see below)
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
1. To redirect users from the old pages hosted at Blogger to the new
site, I had to jump through some hoops. 
    1. These two pages were of immense help:
        - [http://blog.coolaj86.com/articles/migrate-from-blogger-to-ruhoh-with-proper-redirects.html]
(http://blog.coolaj86.com/articles/migrate-from-blogger-to-ruhoh-with-proper-redirects.html)
        - [http://staxmanade.com/2014/04/migrating-blogspot-to-octopress-part-6-301-redirect-old-posts-to-new-location/](http://staxmanade.com/2014/04/migrating-blogspot-to-octopress-part-6-301-redirect-old-posts-to-new-location/)
    2. Blogger does not provide the ability to automatically set up a
301 redirect. Nor does it provide a template variable that has just the
permalink path, only the complete URL. Otherwise, redirection would have
been easy, as the pages migrated over to Jekyll use the same permalink
structure.
    3. To workaround this, I first modified the migration tool to 
generate a `redirect_from` key and a relative path value containing the 
Blogger post ID (UUID).
    4. Next, I added `<meta>` entries in my Blogger classic template to
redirect users to the new domain, as well as redirect individual posts
to the path containing the post ID.
    5. This approach isn't perfect, as search pages (`/search?q=term`)
and archives (`/2014/08/`) can't be redirected.
    6. Even though the classic template is required to add the `<meta>`
fields and to provide redirection, the mobile version in the upgraded
template interferes with redirection. That is, Blogger 
appends a `?m=1` query when the user agent is detected to
be mobile. To disable this, you need to switch to the upgraded template,
disable the mobile version, then switch back to classic.
    7. Once I verified the redirection was working in desktop and mobile
browsers, I deleted the sidebar, post body and footer in the classic 
Blogger template which should speed load times.

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
[ImageMagick]: http://www.imagemagick.org/ "ImageMagick"
