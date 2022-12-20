---
title: Music Archive
---

{:.jumbotron}
Bitbear's oldschool music was produced between 1995 and 2000 as [tracker]
[modules][mod] in software such as [ProTracker], [Scream
Tracker][scream-tracker], [Fast Tracker II][fast-tracker], and [Impulse
Tracker][impulse-tracker].

{% assign children = site.pages | children_of: page | sort: 'created' %}
<table>
  <thead>
    <tr>
      <th title="Release date" width="17%" class="r">Released</th>
      <th>Title</th>
    </tr>
  </thead>
  <tbody>
  {% for child in children %}
    <tr>
      <td class="r">{{ child.created }}</td>
      <td><a href="{{ child.url }}">{{ child.title }}</a></td>
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
