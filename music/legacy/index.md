---
title: Bitbear's Legacy Music
---

{:.jumbotron}
Bitbear's oldschool, legacy music was produced between 1995 and 2000 as
[tracker][] [modules][mod] in software such as [ProTracker], [Scream
Tracker][scream-tracker], [Fast Tracker II][fast-tracker], and [Impulse
Tracker][impulse-tracker].

<table>
  <thead>
    <tr>
      <th title="Release date" width="17%" class="r">Released</th>
      <th class="format">Format</th>
      <th>Title</th>
    </tr>
  </thead>
  <tbody>
  {% for post in site.categories['legacy'] %}
    <tr>
      <td class="r date" title="{{ post.date | date_to_long_string: 'ordinal', 'US' }}">
        {{ post.date | date: '%Y-%m-%d' }}
      </td>
      <td class="format">{{ post.media.format }}</td>
      <td><a href="{{ post.url }}">{{ post.title }}</a></td>
    </tr>
  {% endfor %}
  </tbody>
</table>

[fast-tracker]: https://en.wikipedia.org/wiki/FastTracker_2
[impulse-tracker]: https://en.wikipedia.org/wiki/Impulse_Tracker
[mod]: https://en.wikipedia.org/wiki/Module_file
[protracker]: https://en.wikipedia.org/wiki/ProTracker
[scream-tracker]: https://en.wikipedia.org/wiki/Scream_Tracker
[tracker]: https://en.wikipedia.org/wiki/Music_tracker
