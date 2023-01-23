---
title: Bitbear's Legacy Music
---

{:.jumbotron}
Bitbear's oldschool, legacy music was produced between 1995 and 2000 as
[tracker][] [modules][mod] in software such as [ProTracker], [Scream
Tracker][scream-tracker], [Fast Tracker II][fast-tracker], and [Impulse
Tracker][impulse-tracker].

<nav class="years">
Years:
<ol>
{% for post in site.categories['legacy'] %}
  {% assign current_year = post.date | date: '%Y' %}
  {% if prev_year != current_year %}
    <li><a href="#{{ current_year }}">{{ current_year }}</a></li>
  {% endif %}
  {% assign prev_year = post.date | date: '%Y' %}
{% endfor %}
</ol>
</nav>

{% assign prev_year = nil %}
{% for post in site.categories['legacy'] %}
  {% assign current_year = post.date | date: '%Y' %}
  {% if prev_year != current_year %}
    {% if prev_year != nil %}</tbody></table>{% endif %}
<h3 id="{{ current_year }}"><a href="#{{ current_year }}">{{ current_year }}</a></h3>
<table><thead><tr><th title="Release date" width="17%" class="r">Released</th>
      <th class="format">Format</th>
      <th>Title</th>
    </tr>
  </thead>
  <tbody>
    {% include song_table_row.html %}
  {% else %}
    {% include song_table_row.html %}
  {% endif %}
  {% assign prev_year = post.date | date: '%Y' %}
{% endfor %}
</tbody></table>

[fast-tracker]: https://en.wikipedia.org/wiki/FastTracker_2
[impulse-tracker]: https://en.wikipedia.org/wiki/Impulse_Tracker
[mod]: https://en.wikipedia.org/wiki/Module_file
[protracker]: https://en.wikipedia.org/wiki/ProTracker
[scream-tracker]: https://en.wikipedia.org/wiki/Scream_Tracker
[tracker]: https://en.wikipedia.org/wiki/Music_tracker
