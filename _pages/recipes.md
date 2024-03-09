---
title: "Original Recipes"
permalink: /recipes/
layout: archive
author_profile: true
regenerate: true
---

{% for page in site.recipes %}
  - [{{ page.title }}]({{ page.url }})
{% endfor %}
