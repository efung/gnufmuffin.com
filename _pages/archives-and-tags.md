---
title: "Archives & Tags"
permalink: /archives/
redirect_from: /tags/
layout: archive
author_profile: true
regenerate: true
---

<h1 class="archive__subtitle">By date</h1>
<ul class="date-archive-year">
{% for post in site.posts %}
  {% capture month %}{{ post.date | date: '%m' }}{% endcapture %}
  {% capture nmonth %}{{ post.next.date | date: '%m' }}{% endcapture %}
  {% capture year %}{{ post.date | date: '%Y' }}{% endcapture %}
  {% capture nyear %}{{ post.next.date | date: '%Y' }}{% endcapture %}
    {% if year != nyear %}
      {% if forloop.index != 1 %}
          </ul>
      {% endif %}
          <li><a href="/{{ year }}/">{{ year }}</a></li>
          <ul>
    {% endif %}
    {% if month != nmonth %}
            <li><a href="/{{ year }}/{{ month }}/">{{ post.date | date: '%b' }}</a></li>
    {% endif %}
{% endfor %}
    </ul>
</ul>

{% assign tags_sorted = site.tags | sort %}
{% assign all_book_titles = site.data.books | map: "title_tag" %}

<h1 class="archive__subtitle">By tags</h1>
<ul class="taxonomy__index">
    {% for tag in tags_sorted %}
	  {% if all_book_titles contains tag[0] %}
        <li>
          <a href="/tag/{{ tag[0] | slugify }}">
			  <strong><i class="fa fa-book" aria-hidden="true"></i>  {{ tag[0] }}</strong> <span class="taxonomy__count">{{ tag[1].size }}</span>
          </a>
        </li>
	  {% endif %}
    {% endfor %}
    {% for tag in tags_sorted %}
	  {% unless all_book_titles contains tag[0] %}
        <li>
          <a href="/tag/{{ tag[0] | slugify }}">
			  <strong>{{ tag[0] }}</strong> <span class="taxonomy__count">{{ tag[1].size }}</span>
          </a>
        </li>
	  {% endunless %}
    {% endfor %}
</ul>

